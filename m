Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29655C2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 20:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9E10E119;
	Mon, 20 Nov 2023 20:04:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875D210E119
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700510694; x=1732046694;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o0/wvgbFsX473BNwWBtJGLI8Evv3mC0LnhDI9xpNcjk=;
 b=lCuChPUTAvuiqgN5GCaxgc80430DN6pCqxZfyKh9Rpy5expEUispUFlf
 7L4KrmvV+mti6f3xVA99m9aw8HoGq0uf07qxxwRE41rAiCmg4TdK1Qpu6
 vxFzVYf/4riLy4pWzzJSV9dOAq1j1WVur8jDXRI5bVY0vVFWqtVn6JvsI
 J0wNY/Vpd4+4zF2UvPDExEZ+EmuLzQ2x7J6iw2+oAKQdiSGDsdJuq7k5v
 tyhV8IsaagSVJPdEAENBH/U/mCggQqvDxpYMfkvqmVqj4xhl/CAywlmkl
 tESHJQpnnRNlawzmqm2oCY/57BqH5qhZrJNhYpdwtuikQEA2liuky6MOd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477902606"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="477902606"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 12:04:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="883964357"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="883964357"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 12:04:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 12:04:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 12:04:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 12:04:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dr8bi4B+A3ijoCTHzBnANSj1n7AzHkaLsbGeb0/RiGrlnX/uIrKZ+kFNSf0PJqhocOKqtpvHG+MDsXASCcobNsoTqgYAYMa8pYPZ/8aW9xekjXuLKC6E7W5vqAba/ju0eD8RhRv1llTsrDC0SvX0lGDLy7/hBJTycmVbiECuHJpLi8JwxgTPn39EtdXKJ1OY3NcZ5Ar97roWxVGcxpMO6oIAPDCUsfG5g3vwjRcRv+6e01LEUiYVwAWSpbWPVonD9Q1g3ADMpyfEtkw6/9flzTcxNXSjoDXC69BasJLOEQl7GVrccjFfqnxQ6q6s238A0W9Hxsdd8heIsuHC/FltAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vgr8Xamjk0h6MjBmX5IVkk2cGh8Pop7kO95EKXk0jQ=;
 b=h4SQtOTCn3zSVYzAZchk/jyUmlDLptDf/H+pqFm3Ya0eUlm4otHtr+AN0Mwt6yMurF7WsZ9NSzMhGaajR3z0ShkJbiL2SUQs7t1/zyDaSBnhyESuyJknQkyshK/dV0GPZRW5iB3WHQXHVrtsWtKJgOO3v5SAOLwSTbeF4L+10Cc/hC+jKVTObFD4ppc2O1cowVVQcGLl7PjvcShdc1xIVT/r4ROU/7DZUO3VuEyk0qCs8QvFHi0b/rVFKUtk2TNUJBDm3sRalm0D6bCHv6Dhjbs57bCaj+NQA14OegAYFmOzDVJdNpfnQvPlTmmONDgh3YKB/aQB0fEXpkPSQ8qRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 20:04:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 20:04:48 +0000
Date: Mon, 20 Nov 2023 14:04:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <n4gpq5spqopx3mgajfln7s762y4uv5lwwbirjfrragkfanbg26@7gfibmbjccwa>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-16-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-16-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:74::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: a3781bfd-6b4f-4aca-1eb9-08dbea03f2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gfp53y0CSuELhEJUjabM2bbzwgj09a4ttJonDuTYpPFiiz9hpezlEeCs7st2eJ6X1MrnacdCCaWG080Cl7STRYoXiIijKavWTWosJKtlGpFZF75GtX1t/cccuE0kz7Y8VPO0TFbWYbPnutASab+LBRbXWdBJn6Azp9BEbhMmAx8JscgNRpqJF0TfNb3jeWe05ptrEu8B9ZIhw6t2OuUBFT3tkbjYE4slYEVOPzIrwbU0ZHjoaCzdNWHhfVvlmdfojH4OkKwyj6NArrq33xdxC0jhEgmaYOrQoWRYcCLhb/XI5mcffzEuoU0tRQ48zJ0QsYYcxGA0rVqXadR7kRoHkJ8Tflvd135cskM5T1EoDlteq1J1d8IEgcqT7pulmmu2kyUTdwFu++1IRDkx7llTKh3cfMrmvoz8edTKj5FDxfDJxCpE+ssRNI5SZzvORNDdjoaySM896mkDXx3K/f2M1uc6v+zCyFj0MT4lBJAFiW0UkUXUlQJm2AqgzyfN+b48hLJFuKnIYyY01m97C18ZLY8NsxYjUm3rKQQJKfNRRYOCF8yApIO+5z9X2Hr0p4ts
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6862004)(4326008)(8676002)(8936002)(82960400001)(26005)(38100700002)(66946007)(2906002)(54906003)(66476007)(66556008)(6636002)(316002)(86362001)(478600001)(5660300002)(6486002)(6506007)(107886003)(83380400001)(33716001)(41300700001)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVl1UHB3UDM0UWwrNmZuYjlqNzZKWVN0Y0M3a21aM09XYmJVT2ZxRkMwNngz?=
 =?utf-8?B?ZTZuMUI5NVZWai9nallzdTcrMFJTdE14SEdsOUVKQS95RVowS1NGRXUwMCsr?=
 =?utf-8?B?VCs3ZHdSVzcza1BPdjJqR25TMUZwRDRBeWRuOGtxblFnRCtpenpJMG1SRHpT?=
 =?utf-8?B?L09Vek8xT0Mvc3FPNzZ1dGk5NFNTSnlBNmV5a1pWemhvVUhWaFM4OWEyaERK?=
 =?utf-8?B?eDJ4YWdDQkM1R1RaOW44cWpiN2g4cUpYdWs2VUYrWk5DSW5sRUpmWWl0VFZE?=
 =?utf-8?B?KzJhamdlZE9sUDU5cy9kUFY5WlRYY2VXandKUHVXSTYrMnd3WW90SEFURmpQ?=
 =?utf-8?B?ZDUvbnIvZDlZdVhQLzJDeW9GWFFTbHJadkgrSjFYdDJDamdxZitFbER4c1Yv?=
 =?utf-8?B?Nlc0WlVQOGF2VGI5bzVONDVZQTkzaGN4ZHk2K2Y0aWlLcXpNMnBQVVNRdTI4?=
 =?utf-8?B?RWNTQmdsWU56OTk3WW5aTHhnV05LK0pkSHhDK2xJU0p2Y1U1YncxY2xuWVB0?=
 =?utf-8?B?QzBrNWZWOHdrM3ZIZkoyYVdWZ1hlQTcyNm9kSHFobTBUVGNjWWN4MU04aTlY?=
 =?utf-8?B?eVRVQ2FIVnA0NXZ1ZmtzTUZkMVBlK0F0YTY5aDBTMi80QzRBa0puc2FHY2NV?=
 =?utf-8?B?UVJLYnBybWtyY2YxNHZNYlJsUTEyWE5ld3lSQklXeHlVaUxGUW5GQXozUlJY?=
 =?utf-8?B?OGxiUmRkRHZFc1I0Vkd5S3BRbnVkekdxYlg0S3hZZ1lCbHVhSTNoRjFGc1M1?=
 =?utf-8?B?M0lsL2cwcENpUUtvWFoxcDNONWRFdE5keEg2dS9wN0pxd2F6QmlyOGozNkxh?=
 =?utf-8?B?QTVHTXBQOUpYejZPL1VMY082Sk9XQzVZOVl2Y25FZjdTdWJUTHZjbk5qUUlk?=
 =?utf-8?B?UC9yN2JtZmJSUnVtQ2g3dnlBMnYyTWwwd3Q0RFJUSWxxTVpMYkhxTVB2TW5L?=
 =?utf-8?B?UmV6SHIyQjQ0ajFIMjJPQ0MzL0hWelBQNUsyMkhOMk8vaFppZGZ2OHlaY0NY?=
 =?utf-8?B?M1hHd1I5Z25pSFRlL05TaDRNRjJxSTErZ09uVHpJaDlWTHQwazh5dktEemxn?=
 =?utf-8?B?SE1raTd5VitRdlRiVHNPbU5YZmJnNHFtU2c4dDQxM2w2TzJ3emJHempHMXlw?=
 =?utf-8?B?aGw2ZUZpMWtJNlJMczIvbUVzaXVVdndvZDVpQVAvb015R0o4Q0pBNmdKMW5y?=
 =?utf-8?B?dlNrbTkyMWIwaWJWWnRSZ1ZFOFNqVWtnajdwNS8wcUtFY0FCenlndUI0UXlD?=
 =?utf-8?B?UVBaZDdGZW9MMTBVa2FaYVI1Vm1zWTRTT2dKK1FCKzJQSjI1dzJGT0VYb3Np?=
 =?utf-8?B?L3kvUGtEL3RPVFNkQmdjZ1pOdVNlbVlEa0wvK3BpNmVtSzNoYlpuMXFJQkZj?=
 =?utf-8?B?cWRZRkFvM05tekt6SSszZm5QOCt2VEtSMVFmbEFMUVdubEV2MmhZWUJTK0Qy?=
 =?utf-8?B?YlNQSFJ2dEdmQXdZOW1VTldNRm80MCtpU3ZoQWNydnpEeFB1YlZQNXB3WHVi?=
 =?utf-8?B?LzNDRTFYSWtwV3R0L1l6ZkF0TzhWaUw2TjVoS2pCaFlkNHhiUmhTYmhDbGVp?=
 =?utf-8?B?UlcwL0QvdG9kM3o2MWVrWjhYamZzTWdVU29vSUF3TS95N0RrYkkvUUZJL2VU?=
 =?utf-8?B?UHhmSHlMNDlUNmNoOE5Nb3lDRFo1SmxMbThjL09pb21xY2FBM3JxSzl0U2Jv?=
 =?utf-8?B?Wk5NQlhtUnBIaloxZnFpV1phOWs2NGRxTCt5SHVmdGlSL3dVbXZoRDNPVzRx?=
 =?utf-8?B?TVg5UjJNVlBzd3p1UHR1N2RLeTNGb0o4RjJyTmZWV0NGMThxek9LVFczQmFH?=
 =?utf-8?B?WVFPWGQvOGVLcngzS3ovOFNkRWZ1SnQzdVB2SE9JNGhyMllrVXVKa0Qwd1VQ?=
 =?utf-8?B?VzZBQnRoV3Brd21wK3lSdDZuYnAzQ08vQnJwdVdyZlo5bTZtdFFWZG1SSmZq?=
 =?utf-8?B?dlhEZ28yeCs4VDVtVndKcTJRWlMvQ3BLNldUcVZvcnZ0UmE5aE1QTktqS3l0?=
 =?utf-8?B?Z1Zqa1ZEVGlMMEtzV1JJZ2xlS1RFWWVlQ2lIcXlBdkNMc1F3VDZOaTFvRE1r?=
 =?utf-8?B?Y0RLNXhGY2pmMWR0TUM0bHZmZk1YbDdoZWhDQTBVQkZyT1VKNDZ6R2h1OUlt?=
 =?utf-8?B?THpxL3MwUjNQZ1Y0bnJBeTBSMHJ5WVlGaytNSzhjdzU3L2xneHg1S010Ulhx?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3781bfd-6b4f-4aca-1eb9-08dbea03f2b1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 20:04:48.2304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErmU3TLFG8a/RGhyFmbpJ3EdnhOgkhY2sOnw3Fx/R6a6quyYY/5UOS6fTagvStPKINV/ixP2XVm3NS/5lmzxgfiHfHuQ4xIBKTRJVkA0q8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 15/20] drm/xe/uc: Store firmware binary in
 system-memory backed BO
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:26PM +0100, Michał Winiarski wrote:
>The firmware loading for GuC is about to be moved, and will happen much
>earlier in the probe process, when local-memory is not yet available.
>While this has the potential to make the firmware loading process
>slower, this is only happening during probe and full device reset.
>Since both are not hot-paths - store all UC-like firmware in system
>memory.

is this really possible? AFAIR we needed it to be in vram for DG2.
Or maybe it was a WA that is not needed anymore?

+Daniele. Do you remember any limitation here?

Lucas De Marchi

>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index df46751fb5959..b04dd7d034d83 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -636,8 +636,6 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
> int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> {
> 	const struct firmware *fw = NULL;
>-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>-	struct xe_tile *tile = gt_to_tile(gt);
> 	int err;
>
> 	err = uc_fw_request(uc_fw, &fw);
>@@ -649,7 +647,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 		return 0;
>
> 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
>-			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
>+			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
>
> 	uc_fw_release(fw);
>
>-- 
>2.42.1
>
