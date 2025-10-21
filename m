Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28274CCD19F
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 02:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A4A10E059;
	Tue, 21 Oct 2025 02:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXUbI7uj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B0210E059
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 02:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761013132; x=1792549132;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=psoO+u6zKdDRfIQsWnyh5XQPj7NknByNTyB5uHCkW8g=;
 b=aXUbI7ujprrL5Y9Oef1OWchwyO+MS/78PV9djxOjBVJdg0SKzFEePPgg
 TiK/cIqVjUlQgrO6h/e5kHGXo20v4yO1lXAe21LbyVDqkgtmk+zZNLIoO
 MA2lAruGh0DrqgrcNKJDWZDc6z3sM9jBfyTXFzndCRQBE0iL6sQ7kIuJy
 lAT4QXHaXt6/8iLcKfIp20xCtuUKRRaJCmbzadIU5cMu+Whp1o+n3LHoJ
 xxkHKr60Ht64JB/b0DLJws1tumfudoi/Cu5Gl73GQNX6DDUMDCoOx2QVL
 mwbYk6x6GIR8DLk8qTaLcChUIUWjtv6XCQBHIxUfJSoNMj7oiUFfdh4Yb g==;
X-CSE-ConnectionGUID: VM30UThhThmRDsgfqYSfnw==
X-CSE-MsgGUID: z+axsO2sTxqUTXR2hCJA6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66999053"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="66999053"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 19:18:52 -0700
X-CSE-ConnectionGUID: faff89ZMR3iY72wXD2gqpw==
X-CSE-MsgGUID: qcUDCZiYQDeQTMMRveFV0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="184252658"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 19:18:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 19:18:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 19:18:51 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 19:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8VH3aL4wvCPZSpwRehZPGvlkpJjfKiT+i5jkmcaTcWR7yjxT4ifDnCXVFOo6dsKR5DASm8eXv+sODn4whm7vHig1Hwf+Em3Z5Nd/35z5i/Y0dpMoSTOxDXAqXpKA5CNH9ANu0QuM6oGLuEoF36keqcXQ3lUAPo14JKmPzWYACHaxhTvJpiczCPgLBDxY8f4cGD+PnolgZXJbE34mOdYUf3fd7O2FCgh+9bVrjRFKoAVWld7HEgvJbsp6EtSKUUHcdLW3YVMazIk+vdJ5qG9dSASv6sGlelJi3d7USaFV78Xi1bDq6h1LfkbFEPvS3ADdkBswp0abVRaskJKs9uqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QByEYFovAe3yHaswth0VJXhDJlVjL3b4cnFglpB92hY=;
 b=Yeiu39gygQQEb+wb+K6p6lTp/5siaxN7SA1sopx1DkcVuV3le1aKvbEfJ/b+Dsaefl8Tgzt6YY3rOOtEaM7aZ5m/Tc9U2u1dLKk2J+A4y+iYp3HFIaq5GMoy5OThd9nGVSIirNZB55YSR7+IEwxbxP/b7s/QBGM0rLraubKc4bVEA/UZvZcr2UdzQ7GEThRRF1OHOEPfB7/1iYcepaE4mJuRpo2AxmSwlfOZ2bUYYbprtf8IhTs2DQcY79pQoARTGFL3zpfmP3bA3F0BoPIw7mfmMtXC7cZJxFzFZaVUXJ1rH49Utoly458q4ELxSx/IbQ7Pi4VFck3oHmVRxqS/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 02:18:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 02:18:49 +0000
Date: Mon, 20 Oct 2025 21:18:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 7/7] drm/xe/configfs: add disable_mem_copy knob
Message-ID: <jvvrjixujx5hz2o7x7szsqhjvgbze6a5wtzbifclltsffg72ir@rm243p6z4zlo>
References: <20251020125431.41153-9-matthew.auld@intel.com>
 <20251020125431.41153-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251020125431.41153-16-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: aa29b4af-4044-487e-e722-08de10482be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MXwyD4olDOI5xehlualN3gv5Wh/9JzmH/f2BwkMPhylLNmzI6lb+etOx1nY5?=
 =?us-ascii?Q?fEaxi9JneW1hpweImt1hzi+zrNdAzOZL/Cs33JUnNL0M55zOt1HBiBwt0BHq?=
 =?us-ascii?Q?ctQo/Pu/J4vh8UMH+iVk6/Ntil+nODk+QCvvbvvo5kQZa6LfQbQ6h6dSsNzg?=
 =?us-ascii?Q?7tLevKIcXT1DuVtNeYAQ8dNUXwwuCI4GvzCOE/LEoObJoFBL7bmvZLAFPFOq?=
 =?us-ascii?Q?cQkgd45JZqZYxCSaKN4dqzfQZQ7jSpeEehQw8e95labJXfbN16FRMdGXnNuc?=
 =?us-ascii?Q?QVruPb8aHfp2vCSKdcBbm7vnvlh5TsVsaisXqMVMcKxcpwuHiKQ/u5eU7Y7x?=
 =?us-ascii?Q?JN0o6Af/JHmxb+xkukCrY11jetYj9mqq4Up39MCIaKThVjoKX3p4TFhzNEJB?=
 =?us-ascii?Q?cLf1EpFDqth/sDilt7oxUAif7j6g/cECqsDEKRVfYzP2VwIgfIeZJWXn/QIg?=
 =?us-ascii?Q?DVWBlQGXj3uSUlCDPpUnkCdoFJHYxqnM4x36a6AJ2OlKY/onJL6igWPzT92c?=
 =?us-ascii?Q?pVuj0X6cP2aXuupBsovxwFq7R0hEVqFl2LNORvgaNNJDy3KyOotF60eGZCTA?=
 =?us-ascii?Q?nzyJ6EDLIzfMUcV9n71LPJ6gqvmRM3gTzX09DBOyueRuDbC3YUxra5qMw+l/?=
 =?us-ascii?Q?T3ayptoK6zAVRb1XJpiFsI10VBboYLUwkJuTYjfs8zWjzDdcABIMUpBO69Wj?=
 =?us-ascii?Q?ibbfTsNQjentcfoOvByaj5yyecDCbIsHjNTt+EYaSgqOokAuxUUr3RldN8hd?=
 =?us-ascii?Q?MkxZ6UtMolFfE/K/f9/qk02ZKhBsl//XXyy7SvHxixLkZa7fjsQTYXBiAskx?=
 =?us-ascii?Q?DkHJ19p5OcKAy9bGOg82Pbru7kjIDzjfZxqqaiWHBDoqTpCOgWh54DfVR+RG?=
 =?us-ascii?Q?K0+0BFT+yqxTIYr2NWtyOOPAXB0giZzvlgHi0WdiwKr9LpnENEDikbHs9TxS?=
 =?us-ascii?Q?pFNeusF5LR6b4SkZnFfXi2S3cLekSohXFzWT+DCA1hkBUYa1rV/v1auOPBQ7?=
 =?us-ascii?Q?NkLK8tF7dcODmXU7hYGU3LLf9msGUhBC1xTOOMwoeT3UZd/ZgDZIVGX/Lh77?=
 =?us-ascii?Q?N6uuOapOyQgoo07qAGGjfrb5RSZHAUBSqPTH/aj3389OutU4F8x+MapR9q7a?=
 =?us-ascii?Q?Dp45Q0fdPnpDTtNgexLfvX9KN30u85/ZGRMIAnKAufmi1HVKV6UCTQ2+6l1T?=
 =?us-ascii?Q?X7ZM12XbbD7kbaqwioPUZ1N7kel8oRTLfZvTLdI1qBWAMadlMg9V3LWE5xK3?=
 =?us-ascii?Q?qkPFZGUeXBCsfov/1FUkUbLMg979C280qrTC8NvbVkeqNArsKg6o7eR83+y6?=
 =?us-ascii?Q?MXpqYIYwqx4M1Vjyxv5KjNFun9vqPHkqiuK5waVi0Qqz8bllc1Omi6hQJM35?=
 =?us-ascii?Q?wl8SwUI4XU1bZNf+NcFndkHk0NNN6ItIGTNamykzBQLOpdubxmOdBLyuqweR?=
 =?us-ascii?Q?lxQWtcm9cJQ5vaXUE0IU7PrI8bfF47ao?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4x+eoOWh3G25zNNrGSuZFcIJO+eJKCgIwtcroVEnrt0j78L4XO3+SLN3hmjV?=
 =?us-ascii?Q?cv87TX22XV5pPSb2xwfi5/wEmhDIa63ppNYF41LEB92IWszGzA+y9LQSvAP6?=
 =?us-ascii?Q?rCKWLT1VRBn5cp81wLdfGmlPazfiHd2bh5b+xJrY/+j5dwAn+HBj/N7E1Mbt?=
 =?us-ascii?Q?HUqfHUXWVwDd1bg2wBMMyD4fRyZ0t0OFYo+gIcMexzZk7afM8/S8l9PIGJL6?=
 =?us-ascii?Q?VziFhyAj6cVORPn9hnZHy3i9WKDVhgBNPJQQIlY801YhvySnt4FoMrMd5KjL?=
 =?us-ascii?Q?HRUAzH5QtBuXtC8gVk9PuP+ih2OnA+FXBebSqAfhg/pO4E1fLrQUkNSJOFpO?=
 =?us-ascii?Q?SfXvpPkGLj2oywrjKhNiMfnw7nqPuxtU5dASlE7Emq6sXC4hqU04yckaf0PV?=
 =?us-ascii?Q?xHaQKkFNWpvtAvtvOY5tqEuB3NzpJ3kqXBavnojR3CkoprS2jAtbF6zFg1mA?=
 =?us-ascii?Q?ES1+WbkGgajkeWup3Uww1o9MyHdN7G+jo/3x1jJ34usNqnzlMMrDt6nHYMmb?=
 =?us-ascii?Q?2iOhOquUnBTuGRPNo+a6L3IMPEsQS40cXmQ48DhQkIPWKg0Ppuh4EoNRXD25?=
 =?us-ascii?Q?EpQSFXy6iXdk3k/oOkOK4OT1ITsqf0TEa185DZHwZesdZvxTYhKJ1tsdNLSz?=
 =?us-ascii?Q?gwEpt51R6CexqqbFcvdc84ZHBZWdLn1qz7vlsMtESAqDtli8J8TAtxDMkvd3?=
 =?us-ascii?Q?Cwn6BdjrvtPfHLntwpotCL6kQkv0i25xllrfQ8f4G+D3NbAw8exE/x+PlHul?=
 =?us-ascii?Q?1oqkD9O2GB6+aWCNXAQiSajLbWj+ug1lZZzk+6qi4B4uF+q4ww21wvtqR7pB?=
 =?us-ascii?Q?slQBhNEtPzHPrRoyy5t4prNdvY0VrGpAlGnRB1KNOcMeE618Hy5w1DTNfkaW?=
 =?us-ascii?Q?/W4spWuH1unnb7G3xr0eJbH15LVMlDD7wOTkg5n2vBWeWWWByqH5HRvWv5e/?=
 =?us-ascii?Q?HiIORiSu5CMbAA3F0Sfh+tGgPf0Ixb39g6vZqKjQaszhZ+A4w4jBhqfAcgxQ?=
 =?us-ascii?Q?vfJxvnA47ya4DwxrlqYlrjCfbW/jk5QfI+aztcaF6OK1609ePzIFmaQ4kMMw?=
 =?us-ascii?Q?fdsdoUWGce2aRW2kQKCkSmczoT471aPNSsKPBNX+EwdEAcsLT2vvA0HbTGSW?=
 =?us-ascii?Q?073FU9YtPIRbdB3v5MlCHBzMO6vQKcA0HKqza2r+MTVhPoLc6uPlycr4zrBI?=
 =?us-ascii?Q?2/mAhZIg2A5tmC0XLoXYIelQ+2EitMPW4ICpel63qyw9vJrAsq07UIX7ZGOP?=
 =?us-ascii?Q?YKOaWV3XOtXU35CcOw1Oq7mVAG9ReMttBSWMWg7SsBx6Siw7Wt5SSyLw0AyU?=
 =?us-ascii?Q?ehHgWyS165k5HWcr1Qp0peSrX7obfro2eEMDzODDcQC8icEtOothyH+A4NfF?=
 =?us-ascii?Q?qdbmXdtmHzd1r8BL7ZHEEBr12wC5bt/F/qA1lS+hVAVz5qf+XHUPsGjzKBGR?=
 =?us-ascii?Q?RR4LjSsVNDxMbptaqeBaiNRkahl5QyR4PntJumy+/Qjc8PF2CyTEo82T7TO8?=
 =?us-ascii?Q?PcCYn4yDGL6FdtTFVLfgIkir505Sy40EpzeoV36ptzrhaWUY2pykx1OYaSbf?=
 =?us-ascii?Q?fAxB+A22NvyUC2HeB/U+iVyBTPIf3wqOVqfOCPU2K6FZ4lHrxK/NBbO3a7Mt?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa29b4af-4044-487e-e722-08de10482be7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 02:18:49.5077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtYUYc6VOOc/+VMkl4Wndwkfegvd3yahn4SAQKS0B7CgS6ZkWe4KlW2vAWRJn9L0rnj8AdBRm65zvU12RtZVsJIn2akqy0WIMiQzBHA4ldg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Mon, Oct 20, 2025 at 01:54:39PM +0100, Matthew Auld wrote:
>For easier experimentation/comparison allow turning off the newer
>MEM_COPY path, without needing to apply manual hacks and build a new
>kernel. This needs to be configured before fully probing the device.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 65 ++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h |  2 +
> drivers/gpu/drm/xe/xe_pci.c      |  4 +-
> 3 files changed, 70 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index c1419a270fa4..df459daa0f07 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -236,6 +236,15 @@
>  *
>  * This setting only takes effect when probing the device.
>  *
>+ * Disable MEM_COPY path
>+ * -----------------------------------------------------
>+ * This config will force the use of the older XY_FAST_COPY instruction in the migration code.
>+ * Intended only for experimentation.
>+ *
>+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_mem_copy
>+ *
>+ * This setting only takes effect when probing the device.
>+ *
>  * Remove devices
>  * ==============
>  *
>@@ -264,6 +273,9 @@ struct xe_config_group_device {
> 		struct {
> 			unsigned int max_vfs;
> 		} sriov;
>+		struct {
>+			bool disable_mem_copy;
>+		} migrate;

so this is migrate.disable_mem_copy

...

> CONFIGFS_ATTR(, ctx_restore_mid_bb);
> CONFIGFS_ATTR(, ctx_restore_post_bb);
>+CONFIGFS_ATTR(, disable_mem_copy);

but the attribute is a misleading "disable_mem_copy".

Note that configfs is not a place for hacks so if it's generally useful
we need to think of a name that is not misleading and will be
future-proof. This seems more like "the MEM_COPY for migration is a new
path and we may have bugs or we want to compare them in the short term".
Did I misunderstand the purpose of the patch?

Lucas De Marchi
