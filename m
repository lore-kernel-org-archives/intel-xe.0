Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5457BC001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAC810E6BD;
	Fri, 11 Aug 2023 16:42:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562610E6BD
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691772176; x=1723308176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EM73x0KNLA8Kk2c3HaS+spSx8JTHLmsLWe1LUNE1T60=;
 b=VJ9G5QipR7huo5EbApTaLhl3WgaHBW0zw4s6Mvm613PSUXv0wfQAwGvr
 cqrFE/GxoKEuDA76TfbxWsyEiaDNje0ZDU3V6NbzUMZOZBKDcjbL5OQqC
 WcgVY6wpeJpP6KfYWLTF+cuUgscKbbohQQtMgnfRXoZzJVrQn5nt/Y9yz
 rL3vjjvyE30J7NbGP+zCBnbQFdhczYen6htPQ458PraCtua6JOHaU9Lt9
 zRLN8VtGQfmrCI22VMn4xi8fWeP7CsT91Ccb0MR3TvYQvF2OGlQZT3oT8
 lKDHji5D7yrdcVNe5IWL+03uGguFtRViYjBajrnXd/6jeS+wugFKhJvqP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375428260"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="375428260"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709584984"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="709584984"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 11 Aug 2023 09:42:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 09:42:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 09:42:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 09:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GM/W/8tUgKIP/MKrlanFRGbyodu2a7itJVIkjCUbnUHrR1MDKdiKiu4t7iVY5SccxG/dIhKNHhMMPe2oqyqhGOZWqmvjLN+rkajOFWqhZ8wi3lXx7q+73PGrXpXRsU8bO1BgbG/0sIiIMEXBj0hQKcMl+Ru4L7Ls214bYRFisnWfBrMJMiXghkKxjurYdeekyaLaTl4wJqXLbpLssT0shPvyCp+CH4rKzXksAq89mvFcP/7ktXbDfQdFBshDx7uNWh7Ah/iKxDpGjjtTuotpRyKYvO4fK+A24m7CZ2NXtRujBamVoxVf5YIsQhhdIpLP+pEeKhJeA9Bb4ZtPS5dXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KExEjtPddj/e8aiBuYfCFDyi9+pXAiAP1QBEXMiOawI=;
 b=EmCo6Gq2Xp79RHH8hMG1iWAti2eDeOz/aarsNqjSF+bAxkAQtj/B9FhscZ+6ZuyMOhdYF1uRfk/UBG1Z5sAjE+BBAByE3rDVsTYjd/g1kA5jIu5KEY4rzr5/pWIXhQTCSWkxTMjSJD4qHQpEI8AlQ17sX3Op1weyllHuKIVn5aDqg/G4dp6CUXjRODSd20PMNGs4rnOXF01aJTcE+NZBkXjd/ZKD/TuAVFOejdpGVCD5cbm0YiB6L9Kl3vagTIedROtTf7JdvWyfjv8ge+2O1OT+ZbOtlynphQvgQsHKKR8JdJYk3KgOUq3HDiqEy9lF7ufRh7wzYAfIyL3d4HGKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 16:42:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 16:42:51 +0000
Date: Fri, 11 Aug 2023 09:42:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ezrst2rq54kbpo4qjdsu7t5r2mzuuvh6ek4yexjw7hqw4sqhjn@tdipjfziretp>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-14-lucas.demarchi@intel.com>
 <20230811162347.GH3375865@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230811162347.GH3375865@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: cd10de75-4e44-4d1f-0e6d-08db9a8a00af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hocYx+lkdj0Qc+YdGraz12DgQ9YoWjGmBfcMWZMclhnxw6Vq6ICxaYe8hIq8mzDSCbgJG6i2WGmie4+jqIRJpbqYJ20fQLA2vmY5l6NPowO7Guu2HjEpJKrmNkqB3ToSonG91z9UoiPFyqglXXIcKpuMzRI0ARph5N3Vyovrv6Vv2y4565zufc1BMR0LwLTzHH6dRS7RGdMXlooSuWn2r/GWPf1jiJRdZF7YWhq7l+hLgmuQQXDfC8BE3oLcihH75+az7Oid6uDThvDwrrP8RhStB5FSnnl+QBAyaykkmNsoVcBwUtinxh7p7pshp/3N1DwrEqd6oQtwuCnYRrFg7LSoqw5opIZT8QK82jSEOtYfP3ow2KSjefSwhQQBbmsLU3WhBxwwAVCcxIOquT256ue5XWsoC/XTbL8lOFQ4visZ6PD7aGnNoVGWGXIznOFM5DBBU05IB+bS4JwTglZMEp1Q0TUPV0yUqg5uiDubDW91j7x+0tFmvsCRbyC9khYEcHpvdM0VvQAzbGwO4yu0yOf8s1R7Zndpl9zY6rbjVYKBm355omOvO8BIjjfIkm7SAWjog2ewvjn5r1PIpKLyIa2V/4Y44+qnWWoVmQM/gZ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(186006)(1800799006)(9686003)(6512007)(478600001)(6486002)(6506007)(26005)(2906002)(33716001)(5660300002)(66556008)(66946007)(66476007)(4326008)(6636002)(8936002)(6862004)(8676002)(316002)(41300700001)(86362001)(82960400001)(38100700002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dk+SbMpYC3EhScCGrkr0hfIyyRiHTUsFQjVuermMf9Ha3g3zQPgMpw/aTsYq?=
 =?us-ascii?Q?OFNoDLRxs3sIPSPNSuRqai5PZfmrTFq9fxXP8Q4hQWPVnY0gepyPNYdFagZv?=
 =?us-ascii?Q?aV6cZfgdZ8WbkuWpwwCgMBabJnqfdv8i69GPY0Bxe4eLh/BG7BNu64eBH/AB?=
 =?us-ascii?Q?Po0nHIc/X1YiH5uc23DrHy1iThcEIf5kO9jq48dhMLImM8A9yhchOc6QTXcA?=
 =?us-ascii?Q?U9CXzZv+BuxHJXMKDTxGjMyBSA9N7gcWaSWxL72qbpRCZ/kG0SoasfHDFKf1?=
 =?us-ascii?Q?NdtaXAoSp9RvQ+XnxhkvpWhoJYpUsetfaVlfQUsddT2WzC30zWFe/qVc5n2G?=
 =?us-ascii?Q?wIPSq6QLddNxDspkT/SJiys9yl3f/DnoBjvYJrG/1ENt1w1PryijteKk3EFY?=
 =?us-ascii?Q?6vnzPoV1hgpjdxlXmrogquNpOoxMdnQnllCv3Z+d9iWN7Orcous+L7+zEPDS?=
 =?us-ascii?Q?13QYpZHGW0zIluSlAyUEzi01pxyjk3QNf3DFGLIn+78rNMKqj8+pk8Kw/3eS?=
 =?us-ascii?Q?oS2/MxhhFCNOEChl9mBzmXj2aGYvabtE0tu5fypLwTJryprTgLpok3/DqP3H?=
 =?us-ascii?Q?0eh7cbDOs0eN4JwURSIhYZiY0UBTu203YTIOEU/dHKGKqOGro0fUuDWORVAM?=
 =?us-ascii?Q?bin4VXdDOyyAlOK11QfOCjWZBGy0GPKPZpEsAFWwP4i4q0pckscqNVPWtJQf?=
 =?us-ascii?Q?BxypuSxvRI62wxxZt7GqaujQbbHpvTv3CcMT8j64cetCzaMadZKoP7XsIc4x?=
 =?us-ascii?Q?sXXQqAzsT/kTks6bH8gq1ronHbnRVVFfWqEFMJoQZ79CwGA56aAGz1yOkFyW?=
 =?us-ascii?Q?2+td/IB3G9eWlEXPtCFMoXyPCqL9asEb1VR5yQT9t2+rLn2BOW7rknXiricT?=
 =?us-ascii?Q?QwFWPcfesuqT6YPXFvo3AGpuuKGwJnrO2/OK26ChxxH4vrg45u+CWLAG5B+5?=
 =?us-ascii?Q?JJSkkqPBzWdpHfpLJrYjqVaS66RKHi5eCvQ6tK0pwjPsOpl7Zxp1yaTjVBGk?=
 =?us-ascii?Q?tW8rsPb2S8AHZQ6maIVbgk/RUXp2ZNUHacMa2eTUwPfRidoo+uoKslVENzEe?=
 =?us-ascii?Q?NZqJ/I7PNUCb1SHlCE6Wg6qQhruJ5FHOgLVFy9DlMN948C/CX0zy1azlp7no?=
 =?us-ascii?Q?sODuI6KTWUanvCkMBTJN3K0CkCQ9ysZVcgQr5hJaSXsCTV+XqntrMT7rVTLl?=
 =?us-ascii?Q?HeCREH2/q+3xZRjz/QtX2dD/xoGI1BcEsk+0+ney+RrIKHCuKUOutwxdzu+f?=
 =?us-ascii?Q?4/HuKPFGRf7bwxOpvDsOHKDilTkkVNErf2IbHCbvvBDIwJ7wjb5nwxSOyuBz?=
 =?us-ascii?Q?o9FRSqb/GlIJScASZKkSDC5gDhbkir9tk7hclsxrTjexCqpvI7NJsMoqNxc1?=
 =?us-ascii?Q?/C2YftoyJi/l0reWSwkRaJ1ZDdCKOrpEkExi8KldSSg9AbMONsUV6uA2FSVM?=
 =?us-ascii?Q?VrziREyM6Q7CDe+pcViWjxURiYsFd3incIKg7erCF8TJ3n1dDyxo5YDIl7qT?=
 =?us-ascii?Q?maRjSlcueAwfpetM8fxXNZBxu11fK9CoSTyWueqzMQhWB3rWQkyLsuQF1U8x?=
 =?us-ascii?Q?0YUNdm3kMqfyG6zZnN1Kyl2QqheQjngr70Oc1I6iEpD9QLW/bB78FXMaTnZs?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd10de75-4e44-4d1f-0e6d-08db9a8a00af
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 16:42:51.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ESwSgfUKK5gZIbsDLXM8Jj230ZZ0e71HW6zDbNj9fymNjkNs5WmjKbwAuAKOMlsotMIqMq7Nn/7HFqXLlQOJKzQYxe//DbSt3lsUPr11Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/15] drm/xe/lnl: Add LNL platform definition
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

On Fri, Aug 11, 2023 at 09:23:47AM -0700, Matt Roper wrote:
>On Fri, Aug 11, 2023 at 09:06:16AM -0700, Lucas De Marchi wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> LNL is an integrated GPU based on the Xe2 architecture.
>>
>> Bspec: 70821
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>
>Since this patch is just being posted for the first time, was this
>supposed to be a Cc: rather than an r-b?


yes, it was supposed to be a Cc. Thanks for catching that.

Lucas De Marchi

>
>
>Matt
>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
>>  drivers/gpu/drm/xe/xe_platform_types.h | 1 +
>>  include/drm/xe_pciids.h                | 5 +++++
>>  3 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 70d5f25c0d208..5e3ffe76cc460 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -342,6 +342,12 @@ static const struct xe_device_desc mtl_desc = {
>>  	.has_display = true,
>>  };
>>
>> +static const struct xe_device_desc lnl_desc = {
>> +	PLATFORM(XE_LUNARLAKE),
>> +	.has_4tile = true,
>> +	.require_force_probe = true,
>> +};
>> +
>>  #undef PLATFORM
>>  __diag_pop();
>>
>> @@ -382,6 +388,7 @@ static const struct pci_device_id pciidlist[] = {
>>  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
>>  	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>>  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>> +	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(pci, pciidlist);
>> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
>> index abbb8a1f29a8e..e378a64a0f863 100644
>> --- a/drivers/gpu/drm/xe/xe_platform_types.h
>> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
>> @@ -21,6 +21,7 @@ enum xe_platform {
>>  	XE_DG2,
>>  	XE_PVC,
>>  	XE_METEORLAKE,
>> +	XE_LUNARLAKE,
>>  };
>>
>>  enum xe_subplatform {
>> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>> index 43afd973e153b..29f07a00ac0fd 100644
>> --- a/include/drm/xe_pciids.h
>> +++ b/include/drm/xe_pciids.h
>> @@ -207,4 +207,9 @@
>>  	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
>>  	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
>>
>> +#define XE_LNL_IDS(MACRO__, ...) \
>> +	MACRO__(0x6420, ## __VA_ARGS__), \
>> +	MACRO__(0x64A0, ## __VA_ARGS__), \
>> +	MACRO__(0x64B0, ## __VA_ARGS__)
>> +
>>  #endif
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
