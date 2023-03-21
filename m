Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD5EC6FD20
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 21:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FEB10E2BC;
	Tue, 21 Mar 2023 21:04:01 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A153E10E845
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679432638; x=1710968638;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RR/A16wqeSiz2OXiKZStuXfP142Yp22OnN/6Ysk8oBY=;
 b=JTo8k+hB+6AxrF5k4+rl0XZuPBJCIzgXsHhdPiBV+jnLBNOZ/nMmXPvw
 zAa74cHjaenZlmKxi5yLIlsrCygWQfvH1n5zlAKMLcw3zTNCEmHoQdoX9
 65oI8fPcq++ngHxkWv8sMyfhypRg9Q+LdUyeLjnjtYdbmAJhBGipnhIpm
 3eqJoDXees6Hj0hww8E0u/c0dQrHSUTWeC9JrUXiwgUnh2ElekQrUspdX
 Cxz9v0CAIPDa2q8MVALe674998TVDAv4g5pRD45TiWSk6udSbBjrA8G+K
 sI3yaSyMaM7s5wcVPK+ZTbp/UA9NGSVILEFlJEsS8+MFmHPZfhND52/rA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401630683"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="401630683"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 14:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="770796567"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="770796567"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2023 14:03:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 14:03:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 14:03:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 14:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsYdB/2JoicxjldUYK5kTipkX9LYRGYYNFX5BHtZE/HsnpIMX4KgCNhi9OxiGsNuYoaNk8KswmjUwli7uZWy1Fn66xH1WYFYG+OhJW48xmKw+kBFwFkJbW6dulibf3WS4wPluFZfer2LuxYgRSgddaWcFonVxCwACPY4Dxlo29/arZ0Motxt3PeK0oKZFx1triXBKjsLslF90FQcSDWdoNB5PgWnUlG/hjtUJ+7bMNGGLH6fH+CQw8RSdXiW5a3iF95itjs+zE5EKn9mG6265CYN0P+DmiQhv3SlWF3BEz7qxW+zIGQCrb3lZX2XOdpwqFffnDRXZ1yHOSDigPoZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+Utof6TBHImhPZitrP8HC/QK0xY9ATyettgfiYBTOo=;
 b=Vn2LJm+E0+J49+2VAj7S3JEH3pCpWtr5x369do4Z7n/qjc+OTOUSe0FXb1/qghOHmQWA3X+hMKK1b8+7HOvZd+V7l2yNfBc2iK3DwNI6F/q30yv2pi8aC8hMoaBWpUC/Mn35/8pNl76CrkmjBgrHTTG1nog0PYlgXTH7Pzf1aBIj9+nUs8qNcN5DyU6pJ5hw/aaABMaTsrZsGOb09c/kKF54js1BdCUruD/gVLqgIQeWtrc5rCkSLsCb/Ebv6YzE2IJ2qcnRn+HVsu9i8R3DX1JFpcNAs0XGezGsNn8P14nvFhOZ68jLtGwD3Fowsb3SCaPdrGTo1X/JdLiU9H8W5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 21:03:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 21:03:53 +0000
Date: Tue, 21 Mar 2023 14:03:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230321210349.mr5e233da5ihvv5f@ldmartin-desk2.lan>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230320235254.3288679-2-anusha.srivatsa@intel.com>
 <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:303:8f::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: fd39e3c5-8bb1-41a2-1da0-08db2a4fc6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDCa3b0iJctd+XhF+tnBdJWZoTR+tQV7XDv+YOjx1LhekUBv38aEZ5p5chjiVrZSdAeIc7Grch4t65xlHfJV+8UuAw1ZB+fDmTLmKH+uLW9w/RaLlKESebFrn1V3SidOo5TQCKNYp+85UvLcKz8kWLjcS5rnZEUoWxuW05tquqC9qBoISqiCzcSSJBiLykQXFOj6D9sKrRmKh9lY91AuKpT1Vj8M+ZPHsmTP+KMVoQxJLrOrfYS3TECDyWaPMgetbtESG4h7fMxGzWKy+PUQXDevXF+SvCMP17ArEMZo2j0tqlL1LHBosJMhmP0nYLwhnz8rjRpcr/MixqJkFXh7c8Sdcf8LGeaZF1UdhJu3Y0abG+RJ5nAcRjByEWvuQLueG+alcDfVQu2TsHrRUJB+gGShF1Jep/QnTNQWuxcV9N0/FHLRp4h7TBAlOu2n47+hqMBWvHWrWk0tRC0AUq9T5PCVyQQGnJpV9c38Js9Knk4aHWY2hjjeViTEffTI9oY8GPmmtJvBUqlDlFlrA7a4i3wvVu8A73pv0+y3Nc4ALOuD6xwdk8nvuCz91NN0Jjr4QsF1GTDWdzfcl4D9U4karS2tKpYG2mcEkammIt9HC5JqnSRUQnTXR5GyNWMg99KLsXInPFoT0zCMhLvswRTNBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199018)(83380400001)(6512007)(6506007)(6486002)(6636002)(478600001)(316002)(26005)(1076003)(5660300002)(9686003)(6666004)(186003)(86362001)(38100700002)(82960400001)(66946007)(6862004)(41300700001)(8936002)(2906002)(66476007)(66556008)(8676002)(4326008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Je9NuLtL62zXhoHLQkZ+YsYiDZc/BqXUrcAlGk2E/1mEa3pjJab+5kULbSm?=
 =?us-ascii?Q?czsN0+dVmOIQWMVEBjIJicVYYncpLw/LdSMOqgyNGZuSSaVLn6P0qkUGWB1B?=
 =?us-ascii?Q?6DMMw80FXB0XYQT/2Nh73iQvRufG1c9hFCLM1zprstGlPfmtKp4/TNBEQ2qK?=
 =?us-ascii?Q?kXj/xs0vHkC0hiPotRaCgWChiPtKOzGbLhhjGsRzINZV6UwhT2dPouRKPCL7?=
 =?us-ascii?Q?XEtTVqjyYyJMV8NyqdGwrbPmIYnBH/EAe729bOclQuzPS05tJYKhmAg++6Qk?=
 =?us-ascii?Q?W0mR2iADT+zKFeajlvhXpKASBuhiUqWN1JCS7zGhTfcJn4I5Vy/HX9kI6fiR?=
 =?us-ascii?Q?C9YMtcdRewM4mnDY/5NsjSmT+kxz9Xc+4+rvvGoZc4Yi+VWDicgXzW3ZBr5R?=
 =?us-ascii?Q?lgZld5QE2Zia4ecS31KYyPcIp5ChdkmlTk47v22398n01L5eQXUvFVBh7rxa?=
 =?us-ascii?Q?DcZw3LRxOLru6P2DIgzJpYsSUQNxmabq2xpYe9B6OuG9fMUN520aDosSrv44?=
 =?us-ascii?Q?tcassJzRiSs/GK/TFnay3BasUhbS4ERoe6Re7Iy7aFp46bn8lYJ2J1Ajow64?=
 =?us-ascii?Q?19NIF019nkaCKkeDz6PzTFF+EPRqrDc4bquho5B4Bgy2BBgNZy5uGK3HxhR1?=
 =?us-ascii?Q?LL8I6fZ5LBng94BSiwV/2II6l5pFp/7+J5MO7yQU90haSSnQqo88ht3kKeS4?=
 =?us-ascii?Q?anvEv98RTyYIrSQjIphOGfBLqaI1+JiFYBCsJvUjfMiPku1Z7R+JCeMWhjmO?=
 =?us-ascii?Q?OfE/O/p7iTcl8d70LQ8vvJ4ABU+ux3Xcvrc0M6Osaa13lEl865hHsSn6xLIJ?=
 =?us-ascii?Q?79b+yQFkEeyzK5xwKJzOLLxj8PlSli3AyvAuNAgkm3mEz8GhdwlU+TujBXLj?=
 =?us-ascii?Q?G8oGq2UzGnz9PoLF8GO5aruIAz+21eZvAZZRaMAh/zpr4fH6izYSkDLa48LX?=
 =?us-ascii?Q?bddInVyqjsHNwiszMg7CQeDyXVyWSEkg99MJdoMJfIlBdiNJFf3+CtlMGJgb?=
 =?us-ascii?Q?kLxLrG0wRuuM7MBr/UnmbPpW05BgxVHPT9AP7ktMuj7Sm9DTvbIiInCEvlj/?=
 =?us-ascii?Q?k550zDjmP80CyIVXR0n0IOEyJOhgBz0cE+CwIqRsdZ/tdh/1A9t45osA1ygs?=
 =?us-ascii?Q?yPceGgdN50LAaOQhUR/l5OhBiOyTnSGLkhspfyf8slwEldVRY+QfHwEZpEWn?=
 =?us-ascii?Q?Ox2pYnJx9h7Xo3T1YUHel7hG5sh/vHuqUUZ7SdvZkT1kEIjXFYam3gRa3bhj?=
 =?us-ascii?Q?Fat7jWr6lLvQSlTH6tv4d/oNjr1xPDVlXelRK49jjZ0lao9lyHxn/CkyCKB5?=
 =?us-ascii?Q?blsiLZjbDRmiOXKVBHhQSNoa/l2iD0j9xNzmHpyF52ON3FvY5XYv9KIst3ww?=
 =?us-ascii?Q?XgAk5Mmh2e/Zivm/plJHMvB4rf+kYD95lTXv2TDi3CEDhaIShGq2rnQcGeX7?=
 =?us-ascii?Q?H6BqdPWir6vNO+97cWB1N3h78gqzTpAC4NC1+JoaZZcaVu7sOOrYL8YTC21m?=
 =?us-ascii?Q?EiRegWjnWQz6jc/Oz4btEroeWW9SaRhnkm0XcyCVoWfhhWk8zZAMJ/EVC5oz?=
 =?us-ascii?Q?gSTLD8S0jOqsISvHEW7VIgNOdi64c88qKDtigZAfSr97/+NYkRCqigNgg5XA?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd39e3c5-8bb1-41a2-1da0-08db2a4fc6b0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:03:52.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Frl31ZgGNVe6RWv/k0GPhRzH90714Bkwa2xS9ki22kI3jdjpVErK+WtYzT2+xyQ1PYjXqWz9hoiLk5udjHkLvSvHxjP6CR4uQxUWOCtoNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 08:50:59AM -0700, Matt Roper wrote:
>On Mon, Mar 20, 2023 at 04:52:54PM -0700, Anusha Srivatsa wrote:
>> Follow the new direction of firmware and add macro
>> support for loading unversioned HuC.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index e2e5f7fbe9db..3c522d970228 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>>  	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
>>  	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
>>
>> -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>> +#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \
>
>Why do we still need the old versioned filename?  Can't we get rid of it
>completely?  There's no backwards compatibility necessary on Xe yet so
>this is our chance to eliminate the version numbers on HuC completely.
>It's not clear to me why we're still using huc_def instead of huc_raw
>below either.

note the version is saved to uc_fw->major_ver_wanted and
uc_fw->minor_ver_wanted.

Later when we are parsing the blob we read the version that is encoded
inside the blob (rather than on the filename).  See xe_uc_fw_init().
I think the version check is still makes sense:
major should never change and minor has to be equal on greater than
the one we first started supporting.

The version in the filename needs to be removed, however the version in
the table I believe can stay... it should basically check the minimum
version required. We could rename s/minor_ver_wanted/minor_ver_minimum/
to clarify.  And comments on top of the macro definition to document.

Lucas De Marchi
