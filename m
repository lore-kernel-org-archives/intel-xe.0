Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E1AC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 01:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E180810E6A5;
	Thu, 30 Nov 2023 01:41:34 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 30 Nov 2023 01:41:33 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC6710E6A5
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 01:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701308493; x=1732844493;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kWQVs34+NH7kpXf6+Auq/aeO5DQHpX1qv3C67BrJwlk=;
 b=fZjRlYP4dkV+IFj9bTRTexgKE3o67ZYLF+p+EICM8uJaqioAMUIUe9cg
 mJkD+E6TdKh1nec8jjRwPlfsORsPurfJ2h/fgi8JipqwsYuP+uDydvnY8
 ikl4Kk+3rvaCcjLt4n+7uko7LXFIKOt2vb5M+siFEe42ZQOGBFJdRC9yp
 76anz3J29tmTubzf9LgiaXLwIgQkW9p89BWm1HsyBjRkR31UQMCMkJCmt
 qV/hfsxJ+z9tCFaZ+XBUVu+qKGzVyzF5ERZaTgxbzHbs8gdEg2w5DghHO
 Td+w7xBeSWCeIJXQeie3Ia3mINlWzlokmpd2qq8dRcVca/mfDEe3xtvoi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="152716"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="152716"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 17:34:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772884149"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="772884149"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 17:34:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:34:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:34:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 17:34:25 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 17:34:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOtfx9qCiH9xsRj5WJnI5vwTq2lNMAITo1Bkw8giVavutZEoZBuYha1r8OZf5lt3q90bHAbgcsJN1Jp034IbjMQQ88ZF9ZH/kBAi7DyQ38LavB7wB33pjFaJFK47CvhAC+czE3JHe972R2oVR0QyUP7n5vEPlT36GbeRcfXPSIYy8ZVZTshmB084gZHV6JcudRyqXCQdHHd0Ta+aqIFKr6hreqnjlTWJyxUtJ/Y7eft1kPSQCaFfQJyZCLRnffe+MGqhvkYVBXN9zAIpL5kH8wrP0kbjiTKayviSHRjxbrRuJuqXIz8F/FpKBoHMISBCKjpaTReYT5Uf+nE/2vcf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRDCv4tVdwP+Wp2m+FD8lHENaAFr7gS0yvrUctiYqXo=;
 b=fWPJpDTThn2DyCinxtzp/atXe2J8wCuxWeq9Ll5L/VAAP+WtAaXJuPNAL6WA8vaFJDN6pQD/81XACmSR3ibTzICkU0/KFIjdTLOmlEVTqloCrsSkkek2kYBe3BeS/VLkAM9wzNY3kmMX26XvsHofalJ2wJljq+M6StePIDVtA/2TmcyXG17tYMiMH/akOLZhidLvdpAwhtXe/XPvHcjLrGmg9a3mcmcRkfk5JV3d4FHYRXkymuN5je7sgVNT2uEpi94PcWI+yuT7Z6XacIkk0tARxZZmKhVtWKna+PVyt+a6UhEniNhmNZ8tRvYJNyh01H3G/ZPdFB6HT7sUxNrRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8142.namprd11.prod.outlook.com (2603:10b6:610:18c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 01:34:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 01:34:22 +0000
Date: Wed, 29 Nov 2023 18:32:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZWeDzW3Cq/Wkvits@DUT025-TGLU.fm.intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
 <20231129223508.1189461-24-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129223508.1189461-24-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 89adafc5-179b-4096-db12-08dbf1447b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: evaODfpwN8EGmsNwJrDLoFCaWTIEZDShHaxO4GA3lhNyyp1WdSFYLHb2CpwnN4mgU4ltI9uHBdD+WVFxugzLnKxziPCD+2RTILylLwRug8/Tp1S/T7/CSbwLhoaiMaU93Kxp2mhiuWJZD/wiX1Q7UkJ+Z8IbeZtx/t6KZYq9ZTKrJDYHga85Pc8cmppIIU3kVCKqalYXzJN2Y4X5qyqga1gJtN2rTkt+DBUa5lSo7GWCsUGL+iRJp0FKsY8HR1SwHWpGEl2T5ucbfGCWBi0x4AY7SkwkPYFuAgjNK1A2RUvyhBBz2Mgt4+Yx/NPEISnijar23FeR06l6eDgPzvrgllka9ow2zXU1sghDAGD0V8BVz1hC1/WPHH+WhyXXL8BqzHUTMsjbQMiU8W2XUWnwG34nT1t7i/kluZlK0mezVxv6I+xj7GXh4eST7eJmpgkUBVlncL9UrNMNgZWI5KSM88YBBmQGBoQLoErS3D2pQCMmeFKHIVijtfEv/sS1cDz7GXD3noBT8irV5mTKRunNnsj7B44iyEr71dxTs6Uqf5XkLXTNHpK++Z2koTUe5nLsb4rAfgwAW6zpU+WDqqeNQI1LbmFxPFJ6xgAdmp7GAOPQrqzZilqT9KT2bDvOeaEJxc+xhXIiTlQSQDcquxQ65A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(5660300002)(478600001)(6486002)(6512007)(26005)(6506007)(41300700001)(38100700002)(83380400001)(86362001)(82960400001)(2906002)(202311291699003)(6666004)(44832011)(66946007)(316002)(6636002)(66476007)(54906003)(66556008)(4326008)(6862004)(8936002)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azNMMG1QOTJkRkRsTVl0TDAvdjQveEZ5NnRHVmZDS09ERmxHQ2d5bjJ0MVFr?=
 =?utf-8?B?aEZtMUJPTCtkNjNwTTdQM213THdIaTJmWWZYVlg4MEhDL1JLWmNSQlR2cGgy?=
 =?utf-8?B?UUF4RTNVN0dDcng5cDcvWTVpY0lHb3Zid2FONXIzSm42MVB2U1V0UjIzZmx3?=
 =?utf-8?B?YlhVbUs3QkxVK1V5dEFzdW9aS0N4Q0wvN0Q2ZVBMWHk3cVdpSk94enB0Y0g2?=
 =?utf-8?B?NUphazNGZ0dUTE4rTTJIa1JNOFRFN092RkFqekM3V0x2WHhEN2NzVHR0YkQr?=
 =?utf-8?B?d00zcVRTcUlPWVdVWmFZbUxqc2habnZYaUJ0WmIzR09Obk9oc1p6bmdxYnVS?=
 =?utf-8?B?NVlYeTFmWDBRQ1NTblRwUTkycXlEZ0xHTzltT3ZrbUlDL0l6ajIvTHZuUS9h?=
 =?utf-8?B?d2JKVDBMV1p3ai9IR3ROSEpSTVd5bjV2WWhwQjlNMUhFQXpKeWgzR3ZCNXM2?=
 =?utf-8?B?ZEliRjJ2NnNQMTFnT2pQdEh2SnlkQ3VKN0pTakhYMTV3dmpNb0VzQ0VQeGZl?=
 =?utf-8?B?blNCV3N0aldzc3J4TFdTb2Z1WTh5TEo1R2p2TXgxMmVXUnlYL1ZSYW5RajI1?=
 =?utf-8?B?MVdMaklhQngrVkczZnU4Q2lUQ0c4d0VkZnZhT0kza0hXV3cxQzhyaWFyOEJP?=
 =?utf-8?B?ZkJzYVBGbmtaVklXVUhkZFJ6SE1rUTVPVlpOTFBrUE9uOG9nRnd4S1d2a2Zq?=
 =?utf-8?B?VmlzNFVXMFpqMWVTQ09iMmxwam42ZjdkWDBzclMvckl3ZEpSVkVRZXVMNFdW?=
 =?utf-8?B?ZWFpUE1KbGsraGZmalk4NkQ3Mjg3VFBKbVF4M1FRU0RtcVhNT0ZsZFNlaUZu?=
 =?utf-8?B?Y1VMTkJGQ2duQWpvQkhPMjZSU2RmRXlCU1VPeHR5MEtVSzVFcUkycWRaTEFx?=
 =?utf-8?B?WHR6K09uTGNKazNIOXFiME1sYVV3eGdEUjdWQmZsTkl3cTR3MXRFZkszUzFX?=
 =?utf-8?B?blJ1RWNsU2l1NGxzVnVVQXhGWjh3TWFRMjgzSm04cnFYUkhwczMvcmo2Z25q?=
 =?utf-8?B?bVZiemZrMEpWcmhFTkh6RU1CR3p5SGtielVNcXZRTW5WdEtlcldGNDhtZ2FZ?=
 =?utf-8?B?SjZ2VXFuU0pQaGJHbFppV0dweXExbW9LVzRYUlNVUGFWWlZCUXRqdENwazlh?=
 =?utf-8?B?K21wa3d6VVNIV0g3VGxRaVJ5eEtZOTlmL1RGd0ErNTRCOThPeFNIUldCdUtq?=
 =?utf-8?B?Rm0zSXdLRXVHekQ4R3dCLzlkMXFyWFl2aEx2Q1lMYmI3YTFzd3NsVmlVY01W?=
 =?utf-8?B?TmU0TWV3dEV2cnY5U2h3WjVDSVN1UzlsN3dneDVVOCt2S0FuaEZjSm0xeHBQ?=
 =?utf-8?B?NnVZSW53OVRCQ0hja0pPNEV3L2Y4Wk5SVzZMZkl4MTdLT3VEYjNxYk5Zam1n?=
 =?utf-8?B?Z2NKNFBMT2JwRnJYRlUvT0xEZGJ6WHBTRFp5L1RSdVBsbURucTJTWUQzWkZV?=
 =?utf-8?B?WUFueXE0NktrWjlKZEZSUVBjemdIOVhadUYrTlNFUjJyMmJVL0lrc3BEbWgr?=
 =?utf-8?B?OUdLa0hFOGlWTFA4RFpML0RaWWozc3I4N09YQm5LQXRmVUJjRVN3Mk8xTXQx?=
 =?utf-8?B?MnkvaUVEU1dKS3BoTG9YS29RVll2UW9OLy9ROFNLS2ZxaWdvd3FkZW41Zkcy?=
 =?utf-8?B?dlVnUWxjMWFXelVMTTBxK243djIxeWhUUGx0QnlTZGczZXVrdkRrOXIrK011?=
 =?utf-8?B?UWNrai9UdTh5ZGRubjQ5VUpiT1JOUnV5RFJEeWJtNGZUQUhFU3VHY0hmbFYr?=
 =?utf-8?B?UlNDWTVqQlhtcjhDeFhtV2Z2ZklNNGU2cUN1MzUrQWhlTUJMb3oycGVGR3Fp?=
 =?utf-8?B?TWVXa2grWW41cWlNM3QrOENlYjgwdHhpMlRRdUU1bURoR05nUCtYR2JlZU9F?=
 =?utf-8?B?S1Z5QzJ0cDF4emE5NUdqQlBkMkZIZllWSFhVSWNIU25ETWdkaHoya3dkQjZC?=
 =?utf-8?B?ZElwUTJDVDRKMGFtTksyT0tNQm9LVWdsbEF3MWdDcTErR09vSlFpbDlBUmlX?=
 =?utf-8?B?ZXdIMzNKY1BTVkZqWTVlWFd0OWp3ZzZOdmhPdE1uRExxbmxHTkMvY2lIajRy?=
 =?utf-8?B?ci9tWXdybjJiWUUxejFIZVd6dmJtOG5UdVByTEpZUlh4cXM4U2F6cE9jU0FT?=
 =?utf-8?B?RWx5SU0yNmYzejFWYW1tOVVtL3JZOXJoc1dvU0huamN2U0Qzd2diUk1ZZm1k?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89adafc5-179b-4096-db12-08dbf1447b08
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 01:34:22.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wD5bFaC7p22OLSbAsjCZqxQ36/V8o7AfEU9miqXIc7iJ9Mmo4Lr0rADtPTjhFZXYg98q8Vd8H9lp0R5y51h1YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8142
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 23/23] drm/xe: Initialize GuC earlier
 during probe
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 11:35:08PM +0100, Michał Winiarski wrote:
> SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
> to access a curated subset that is needed to initialize the driver by
> communicating with SR-IOV PF using GuC CT.
> Initialize GuC earlier in order to keep the unified probe ordering
> between VF and PF modes.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v3 -> v4:
> - Introduce xe_gt_init_hwconfig (Matt Brost)
> - Init PAT before loading GuC
> v4 -> v5:
> - Move the comment (+ engine mask assignment) about using engine mask
>   from hwconfig blob into xe_gt_init_hwconfig() (Brian Welty)
> 
>  drivers/gpu/drm/xe/xe_device.c |  6 ++++
>  drivers/gpu/drm/xe/xe_gt.c     | 57 +++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_gt.h     |  1 +
>  drivers/gpu/drm/xe/xe_uc.c     | 11 +++++--
>  4 files changed, 55 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 65e9aa5e6c31e..a236c36cdae3c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -425,6 +425,12 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_init_hwconfig(gt);
> +		if (err)
> +			return err;
> +	}
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 7498d36a97e44..8be800d0d8752 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -298,7 +298,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>  		return err;
>  
>  	xe_gt_topology_init(gt);
> -	xe_gt_mcr_init(gt);
>  
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	if (err)
> @@ -337,27 +336,14 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_hw_fence_irq;
>  
> -	xe_pat_init(gt);
> -
>  	if (!xe_gt_is_media_type(gt)) {
>  		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>  		if (err)
>  			goto err_force_wake;
>  	}
>  
> -	err = xe_uc_init(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
> -	err = xe_uc_init_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>  	xe_gt_idle_sysfs_init(&gt->gtidle);
>  
> -	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> -	gt->info.engine_mask = gt->info.__engine_mask;
> -
>  	/* Enable per hw engine IRQs */
>  	xe_irq_enable_hwe(gt);
>  
> @@ -416,10 +402,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	err = xe_uc_init_post_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>  	if (!xe_gt_is_media_type(gt)) {
>  		/*
>  		 * USM has its only SA pool to non-block behind user operations
> @@ -443,6 +425,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  		}
>  	}
>  
> +	err = xe_uc_init_post_hwconfig(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
>  	err = xe_uc_init_hw(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> @@ -463,6 +449,41 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/*
> + * Initialize enough GT to be able to load GuC in order to obtain hwconfig and enable CTB
> + * communication.
> + */
> +int xe_gt_init_hwconfig(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		goto out;
> +
> +	xe_gt_mcr_init(gt);
> +	xe_pat_init(gt);
> +
> +	err = xe_uc_init(&gt->uc);
> +	if (err)
> +		goto out_fw;
> +
> +	err = xe_uc_init_hwconfig(&gt->uc);
> +	if (err)
> +		goto out_fw;
> +
> +	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> +	gt->info.engine_mask = gt->info.__engine_mask;
> +
> +out_fw:
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +
> +	return err;
> +}
> +
>  int xe_gt_init(struct xe_gt *gt)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a03..e9d6aeceb56af 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -31,6 +31,7 @@ static inline bool xe_fault_inject_gt_reset(void)
>  #endif
>  
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> +int xe_gt_init_hwconfig(struct xe_gt *gt);
>  int xe_gt_init_early(struct xe_gt *gt);
>  int xe_gt_init(struct xe_gt *gt);
>  int xe_gt_record_default_lrcs(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 72a7b3c2577dd..cb50ea630a098 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -30,13 +30,15 @@ uc_to_xe(struct xe_uc *uc)
>  /* Should be called once at driver load only */
>  int xe_uc_init(struct xe_uc *uc)
>  {
> +	struct xe_device *xe = uc_to_xe(uc);
>  	int ret;
>  
> +	xe_device_mem_access_get(xe);
> +
>  	/*
>  	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
>  	 * to correctly move our tracking of the FW state to "disabled".
>  	 */
> -
>  	ret = xe_guc_init(&uc->guc);
>  	if (ret)
>  		goto err;
> @@ -50,7 +52,7 @@ int xe_uc_init(struct xe_uc *uc)
>  		goto err;
>  
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> -		return 0;
> +		goto out;
>  
>  	ret = xe_wopcm_init(&uc->wopcm);
>  	if (ret)
> @@ -60,9 +62,14 @@ int xe_uc_init(struct xe_uc *uc)
>  	if (ret)
>  		goto err;
>  
> +out:
> +	xe_device_mem_access_put(xe);
> +
>  	return 0;
>  
>  err:
> +	xe_device_mem_access_put(xe);
> +
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 
