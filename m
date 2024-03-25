Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC473C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 17:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E3510E614;
	Mon, 25 Mar 2024 17:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aM82mwYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB1610E614
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711386182; x=1742922182;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WniJmz1zkOHX2xA54z4bojKMiagbAZ4umcRw3jNOnaA=;
 b=aM82mwYDDFHXi3A0XKgYMAxpXEQYAIg0kbYbnvH8RdjkbPaSK/secCZ7
 qBe5S/Nv5pRsmdG5gRSnmDRiIGWsIKWYBVXhr/+jXTqzZpd60b+q50IRY
 4t5plPkg01znXkaSDIkeLlp9soxgDNrbseMhGVSDdyVkfBYV6J5WU8HVZ
 DGEIrVsyvEempufXCsJ7MbT/AyQ3kcvlZq70QfQNT/TS/eiMqpJZGVjOZ
 kY1uj9ee8kk/RP8ksQsB2ThNVwHZvvVkGDS8BtdfvYNtOFVgDB53R/hhI
 OWkYoyXXAXNLN3PDVfl9NT2p4hb8SNiLx9/WKw8YcNnXt9wKnYkiD2ht4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10182723"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10182723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16354656"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 10:02:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:02:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:02:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 10:02:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 10:02:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dv3VhigIGnH+k9RuGA3l1ZBxEdvpybUizoiaetYHTyhoB7JPFzYO/u4Q5274U8xxYeO3H0/kR4CsZSk/huvZ+YjYyV8zotHadAKcrguY8gjX2xYF6S17PHWEKPXnxjz9UWeM/zz/9z74Hqe9WkV6XzK8RMf4cQxliwHTL1Eg4zuBIVJ/4eVABNmJv+q2lQlPF0wIwfDBSw97yywxhVmkFi4TJda7X4WboXBkY5WmUMKVT+IcFsPF1iaK8ja4dJru11azhvBYmzGuibeURl5STIPjyWob+Vzmvyja48nA24DjqZ8Dc28A+w5XfcPG1GjQple1yUsOk4gVcdXTW7j3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++3pXWbTUsIxnEeOlfIE5GhsWA5qj83Y51zD4YvcQ8I=;
 b=Gsq2IeAdH8PV5hzsy0PRmmU6JSQxRdq5G1m5etI77eyYnpGB82XWoDPm9iwJI4wBup4g8osdwIATo2zevGwWVKu8PQvDvHv72dENhFMvCf8F25K7D4c6BwJql92sDKXwu/qBT50yiLFh7qLuZBl1FL62EQj7UxXhfjG0H639IPZB2hPtEjPSa+D9mFyrtWfvyqwTSEd7y6CTFzut1bJoq3wD0gmvtMX1wkFDWB0wHKLnvwoLz8sUbGmmS0+lQx9lcfNwTmQcIxOArPaEGVFfSVcy4JIwZaYC8eXXWzRlrGuTT6Co8iRcghHoiykIVTZ41V7CEiF5wteNImA9gzMxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 17:02:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 17:01:59 +0000
Date: Mon, 25 Mar 2024 13:01:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, <lucas.demarchi@intel.com>, 
 <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Store pointer to struct xe_gt in gt/ debugfs
 directory
Message-ID: <ZgGuAzMpdheUTPke@intel.com>
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
 <20240214115756.1525-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240214115756.1525-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0052.namprd02.prod.outlook.com
 (2603:10b6:a03:54::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: a52dfb3f-97e8-491a-8fa0-08dc4ced48ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0SaLSAf7Yq20aVzqnIPYTW6nc14zE+vCacVe8mmt+7+Hy07x9CtTELWPAGpTb6ygoVBRQdz+S5dpMyqFg6Os3y78amN1JjdI27voirkZF9K6OvdKXbaJLr4XQXFVoXHjyaeURsjUAbVeGOQf7nKkdEK3fBVCoxdlArWGRBDKfXLH+fyYy9iRwHngt8t8v8DAs34BKRyXD7kvf5GsF0fw1n+aDEV9Qv95/NsGjhH/Fjg8oADdRglbC7JitBlr4hz0gMPP63qQLMXW37WimJKrNqE6BS27+HCvdJobSsbjEpey3fj/LE7Fic30+h/dNt+VqMETnTjqQ+s5IKO0/DsXoU30iomI/qewD0jVFDA5WQdHPlVTldL7gxgyb8ZQEUl1NAxO0ItQ4PEVglMuTKQTtJAOZNNNfBs3Xj5rqv5JkMgRrTwiOYuRMLn4iYEiUx1/EDBC5OKDNLvmHIeoI+c2Bw8alVLw/33LOIryzUo1vHs7cx1yhnsmTdV+M4iYzyQftpnrIJ2DxBT+Ofk9s4a0rrij8OaZ46OxiqX0ysUq6D+f2fXQ0VOZMRII1jE/fPcx7A/6fdvK3FQHLpTmHheuaQ4SSZjvlSar3Qexn8KWoZ1EHpuAJnXHg1vR7ihokWE18rCI+hsTZsBpkwR6sIB2kMjHWNCAZZ76ByhYAK4aU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7sAWFQZA5KF+08EXosSoITIh3Je8W9bXqln1TsM8B073wvrJIyyxMPmBBc?=
 =?iso-8859-1?Q?tM5gCm4tGRANjoT0HfnR289Sr+0Q522aynjeZWv5rpJkEXIxpq6UVxVuFL?=
 =?iso-8859-1?Q?idWmC8NbPM2b8hWTgQrOfevzIuXIV4a42ENqJZnsijdpcoDJ/G5Rdmhyg/?=
 =?iso-8859-1?Q?70CUB/YQcDDVcY3qAYmTsAp8fByDvF0SQCZ0IFkLbmnTbscyaUYsvZQR7T?=
 =?iso-8859-1?Q?VacbxPIWC54rSLbMA4r6liPp/AMl7YnZTkUc1IR5tZ6veJoJEKPXvU6A6t?=
 =?iso-8859-1?Q?der+wCan7IOIdB0uf8WD+BzYYNMyVbCqiEbzZX0Q4n61728bRFYlWBhwAP?=
 =?iso-8859-1?Q?BrB2V+UKJv++GPaNWz4wg+qIWGyFHiT72QRfh1UjXn2mbXLyV6/QHpgkj4?=
 =?iso-8859-1?Q?lN8kvy82K6aY7hFtU1Nk4ahKKVjFBZMixzPd0yTui/j8NiWLkAA4ZPRIBx?=
 =?iso-8859-1?Q?vb/z2RhipGHUncC3po54t0oL+xmUq95N8AZno4cA19nL6Gj9u/BVnthEYX?=
 =?iso-8859-1?Q?l2i5fdY7W3mgBQDHhmTMpnZCND5HF8DDA0JNNljFMy+66lbAEWPgjPrWud?=
 =?iso-8859-1?Q?6lGXaySoX390zHzZQfp7Ih95IDR53JfiIWP8CfdwFuOrUzAZvK/dI0oPEY?=
 =?iso-8859-1?Q?cbhzoxsnV2lfCk8fymkRUAAnLBotE1HcEqQDVJv2y+K8yJRUxdhXbxTULB?=
 =?iso-8859-1?Q?pIwh+wUmL5QEw5Lx+U3aNFYYKAFwtc76y3r0BoZ1GgNkbCpba6khaKTQe0?=
 =?iso-8859-1?Q?vI1r1yIh5BZRhPyaCpKmkjODNwa8IGLboRF0vSk/mu9bQFH3Lr3JDW1uYN?=
 =?iso-8859-1?Q?o/yIFWpokyLF2mik0Tbwg71appP3v4UmBvC68pYAAbEObNUJ8/lnO5DOPh?=
 =?iso-8859-1?Q?OXZeyaYa7khkV2IrUELVl8qrwWZRkuqeI/WUkHl27D8Opnmtx6aUP7B7We?=
 =?iso-8859-1?Q?fOSxQTEBj0od6YbU2RJsZ4vWQ23bzn+l/S9DNMNYmm8XZpVgHFQpermv/T?=
 =?iso-8859-1?Q?TiIZJ7gCsa5xHOEDAQSQB8i/UGcrHslKvf/1jC13C6+XzQyrvo+FOxcjNS?=
 =?iso-8859-1?Q?YQ5P8O9aNiiWIgYTpOHjiFFv9Sdhz0ePRd07Hyo2TncoDR7bNe0Np49i3m?=
 =?iso-8859-1?Q?+ocdpib1HBHhGif4XENROTynmPDoX5eA35dZFTJ9sYXnW05I3RcCdJ4y/+?=
 =?iso-8859-1?Q?hWcIp6iHBT8u7GNIzvbwgLeVTi51JcxJIBFuBCCb9oRB3grONaWXqVGWp1?=
 =?iso-8859-1?Q?sIgnACK2+8to9ouumIW5k+TyHlX1n7jxg4tMIj3RltcyQbA1WdQ2BmQaat?=
 =?iso-8859-1?Q?dxU9QvkUCsg5FIxNvDztIic3cVijlY7d//e8fiwu94TOUEYSZTfaAx6zMY?=
 =?iso-8859-1?Q?Yyz/KB/+98lAN3rddii0FdV7U+Vq4gDZV7LII7NyhG92vyOWHKatASQr7A?=
 =?iso-8859-1?Q?2uqSXO8SeKAM27W8SnpaGx4OewGe2qlsM0PdmWGdMOQmzjKPQCudrSlPXb?=
 =?iso-8859-1?Q?fjHuP+4pdqZl0zw1mqgGq+FO53StskAkgdu0LtgJjmwHzttHl+91y9mbbu?=
 =?iso-8859-1?Q?qCWIL3rQl9UoEsTpvtIasSIgNPT4OqWO3YLmzchQciwL+yRKBtqcDrWpsQ?=
 =?iso-8859-1?Q?rD/l8h1NmE4wuDYTdMfSs8xYkcsrFvieuA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a52dfb3f-97e8-491a-8fa0-08dc4ced48ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 17:01:59.8862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JK3Zyi2XrFxVUsVi4q8ZiA15Mk1+EpvV/ryHekiQ1LQ5PeINFUNHUZPoNAhi4TOMqR9P0sY6LQiDJ5iKcgyD8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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

On Wed, Feb 14, 2024 at 12:57:54PM +0100, Michal Wajdeczko wrote:
> Attributes added under 'gt/' directories may wish to use that
> in case they can't obtain it from elsewhere.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..207b992f1240 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -225,6 +225,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		return;
>  	}
>  
> +	/* other attributes may use parent->d_inode->i_private */

what did you mean with this comment?
if others are using, what would be the risks?
is this a good thing? is this a bad thing?

> +	root->d_inode->i_private = gt;

At first I thought this was intrusive, but then the following
patches made me realize that we are already being intrusive
when disrespecting the data:

include/drm/drm_debugfs.h
struct drm_debugfs_info
/** @data: Driver-private data, should not be device-specific. */


So it looks that we do need something else.

Looking the i_private that you pointed out seems an alternative

include/linux/fs.h
struct inode {
void                    *i_private; /* fs or device private pointer */

it is a 'device' pointer rather then a 'driver', but I'm still confident
that it is the right one to use.

It looks like the debugfs_create_file functions would override that
anyway with the data. Also other places in the fs code where this is
used for other checks.

So, perhaps we need something more flexible at the drm_debugfs layer
that would allow us to have a sub-device pointer?

The other 2 patches are great and you can already use rv-b on them if
we agree that this i_private change here is good.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> +
>  	/*
>  	 * Allocate local copy as we need to pass in the GT to the debugfs
>  	 * entry and drm_debugfs_create_files just references the drm_info_list
> -- 
> 2.43.0
> 
