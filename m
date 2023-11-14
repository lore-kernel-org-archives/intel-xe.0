Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D7C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 10:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243C710E1ED;
	Tue, 14 Nov 2023 10:02:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D6210E1ED
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699956142; x=1731492142;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iQZSn6KxiIkbPzsl9cVRemOctlbsWeuy/oCz3MbHBN4=;
 b=CvfKtZo0WT9pUwlyWZa6lUr9xiaQCfqKqI5Z3GLSfB5IAYVrUDdaUrAZ
 j/b3SzQvsykh+SeBdq47sCo3wV5CNAPW36rVPi6VYvyIxPzMvANMYCOq3
 J+o7GOcgANm69ghNuQSnSQ2HAdN2PbuoKCv4Qo9t7rK6nYgJRpsWD9WFq
 64Z1man3iNAo/YOnPLsr9d3GjP5FTYFnkM9iJGpGYFUb2V3Z0b3eKYnbs
 fSsdNJCYiiu/zYSnr+d+Qizbri+RZSEUHWYUCNM3pxd5UyLvR8oOoutHq
 22vJmRZ447tDnQcNFAU5osFgC4uBygovy/xOFF+TToHRsWjvFVS/FeWcb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="457119570"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="457119570"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741046401"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="741046401"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 02:02:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 02:02:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 02:02:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 02:02:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 02:02:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=difJP5pbEWbJtGZnDCSkJxx/+DPXZCSq/w5pQO2u2L9k55zhrpgUCgtFzVprRrfXEC1zJQ43RVtgDCA1gO67AaTIclWlFjRKnYbgLf/K5C1lvSOZNXbBbVuw2WnuYzv1nY8pcIDG2BZaXvb32U2ZREvvD4Dypi9jJpJRv1T58NISb+MOWHkz84RHMlTPSSpebyBjmM1N8/ZBJ53WtClYbzm21g/751gfOLkMxdD5Ao/lRmD5PRJ9LnYc2PYic7zn3oZsE1KBtskyhF4qwQemr/kApT6bWJ3ntKGGsCgfvAut3i3EM6VNZWIzHsUQl+9AjBmpkX7iU2ApJH6Vb03V0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iarzKp5LOMnUK1mv9Vw3tk5Osc5QfkfTU6NfgUfdqog=;
 b=ENTTdcn4aezWIXspM5svZ5tSEor/Zuz6cS97vnCqT3/CFixgG84a4ckEISGhLA8V9PuF69wcHICh7RqOt6qwpr9VvVJ5TtP+ct8EI2qUpc3SV235aBB1aIQ/xwAViiyiSsR9h0elXeG953j4EcWZrne9FgGV5pAq6S9GLJS8t5sbmMbEU6e5UuorQe+fQ22TEkIDudND0hp1eed1Nhi5gIZopYSjamPbo8+z6hGpEAihIvT0bheiMWZxkdpO2Jugs7PAvCymgT60VCR58MSTRepxYG8GoaX+xjKBH4iqlIkSD6YQoiFMzdD6VLDe1OfkuBsWQfTCKcGjGeB4WMSCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 10:02:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 10:02:18 +0000
Date: Tue, 14 Nov 2023 11:02:15 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <wb5de3ufysuv6ada4prgis4i2zuczk4ijkh2nfr7n5qshi655k@tg7znfguqfm2>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-12-michal.winiarski@intel.com>
 <ok4vdcfjzkc4p6u7tl7udsgcthjekmmgslksgusfnctkbf6ony@ymq7ernydwx6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ok4vdcfjzkc4p6u7tl7udsgcthjekmmgslksgusfnctkbf6ony@ymq7ernydwx6>
X-ClientProxiedBy: FR4P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a823796-8168-42cb-56a4-08dbe4f8c8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dq+ou7D9adnHmLo1dIT99R+I0tGAEUc5X2mhq1qPaLiyQF2BAYqimRnyMNjkLcwNf5e7Dj49QCi6H1EK+F8uJ0e97feJOMIgvRKfs8HBVDj+7i3y0auCFDImcE3Pnd54OYSZua2H+dug8PmxDFnVZv/g37rDHm42EX0kpGc+StsZilWBxCpEPf7acUP+ZQJPvA7yNYm1E8YH9ivsO1Rga8FxT42ktGyu5x0r15OLhHNGQYWaRKizXPFpge2owxTgo/aCsP9dSvHajwZ+fEETBz/XLBGLlBk51QiR3DXTApGvtNwtyxJ0ktYLWJKJhM4ImHA4erupl+rqhfnrHGql2bvg9+KGh/aluvtqZVaXEXpSmZz2PqKcRGPOyTEQELPOBzsC+6xd6MzMGI0KN1EvFeQxiJb9A0r/It81b7gEKUMQ0gnr6RxX90wC5klfgnEkCSLhWf2UDsZoVzNs2aitT1baFUNnezuQBA3kJkB9k4ZmbtyvCEeCxCbIZ0DED0ko8b/uER/60e8B/Ng1M4q8h1/99ERb82lvYZ0jUwW63suOBpMpJzPlNAb6GiDZ3X3w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66556008)(9686003)(66476007)(6636002)(6512007)(66946007)(316002)(83380400001)(38100700002)(82960400001)(6862004)(8676002)(8936002)(4326008)(6486002)(478600001)(6666004)(6506007)(86362001)(5660300002)(2906002)(33716001)(26005)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VndlWGFvd3B5SUMzYjlZWmk3dHRrclczNTVFc29JVThJaTgyTmluek02SjhV?=
 =?utf-8?B?eFF6eTMyd2RQS29vTVVOdFVRZVBaa2dWL1lZZTFsZEt6bFAweVpYUFhWLzMy?=
 =?utf-8?B?eG0xczhGTXJBWWxuMTVkaEFqTWVnZlNSZ2k5OUVtM2Q3d3VIcVZUR0pDMVBa?=
 =?utf-8?B?ZHlLUTdjaGNXVjI2VW9jdkFkSE8xaE9JWUltYXBncFJnV3lydFZlbFZkQzRn?=
 =?utf-8?B?VysyT0xqYndNZXgySUQrdGlvSjNoYTE5bUszTUhKQnZ5dUQxVitLQ3pzQzB6?=
 =?utf-8?B?NXlGUnNoVHU4SWdZTm1qaWVuREh0M0VCb1RBajFGd09SYXcrQXl6enc2cC9n?=
 =?utf-8?B?YUlXZTBaK09jbTdCa0doR3Q2MmlnZE1zNlVFSWphZ3FVTDYwVjlZcmdLV25D?=
 =?utf-8?B?VXhuSUNFVG52NCtrZGhLRVBKQVdQRWZiVVZveWNsZTFOZW1lU1dJRHpHYUhC?=
 =?utf-8?B?U0F2OUw3MWxmQTYzOUZGdlk1NFl6ZGJ4aG16Z3ZmS3FrZTQzUkV3YkEyZ09a?=
 =?utf-8?B?RlBCQTA0M2lkNTRlWjkxRENKeFR5YWxBdTNYdGF0bEw1ay9yakxyZis2K2Jm?=
 =?utf-8?B?eXBBbm9yekpmcXNKMFp3d1IvS1FacXJ4Zkg2emp5RW1yUDdWa3loRWY5aml4?=
 =?utf-8?B?bU92SGVqOGduWktHUzFJVzNFM3I2cW5LWXVPQWtCZ1Q4bzBmN1hESDRwYjkw?=
 =?utf-8?B?NlVUcUJqMkhMQkh0MDluK3IrblUzdXpYS1RBU0RwaUkrUldDanc4VGNQTHdQ?=
 =?utf-8?B?d21qNjZNUnFFV2dGcG5kakNhakYvYTBtejVMaVpSZHlHdzFJYnJMbFBGUWc4?=
 =?utf-8?B?dUlJR2FnVVFBNTlSeGh1eVFzMFRHY2VHQno4NXRTVVY0UEh1T0xPVTVueDY3?=
 =?utf-8?B?MUsvMEpDK2ZNVU93N2FIY1VpbmYxSnF5WHJObXZTcGJzUkp3RnJyZDljUFFQ?=
 =?utf-8?B?Y3F2ZldqVVdpem1EWnBwNWFEdm80czlqaVRzMHVCN0YybTBLd0NzV0pscEpE?=
 =?utf-8?B?cklzQk5LL2FuY1Q1OUVVcUlEL0dXQy8zV0NlS3didkpBRXBVMjlxY0RoV2tR?=
 =?utf-8?B?bzlKalNRd1lyc3FLa0VGT21razhEb1BmVktTOWkwOFVwaUdZNW1OZUhvcUpE?=
 =?utf-8?B?U2xydTRzTmZmczlNbTFpeE5Hek1lTTNNMzVtMHRaWFc0RDBTcVRCcERBQnhB?=
 =?utf-8?B?eG9CSEN1YjIrQVp6WkYwYXNOTC9OZmNtVDVNTzQ5eEhUeEgwZVptYnZGdXdN?=
 =?utf-8?B?YmRiTTRucmhudS9YQnJxUnN2WWx4dnRldzZNT2dCQmpWS1ViTm9JWk1FRHlm?=
 =?utf-8?B?anF1dGpQc3M1R1ZISUVNMDZwUStFMlM3cHkzL0E5dnE3RVk4bHoxc0VmcmxP?=
 =?utf-8?B?S1ZQNDgwSVBoQXphU3hBYmN4SkhpS1owM0hKaHFMNmNDeWxBM3JEYllpZW1T?=
 =?utf-8?B?bUVMVnRYWEMrM0NoOTU2dEhxamIyQTdaM0xhQ1hVYkdha3ZuaVI4SEFTdjI1?=
 =?utf-8?B?cytuSkI3cFpvN3I1Yk1hcWlFSHYydVRhejBHb044WjhiOHZvNDBGMmJNZHMy?=
 =?utf-8?B?bk5pcFRsSy90cTluNGJiWUJuaVhSQUhaOHoveCtEV010WENmdmY2Q3MzYUs0?=
 =?utf-8?B?NnQyeG9tWFVDNFl6amtVWitKNm5WeGZPUHZBMUJWSVlqMDhoMjBBUjl2L1Bv?=
 =?utf-8?B?TmRrWVAwbE5CMlhGbTZEbEpCSFRKTm9LNncwRFBmQ3RXTWpOUDFLMUdrYUd0?=
 =?utf-8?B?SCtwSDlsVUJiVzRRc0ZvVzN4NllpTFdtcmpxbmE5YTJUY2dJUmFGWlg4cmhY?=
 =?utf-8?B?ZzJpT1haNWV0UlRxL3JLaGdRMzI2cUg4MkhxdzN5ZTc5UXV1QVdlVXBldFo5?=
 =?utf-8?B?dzlBNTIyL2dLNVltRGhZTkRHOVlycW42ajE2V1hMSkhCSlBLS0JLU1ordDl4?=
 =?utf-8?B?VzQ3U0cwdkh6Tjg1M0FNVTg2RDM3dy9GR0sxZ3dWRU0xRFQzbXhVMnNhdEw1?=
 =?utf-8?B?NTlkWEpBOHQ5UDhmaG0yMklLdWV0N1NCanBvNlo4Q1pPRXZOUElWUm9Xclps?=
 =?utf-8?B?bmlHaXRSRnVhbkR5UUNqZzEyN2FXK1Z2RmhSd3VEZ1dxb3J4clJpWVFyOFp4?=
 =?utf-8?B?cGJteGVrUjlHaE5XeE94RkNFUmZWWmNuSjM3SDNsdUQ5bmFmREZuVTgvUmxp?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a823796-8168-42cb-56a4-08dbe4f8c8bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 10:02:17.6466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLLSgwJzI7Gx3+UtCLJ2hR78Uvn2XIFX53MVYuPoeRmaCJOTroMelLNkK8cljlw76rRXPhOvwTTqylIzBJekuF90mbFraKpxQq4VWWWCCu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/12] drm/xe/device: Introduce
 xe_device_probe_early
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 09:11:18AM -0600, Lucas De Marchi wrote:
> On Wed, Nov 08, 2023 at 01:33:43AM +0100, Michał Winiarski wrote:
> > SR-IOV VF doesn't have access to MMIO registers used to determine
> > graphics/media ID. It can however communicate with GuC.
> > Introduce xe_device_probe_early, which will eventually initialize enough
> > hardware to allow the driver to communicate with GuC early during probe.
> > This will allow both VF and PF/native driver to have unified probe
> > ordering.
> > Initialize root tile MMIO and TTM sys mgr early, as both are needed to
> > communicate with GuC firmware earlier during probe.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> > drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
> > drivers/gpu/drm/xe/xe_device.c    | 21 +++++++++++++++------
> > drivers/gpu/drm/xe/xe_device.h    |  5 +++++
> > drivers/gpu/drm/xe/xe_mmio.c      | 17 +++++++++--------
> > drivers/gpu/drm/xe/xe_mmio.h      |  1 +
> > drivers/gpu/drm/xe/xe_pci.c       | 26 +++++++++++++++++++++-----
> > 6 files changed, 52 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> > index a40879da2fbe1..733df9a270db2 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> > @@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> > 		return -ENODEV;
> > 
> > done:
> > +	xe_info_init_early(xe, desc, subplatform_desc);
> > 	xe_info_init(xe, desc, subplatform_desc);
> > 
> > 	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 696f997bd2c93..19faddb779808 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -364,6 +364,21 @@ static int xe_set_dma_info(struct xe_device *xe)
> > 	return err;
> > }
> > 
> 
> The _early variants have different meaning all throughout this patch
> series.  Keep that consistent in future will be challenge if we don't
> document what the split is between the _early (which used to be sw-only
> part) and the normal init/probe.
> 
> Please add a comment on top of each _early() variant you add with the
> split of what should be there and what should rather be in the "normal"
> init.

Note that even in the "future" we might want to avoid having a rigid
split between sw-only and HW communication.
We do use MMIO regs for Graphics/Media IP version detection. Same thing
will apply to SR-IOV VF mode detection. Those are pretty basic things
that need to be done very early during probe.
If we go sw-only route for "early" probe - we will end up initializing
data structures that won't even be used by the driver, which is wasteful
and makes the probe harder to understand. We would probably also need
extra code (asserts) to warn on uninitialized resource usage.

Or, we could just map everything as early as possible. Early would then
just mean "early". Which is also what it means today, as the existing
code prior to this series already has "early" functions that are not
sw-only.

Thanks,
-Michał

> 
> Lucas De Marchi
> 
> > +int xe_device_probe_early(struct xe_device *xe)
> > +{
> > +	int err;
> > +
> > +	err = xe_mmio_init(xe);
> > +	if (err)
> > +		return err;
> > +
> > +	xe_mmio_root_tile_init(xe);
> > +
> > +	xe_ttm_sys_mgr_init(xe);
> > +
> > +	return 0;
> > +}
> > +
> > int xe_device_probe(struct xe_device *xe)
> > {
> > 	struct xe_tile *tile;
> > @@ -382,10 +397,6 @@ int xe_device_probe(struct xe_device *xe)
> > 	if (err)
> > 		return err;
> > 
> > -	err = xe_mmio_init(xe);
> > -	if (err)
> > -		return err;
> > -
> > 	xe_mmio_probe_tiles(xe);
> > 
> > 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> > @@ -418,8 +429,6 @@ int xe_device_probe(struct xe_device *xe)
> > 	if (err)
> > 		goto err_irq_shutdown;
> > 
> > -	xe_ttm_sys_mgr_init(xe);
> > -
> > 	for_each_tile(tile, xe, id) {
> > 		err = xe_tile_init_noalloc(tile);
> > 		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index ee89af6b1ea9c..5d7fd16f545c6 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
> > 
> > struct xe_device *xe_device_create(struct pci_dev *pdev,
> > 				   const struct pci_device_id *ent);
> > +int xe_device_probe_early(struct xe_device *xe);
> > int xe_device_probe(struct xe_device *xe);
> > void xe_device_remove(struct xe_device *xe);
> > 
> > @@ -122,6 +123,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
> > 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
> > 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> > 
> > +#define for_each_remote_tile(tile__, xe__, id__) \
> > +	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
> > +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> > +
> > /*
> >  * FIXME: This only works for now since multi-tile and standalone media
> >  * happen to be mutually exclusive.  Future platforms may change this...
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 8945c601e1c54..526a6ac6be56a 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -15,10 +15,12 @@
> > #include "regs/xe_regs.h"
> > #include "xe_bo.h"
> > #include "xe_device.h"
> > +#include "xe_ggtt.h"
> > #include "xe_gt.h"
> > #include "xe_gt_mcr.h"
> > #include "xe_macros.h"
> > #include "xe_module.h"
> > +#include "xe_tile.h"
> > 
> > #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > #define TILE_COUNT		REG_GENMASK(15, 8)
> > @@ -369,10 +371,8 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> > 
> > int xe_mmio_init(struct xe_device *xe)
> > {
> > -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > 	const int mmio_bar = 0;
> > -	int err;
> > 
> > 	/*
> > 	 * Map the entire BAR.
> > @@ -386,15 +386,16 @@ int xe_mmio_init(struct xe_device *xe)
> > 		return -EIO;
> > 	}
> > 
> > -	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> > -	if (err)
> > -		return err;
> > +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> > +}
> > +
> > +void xe_mmio_root_tile_init(struct xe_device *xe)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > 
> > 	/* Setup first tile; other tiles (if present) will be setup later. */
> > -	root_tile->mmio.size = xe->mmio.size;
> > +	root_tile->mmio.size = SZ_16M;
> > 	root_tile->mmio.regs = xe->mmio.regs;
> > -
> > -	return 0;
> > }
> > 
> > /**
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index 9f1a25cfd2cf0..894a792ac8abe 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -21,6 +21,7 @@ struct xe_device;
> > #define GEN12_LMEM_BAR		2
> > 
> > int xe_mmio_init(struct xe_device *xe);
> > +void xe_mmio_root_tile_init(struct xe_device *xe);
> > void xe_mmio_probe_tiles(struct xe_device *xe);
> > 
> > static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 87c45c6e08aec..2f04f07dc17a4 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -532,10 +532,12 @@ static void handle_gmdid(struct xe_device *xe,
> > 	}
> > }
> > 
> > -static void xe_info_init_early(struct xe_device *xe,
> > -			       const struct xe_device_desc *desc,
> > -			       const struct xe_subplatform_desc *subplatform_desc)
> > +static int xe_info_init_early(struct xe_device *xe,
> > +			      const struct xe_device_desc *desc,
> > +			      const struct xe_subplatform_desc *subplatform_desc)
> > {
> > +	int err;
> > +
> > 	xe->info.platform = desc->platform;
> > 	xe->info.subplatform = subplatform_desc ?
> > 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> > @@ -549,6 +551,12 @@ static void xe_info_init_early(struct xe_device *xe,
> > 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > 				  enable_display &&
> > 				  desc->has_display;
> > +
> > +	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> > +	if (err)
> > +		return err;
> > +
> > +	return 0;
> > }
> > 
> > static int xe_info_init(struct xe_device *xe,
> > @@ -611,13 +619,15 @@ static int xe_info_init(struct xe_device *xe,
> > 	 */
> > 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> > 
> > -	for_each_tile(tile, xe, id) {
> > +	for_each_remote_tile(tile, xe, id) {
> > 		int err;
> > 
> > 		err = xe_tile_init_early(tile, xe, id);
> > 		if (err)
> > 			return err;
> > +	}
> > 
> > +	for_each_tile(tile, xe, id) {
> > 		gt = tile->primary_gt;
> > 		gt->info.id = xe->info.gt_count++;
> > 		gt->info.type = XE_GT_TYPE_MAIN;
> > @@ -717,7 +727,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > 	pci_set_master(pdev);
> > 	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
> > 
> > -	xe_info_init_early(xe, desc, subplatform_desc);
> > +	err = xe_info_init_early(xe, desc, subplatform_desc);
> > +	if (err)
> > +		return err;
> > +
> > +	err = xe_device_probe_early(xe);
> > +	if (err)
> > +		return err;
> > 
> > 	err = xe_info_init(xe, desc, subplatform_desc);
> > 	if (err)
> > -- 
> > 2.42.0
> > 
