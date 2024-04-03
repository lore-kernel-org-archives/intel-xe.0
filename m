Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A38ACD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38543112753;
	Wed,  3 Apr 2024 15:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgoBzbCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF064112753
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712156869; x=1743692869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2/sfDL7DAehWhmkQ92f4HItxcx/3JwbryqFBbQ0uZNY=;
 b=ZgoBzbCU/nnMEKGd+OVCRIonLXHK/DeFytW3SFp/ztVGiY+tIY4ui0G6
 dl0oo0sSmnYHY10mfQudFtgi59n1gi0YOXGwBCixyHSmJgiGmyETEgxAv
 OhVSSOLhncKt5KQmqQiFZ/id9fV92ciJyGCtifJ7UaEY58T/igeqhbpP9
 ZekSYBEFXqE4llI5I+uT6dX609ko6eUFNl6bhv0qw7ZxPkCaTp20FQAmU
 ToVrliMzm/bU2ijekLirm4XGfUTCBCMoLiMlE4oDSxehf5QUoWh9Onyed
 sTKANHWDAa9Eqa7qMyLCE290UETZXjRjBbKaJZtVQl+rkFSsnVgFbMKJQ A==;
X-CSE-ConnectionGUID: u15TVmLkSxK9gucAy/4T7Q==
X-CSE-MsgGUID: 84ZnqEUhRI2jDRtN4DuIaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7260693"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7260693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:07:46 -0700
X-CSE-ConnectionGUID: +RiZ1gRWRkOdU1NH6zKu6Q==
X-CSE-MsgGUID: tIcfuUhPSnCzommtxqncgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="55928531"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:07:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:07:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:07:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:07:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klZ5ZSdYxhhAaQf2RkvwskrvpPzXpwfa09Wx9aNZZWWnDfJ7FuIcTUXc8m6xZvqqcMHBDo7GksqS08CwPESnF+B9UWqBWX7rz+BewwuO9i6jMO9NKKCszCc3eHq3pYJk9JsdBQzvK21D2TZSSxCw0mzyKF/AlclsQ/FX3hls8of6jIvAlIcFPz9mdLma6a167xcnpRM7vJce/DppFCh52eY7WCqUsbdPN5oa6bYKQ4MTbHGuEheVmG2IY38gs4q4LZBTMARPErcnDimqlL9P/DERhI6isJfyVdveLlAjtzO7OacVlQ48lnEH65pDkQ7eeKtEYeqIAHkVVWq/ymIqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QMjAtbsMdQUWRmguuDLtZnDmo/yBVqViHAkyB9hpbw=;
 b=RQCqnc3PqfIWl5g42EY6ayWv5IlBRzPbpsRcPV4qPXy0AwYMc9cPu6ZA77L5hIu7rZHBmsQHrA01RaJ7vcNlBbrymLY6Q7tIJ9GODBjHIjsLWs1Pw756tKNkHADYtvYz5wBGsWI4Gc6t9zYyWvg1QN+wvOtINcHpHfKd0O+wLNxTbtE9G5jOmhmgqTm4GaUiNQq3XYWrg2ZqOclECZvoQd8lL9vLuKB/XVDBQJBOJpi0E3uMIbzU0eJ7GTWzPotE/RN2snjE1PA1yuXEc1bM21O3P9iPnhbYB53oGUGtcSU+FHR6wRPqzI7WuVZm2xF8i40wfz78EGdF2yISJKvrNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 15:07:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 15:07:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/4] drm/xe: Introduce a simple wedged state
Date: Wed, 3 Apr 2024 11:07:29 -0400
Message-ID: <20240403150732.102678-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403150732.102678-1-rodrigo.vivi@intel.com>
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:a03:60::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6172:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AQsoLz5IHrBvyONfLPeMRECPZGjfebXuvlSr0FYwz9hNzhaDb/VklsQYDfcfua6jSMc17bIBTz0lTgZVQ/kK1HFNsJCGJ+R1Ixc6sXpXPoBfD7BFv7qHf7R8Y07v/d1DmHWIRdc+FrIZHbyoUWv4QPIKls+yvnRpGukl+ACzByDa7stptIM0zY0XflI6XgX8pvgdvYJs2Wuwx2xDHLfJZFB6YWv1NOtixYGTZ7ZiAXU3DDhlps5QaBYJTSIBDTKvlY0tzYgqpMuufSCO+xFBxFuNWRfeQSZqVnF6mviwwlbITtxtD/gsJtyrz+5xSBaD5xDZkanmHXLkHRBUPhhUXaly99O54RUQm+NT8ySn8ABGB0wh3JxPm6QUA2w569VrnwJ6qZ2Yddh43RAbFHe2KWedg06JbxdfqxTxArPNVpK+AAB3oPdhGJdo3pPrF26sZd74FFonqnQXEb/CPLRx9SUQIZ3hp1XH6wLkNwMLWQgo5xIm0a6GdiLCmd6vnUJ1R0QxkH1SIV8F+EMO5q4C1pQpZWk4/9hFM4KXbpO5tVfGtbzmM8H+4RH6KyRCi8RmpmqEEPCKSMDcHRBFiJbpcqvejTa/esQllDTngA6PFOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk9FNnpVdjJ5R1dpak9BbENNUkV6cGZyVVNXbFRTVjgzRzNERGlEWHFHOEor?=
 =?utf-8?B?S21tZ25DWFdtWlVqL3BoR0RZM3VhSll2NXN3TVd1Y3BibnBXakt2L3JHeElZ?=
 =?utf-8?B?OXROSVdKZDNQSTBmME40UkZmOTBQS1N0NDNDb1MvREdWUDBkQmg4S0l1ZUE0?=
 =?utf-8?B?UUZYWGVnTVUwTmJFcGpMUGFJL1BBSm5DT0ZFSGJ2UkM1dmxQaDY4UjN1S2NU?=
 =?utf-8?B?cUMyaFdlS0V2NkN5M0ZGeEtwVGh2VDMvSkpuZDl4RWROSDFzMSt2VWhadmdF?=
 =?utf-8?B?cjBPMFMvV2h4RTNCZk4vSS9BUjhUcUN4eVBUa2J5TnVQblp6OW1MTmpsSW1r?=
 =?utf-8?B?RDZkT2xFNlpnL1Q5ZGJqMHRZZU5mZ1d1ZEppTTRBMEN4QVc3RlZYcXRpOXVr?=
 =?utf-8?B?S1hNb2ZmdzZjTlA5cGt4VEZZZVpKOWFQc2NkTnE3T0Y4eUwvQ2l1TVR3MDVM?=
 =?utf-8?B?UU1hQ3BBSWFaT0VOcTlaUXl0QVIvYUovZFl0QUJrNDMvakYwSGU0a1B4c1Uv?=
 =?utf-8?B?MjFmdFk4cnhYWlJSeEllUnBPVnNOZDNTalkxUm9mZWFpeVcvMTNKeEptUFlz?=
 =?utf-8?B?NnBaY3ZhUUI5bkMrZTdWUWd5N3FKci9tejhJS20zMzZEZjVJNlNKeDI4NWtz?=
 =?utf-8?B?UnBLc2FSdTRGUnR0WDk0U0NJWDd5TzY5MzY5Ky9naURYV05XWmlkU0JEVTE2?=
 =?utf-8?B?WDVkcU1RVjd5QURuV1Vta3p5QkxrLzRkbjUvcitGUnpKaDZPQnYrV2pwTmcv?=
 =?utf-8?B?NTk0YVpjSWp3OW9HbksxSG1nMW1lVFRPQUd5THpKRHVnNlVXZkl5RHFzSUpZ?=
 =?utf-8?B?ZGZTcWRYMXZnZTBJTFhUV1ZoOXBIV0IwSTJ2Q1phbG51TEdYa3J4d1NPRGZ5?=
 =?utf-8?B?bjMrR1hFS0pxOVYrTTllQXpHUitsMXpxQmMxS3hzRVdjL2NFN255MWk0Znor?=
 =?utf-8?B?bUlmZGRGMXdxa2paVzNvaUJEOWxWNjNmc1MzM2NybUxIc0V2K3MyVVlNajNx?=
 =?utf-8?B?dzNaNngxMGVpNWpTMVU2S0plQXg0bXR6ak1YQmhsNUJNYkZvNDNnUnRiZWdp?=
 =?utf-8?B?Y25rTUVUbjlMWUU2TFNUekw0dVJCWHMxRXcxWjd3RGtQQ2RTSmJmUnBVZTZI?=
 =?utf-8?B?V2R2TlY2SFo5aHY5OHRLMmR3bHZFL213eHpERXYzYzRyakx2Ri8zbHZocVh3?=
 =?utf-8?B?ckU2Um5PZ2svOU4vbEEyOGFoa1NvWlNOTmFRNUJWbDY2UEV1WU16b0FEOTlQ?=
 =?utf-8?B?ZTg4UmdGblo0VkIwV1BkNWxvVlVvTUZ4NkZ6ZkFiTWNjd0RsZVU2WHRJSmVM?=
 =?utf-8?B?QlZjeFp6NEtrV1ZlQXRvRHo1MkNCV01HTTJNaWxheVVTbVh4RnF4c1Y1L2hm?=
 =?utf-8?B?blhCcUxIMTVGclRkSFJ1azV2Y1doOFBWZStDVEo0UHhNMWZqVFJaYVNSUmRF?=
 =?utf-8?B?ZWZpeUVXN0VCaW95Z0xYdUhub2FPb2NZT0hOTVpRZ00rNGpJN1o4dTNPU05j?=
 =?utf-8?B?QXBRVVJWblBETnVNcUVHUlZCblk4RG5DUnpYOXJQeW96WHRWd28xT1QrSHNS?=
 =?utf-8?B?U2VXT1hyS0dvMmRaYTdLZjhEQm1Vd2lRSjB3Z2pXLzgrZDVkUVlnZVhYRloz?=
 =?utf-8?B?RlRzbEZpWlBqOFk2SE44bVNnYXhMMjFEa2JoZFYwbnVFbmp4bytKTWNNNVlm?=
 =?utf-8?B?MWFmWitnTEdiV1ZMdEh6ZHc5azlMeExJSGM1SVEzdzdsbHJSOE5zY2FCYklB?=
 =?utf-8?B?WFR1V3A4T1RlZjRDVnlyUUlpQm1hNUtFQzBpdnBhdVZsbmtrczRtSTZXQkJm?=
 =?utf-8?B?ZU9mZzB6UzBtNllvYnhUTDRLVms2TU1hbHU4Y1VXNGp2bW5pcEh4MHBiSWRz?=
 =?utf-8?B?RmJMQ20yMUIxZWVoUVlWVFhIWWJuMkNYZlQ5eVI5ZmNKSy9PVE9uelFmQWFa?=
 =?utf-8?B?S3o4WFd4R1JoSUhVenArY2dlMkQrdmFoWmdRNVc5TE1mdnNGZkdjeXprT0ty?=
 =?utf-8?B?bUgxVjh4Qllrb1Fyck16VWEvT0ZsV3NCNUlNeWxVak1CSVdtT1crcXN4dWp3?=
 =?utf-8?B?aDZLUDRCVzY2Smp5ck1ObkJZbUt0TWxSb1lRbXVsMXUrd1FYVS9Hb1ltek5T?=
 =?utf-8?Q?EZcIFx8pav0njmhtp6n36LJzi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc2c966-d563-42e9-1851-08dc53efce2d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:07:40.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTdI4o93dVqUyt7v79VsEmxVVefN5DekJFnp3yA7EI1EQpOF906Jvz4jmZLwNh4aS4ZYHUxN2X2NwRpYDYEe5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Introduce a very simple 'wedged' state where any attempt
to access the GPU is entirely blocked.

On some critical cases, like on gt_reset failure, we need to
block any other attempt to use the GPU. Otherwise we are at
a risk of reaching cases that would force us to reboot the machine.

So, when this cases are identified we corner and block any GPU
access. No IOCTL and not even another GT reset should be attempted.

The 'wedged' state in Xe is an end state with no way back.
Only a device "re-probe" (unbind + bind) can restore the GPU access.

v2: - s/wedged/busted (Lucas)
    - use unbind+bind instead of module reload (Lucas)
    - added more info on unbind operations and instruction on bug report
    - only print the message once.

v3: - s/busted/wedged (Ashutosh, Tvrtko, Thomas)
    - don't assume user has sudo and tee available (Lucas)
    - do inner protections against command submission instead
      of avoiding only the migration for a more reliable protection.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c              |  6 ++++++
 drivers/gpu/drm/xe/xe_device.h              | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h        |  3 +++
 drivers/gpu/drm/xe/xe_gt.c                  |  5 ++++-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  3 +++
 drivers/gpu/drm/xe/xe_guc_ct.c              |  8 ++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c              |  3 +++
 drivers/gpu/drm/xe/xe_guc_submit.c          |  3 +++
 8 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 01bd5ccf05ca..7015ef9b00a0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_ioctl(file, cmd, arg);
@@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d413bc2c6be5..c532209c5bbd 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,24 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+static inline bool xe_device_wedged(struct xe_device *xe)
+{
+	return atomic_read(&xe->wedged);
+}
+
+static inline void xe_device_declare_wedged(struct xe_device *xe)
+{
+	if (!atomic_xchg(&xe->wedged, 1)) {
+		xe->needs_flr_on_fini = true;
+		drm_err(&xe->drm,
+			"CRITICAL: Xe has declared device %s as wedged.\n"
+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
+			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
+			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
+			dev_name(xe->drm.dev));
+	}
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1df3dcc17d75..0430bd51a5dd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,6 +455,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @wedged: Xe device faced a critical error and is now blocked. */
+	atomic_t wedged;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cfa5da900461..0844081b88ef 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	if (xe_device_wedged(gt_to_xe(gt)))
+		return -ECANCELED;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -685,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
-	gt_to_xe(gt)->needs_flr_on_fini = true;
+	xe_device_declare_wedged(gt_to_xe(gt));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 93df2d7969b3..3a6075021542 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -236,6 +236,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
+	if (xe_device_wedged(xe))
+		return 0;
+
 	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
 	    gt->uc.guc.submission_state.enabled) {
 		int seqno;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 6c37f4f9bddd..2047a49c71b7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -638,6 +638,9 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	unsigned int sleep_period_ms = 1;
 	int ret;
 
+	if (xe_device_wedged(ct_to_xe(ct)))
+		return -ECANCELED;
+
 	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
 	lockdep_assert_held(&ct->lock);
 	xe_device_assert_mem_access(ct_to_xe(ct));
@@ -1016,6 +1019,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	u32 *payload;
 	int ret = 0;
 
+	if (xe_device_wedged(xe)) {
+		ct->g2h_outstanding = 0;
+		return -ECANCELED;
+	}
+
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 521ae24f2314..f4663f1b0a80 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -902,6 +902,9 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 		return;
 	}
 
+	if (xe_device_wedged(xe))
+		return;
+
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 13b7e195c7b5..0a2a54f69f50 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -705,6 +705,9 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(guc);
 	bool lr = xe_exec_queue_is_lr(q);
 
+	if (xe_device_wedged(xe))
+		return ERR_PTR(-ECANCELED);
+
 	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		  exec_queue_banned(q) || exec_queue_suspended(q));
 
-- 
2.44.0

