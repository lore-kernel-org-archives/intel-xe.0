Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F20C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DF710E0B5;
	Wed,  8 Mar 2023 22:41:58 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F327010E08D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678315316; x=1709851316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q8P/tNhUyC1lTEJOcwU9amSy1ozwTHICzzSz68E6Bas=;
 b=bX33KQPlLg3qRaYWJj64Ozta2Bs2ntsOsuLgxC3WT33kLpacqgGYa3Rw
 fXQrGMcY7G0lEJknCBYNVEKisuCN/dyq81jikXbD9IZuMRR+Gu0mzJeiD
 nPz124lByuG7Eqroplhqbe4Hf32iKRnpXKrfR4+e52LgPISZ2jLqkiyWz
 +K7AJnU3rhyCasUpKdYeBd5k4jC3z3Ao1BphVa1D11lrG2AsAOsiq0MI5
 ujk4In48EWKvx8lYTH5BOqDMh9iatTuXLrXrrLSzG6nqRT6Qb2U3pPKNw
 /gNNkXa5XuK5g/VZSgrXSWQGiSKKcTBiDnU1bg1adQEB+zyJnQs3KHN4J w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422565103"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="422565103"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:41:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="766173956"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="766173956"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 14:41:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:41:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:41:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:41:55 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:41:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Quknx4xxQUjTlqWxOLR9rd5AAGdPvgbBGcQdv2kKHv7vIjfAYKDHxFMxoeZxAmpjMrbVb7g5GUa5ao0CYNaSWN6k7RYI+IYonNTZWRVnbhO07It1OB5YNi67Lzn0ofiZmQJN3UD+o1kgl/lhM0XVDFGdTeUphwdpN4Ly7CF0PBKE2TfQ6rrE0r4CK+FQuBqwd2ZXIjObT1JKSmv1vnJfh8LvQ7zHQAFyJnz87np07qylFvclt0IHTfTUTtPzDEFhHbMbDXoGf5+aT8YVAVmxElbp2rgFdtyVP/UkeyuPEilnauhMrf60BVPOfeenQpY6q1hPfD5M2YncycoG6Eme3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N81WRPyvPmmk4/L1U8AGIwCTR/zySg8UA8ZTDMOVgk=;
 b=HXhfcdiMGs2IitoJNvNReVGs3PgL42J1Drzt2W+pdLhOwxO7S14Lqx6b5cIBgt5YoBMCcLNG0LZQlCC5w5TVSw3Gud3J6/NnIUzOOkIAY7O17+xTPZUXLAq7TQP/V2sg8qfUZPLv/DBtdBtr2/kdZk/D5Ai5mmqicFIyV3l0XNy0+/dypwnMKZgp/Oefbt5MsGSbvtyvMkPsrROFvY0bFXkCMYJ3rMgtfIPMnUrR05bhdGTaiubkufVNCVw0NjNd1E0bUDEq6gae5DZVAaahoDAR5rU7E9eg0+TlVIXukHa6fFBm5lvSUYArUKU0otLhlE+08aSLJpdNiWg/RyBzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 22:41:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:41:47 +0000
Date: Wed, 8 Mar 2023 14:41:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308224145.jbts3rs4mqpr7hvg@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-11-lucas.demarchi@intel.com>
 <20230308223350.GE1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308223350.GE1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5a5947-2b51-4281-e2d5-08db20264cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lrhj+9TAaPV7ux2BoRiy0EHaqu8cfOxx/BQTNjs2vOBMzRoXuracWla8GV8RPH7goybdz7qw308dJ1wOw8MMWFGdBi0/HcNTSaTWZSFiQKY7YVVWJrM+Qz4gOKzozWqKlYFXLqPkiREjU/4XtA9okKg0Cc2tgOrgU/zaXYprzdpBmXQeeCgHn2qkbt+qtkUoC0oL9OWYCl0UxkQuJocI8ZyZTSGNz2wtOALlzXkpzCtYzhmNzyTD9s9vGAbO3ZMaVcBJ3JI0cs7Sc4j4v/dImKhC56VtJwMjhbW1YI4Any6HTgqE2V/qDCr9PaL4XINmEV/o4IRCBHfUy77yRePFBV3t13nVsq8s5qA7St4q83Ygj35Ji3dUAMVt9NecLqTtA9+rSkLenijjXuNJK+fQymH3YOcIjyMYIaUNeUqjlB9eBaWLQkuiq7MEKIBqZuEPfjWXsP9Brtrk8yHM1kcXVRZ89TG3MggVzYEV+4XJLrMnrcfAQgq1fNkDDU6Ls/ZcEnJJ82PK4UGr2uSLBFmXwCbFz+L0JyKyhC+OZoF3VfPZe3jx9n4jv7YUZS3JSL2zA0HNYLfpx2cd0lwKp9SE3A4TARa9zndgB0MxMfmiGBJZaIQWVJuvIPROZT8CRfbQubNIWSGBFRbkd+kba6fJMnce2AdOa5sLCtMzhSAHE4CJ7ieQtICYnDS8PE3+dmzN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199018)(8676002)(66476007)(36756003)(5660300002)(4326008)(6862004)(38100700002)(66556008)(8936002)(82960400001)(86362001)(66946007)(41300700001)(6512007)(6486002)(6506007)(1076003)(478600001)(2906002)(316002)(6636002)(83380400001)(186003)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jOcYJ8JcS8lROeDaYmcqeI/YV3JP1OepA2GB8SfKBZby3irDbpEAQIvmeRCa?=
 =?us-ascii?Q?WIPPRv3HG5ygHJOjt686R5FFbVa3cz62tK5eNdoTUnK0WCgcJxaLyX/Vl1Kx?=
 =?us-ascii?Q?tKhx6RgeAc4YxLMNCiepo6QH+J557zY/hazkv7FEctgpOqx5gALhMKTaXm/J?=
 =?us-ascii?Q?dynHRGzgVSAnerbKNB55ub8RQButVBDyhvCRN66W1VN9OcWLqCjmN6AYpzKg?=
 =?us-ascii?Q?XpXwHHRO/Bmq+aGUfuA8KJ+AgoP+Prx5wJfNkQzKRqi6eILyoHmucszCe6hK?=
 =?us-ascii?Q?xmmTW5oHnt9Apm0BumGvXv1qG5yCY/jh21gpf7oreqXdBX00fDXPfXdXpxfL?=
 =?us-ascii?Q?qc42WQLDNxGju3BoMaJ6ZdRXpNOZnmLIf5JZDt8MYzNR2gxawKTW/IWYFVyz?=
 =?us-ascii?Q?p0Nt108Owxi2RxMv6ogQ2DX3j3NO3bi/PRSHphE60mAlHsTV+ety8QfxSQ/M?=
 =?us-ascii?Q?RIG5lsYeEr/PEDf9Y4D7DsZge7X2SMSwAA5sM1q8VYlmb0JPjaalU3K3M5tF?=
 =?us-ascii?Q?Avut4FlfGFeUHZx7IaeW5z2krnKGaohXx7fYOE4JwEDQqvCmCi671WVH9SLE?=
 =?us-ascii?Q?NmtPfM8MP70Ng6B1VWrC3qX6f8OIWlsf6UUfQSnajWR/wv+h4KLjXiZVrCB4?=
 =?us-ascii?Q?AZaZzuND9TiOom9H/5vFHxmIv5u62EPtqzoHuo+j4ig9Simr94nobO71ISiw?=
 =?us-ascii?Q?BbsiyVe7B3e3I15lP6gDMtkmubxbA0R06V2QaHcot0xRgkByp34cbHEW5qP8?=
 =?us-ascii?Q?U0kEShFQVh6TR3C/frEbUz2pKvNVwo2ZYl2J6Q9T8c6adY7CJsj4m/4fsw0y?=
 =?us-ascii?Q?dqDRk5NJ1TsBUGr3T7rBAwUZ7Jmwr3xlAigncBqVjOcTINTsuRbWYNx5dzp/?=
 =?us-ascii?Q?Bgijx7GDWcGJ2/didmMahoYiexkLsicIHXUU9vmC98OHOqk8js/rhGpR8Bbd?=
 =?us-ascii?Q?Ppj9p9TBVK7AuA5qZZNyMW7XSDvvQ/HeyqOqQAuJJqudmNMoysmILfHqZirD?=
 =?us-ascii?Q?ZeRSJoGqYEUuuIQCUWHZqVifRbxFDFgyZhSzXKC65JkI9SCVQjHbgU32mKMx?=
 =?us-ascii?Q?iTTNpUeb28nvLe4wgoIlZC9fXiZOHA8N7sdktV3LUbVtZtOhLc3J/OSJC9W5?=
 =?us-ascii?Q?1XCrP4rHjE9JFa7zd2+PlEqzKjzwnF2aFzCEpGbbUSe4taszcP5Ni57XvEym?=
 =?us-ascii?Q?oPLSCy2lvjyE1yroVFemCDZNGUATbbpYg1jqQ9wpk+zyPIENrcd9TmpoB5T/?=
 =?us-ascii?Q?qzkHNHaSFUsgvtyevt8k+mhT/eTfxDqdop0BniEHfLQp9N3PSH3iWPooLtEI?=
 =?us-ascii?Q?uO1BfOPOP9BXrKaw41BjCmyp7riKIM3YRhgByAG6Nni0EDQA2Nu8AZ+wMvCj?=
 =?us-ascii?Q?EmR/wGT9G/9M9ThtfFD4JACSy5m7+cxlpT3KNUq2tSPJa/5tbvVa94sO67/3?=
 =?us-ascii?Q?ch4fnDKy6LmjaUSacG0JIAUtXPh2Bnc9iCyYflzS/GoXg3plewLzqKWMX0/5?=
 =?us-ascii?Q?DI2aXFopWBXeigp8/luCkFsy8ahS8xpHrqGYsTQVZFz14QItHNkn08hfcmEP?=
 =?us-ascii?Q?1b9AeFTtLU6Jp52qCxuWCbA4Dmx4JckALAUD0dgwgtiH+I65auaG/VlmxC84?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5a5947-2b51-4281-e2d5-08db20264cf7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:41:47.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIx9+vDaHfBlOfVWX2NAIGQiJ98BSi5YGa5tCA4LY7ua8Llokq2sKTaJJCqwMuua0Io1+MM7sxn0W7J6dl9hH1dQaokzyCsBizHfMLXLKS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/19] drm/xe/debugfs: Dump register
 save-restore tables
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

On Wed, Mar 08, 2023 at 02:33:50PM -0800, Matt Roper wrote:
>On Tue, Mar 07, 2023 at 01:24:37AM -0800, Lucas De Marchi wrote:
>> Add debugfs entry to dump the final tables with register save-restore
>> information. This has a format a little bit different than when the
>> values are applied because we don't want to read the values from the HW
>> when dumping via debugfs.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 24 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_reg_sr.c     | 17 +++++++++++++++++
>>  drivers/gpu/drm/xe/xe_reg_sr.h     |  2 ++
>>  3 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 78942e12e76c..2db4863ba57e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -16,6 +16,7 @@
>>  #include "xe_gt_topology.h"
>>  #include "xe_hw_engine.h"
>>  #include "xe_macros.h"
>> +#include "xe_reg_sr.h"
>>  #include "xe_uc_debugfs.h"
>>
>>  static struct xe_gt *node_to_gt(struct drm_info_node *node)
>> @@ -98,6 +99,28 @@ static int ggtt(struct seq_file *m, void *data)
>>  	return xe_ggtt_dump(gt->mem.ggtt, &p);
>>  }
>>
>> +static int register_save_restore(struct seq_file *m, void *data)
>> +{
>> +	struct xe_gt *gt = node_to_gt(m->private);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +
>> +	xe_reg_sr_dump(&gt->reg_sr, &p);
>> +	drm_printf(&p, "\n");
>> +
>> +	drm_printf(&p, "Engine\n");
>> +	for_each_hw_engine(hwe, gt, id)
>> +		xe_reg_sr_dump(&hwe->reg_sr, &p);
>> +	drm_printf(&p, "\n");
>> +
>> +	drm_printf(&p, "LRC\n");
>> +	for_each_hw_engine(hwe, gt, id)
>> +		xe_reg_sr_dump(&hwe->reg_lrc, &p);
>
>Should we include the whitelist here too?  It's not technically a
>"save/restore," but it uses the same xe_reg_sr framework and is equally
>useful to dump from a debug point of view.  We'd need a slightly
>different dump output for that one though.

yeah... that dump can probably be added in xe_reg_whitelist where
is the knowledge of how the whitelist if formated. Then here we just
call that specific function instead of the more generic
xe_reg_sr_dump().

Lucas De Marchi

>
>
>Matt
>
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct drm_info_list debugfs_list[] = {
>>  	{"hw_engines", hw_engines, 0},
>>  	{"force_reset", force_reset, 0},
>> @@ -105,6 +128,7 @@ static const struct drm_info_list debugfs_list[] = {
>>  	{"topology", topology, 0},
>>  	{"steering", steering, 0},
>>  	{"ggtt", ggtt, 0},
>> +	{"register-save-restore", register_save_restore, 0},
>>  };
>>
>>  void xe_gt_debugfs_register(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 194a5060f1b3..855d86a6c43a 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/align.h>
>>  #include <linux/string_helpers.h>
>>  #include <linux/xarray.h>
>> +#include <linux/string_helpers.h>
>>
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_print.h>
>> @@ -220,3 +221,19 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>>  err_force_wake:
>>  	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>  }
>> +
>> +void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p)
>> +{
>> +	struct xe_reg_sr_entry *entry;
>> +	unsigned long reg;
>> +
>> +	if (!sr->name || xa_empty(&sr->xa))
>> +		return;
>> +
>> +	drm_printf(p, "%s\n", sr->name);
>> +	xa_for_each(&sr->xa, reg, entry)
>> +		drm_printf(p, "\tREG[0x%lx] clr=0x%08x set=0x%08x masked=%s mcr=%s\n",
>> +			   reg, entry->clr_bits, entry->set_bits,
>> +			   str_yes_no(entry->masked_reg),
>> +			   str_yes_no(entry->reg_type == XE_RTP_REG_MCR));
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
>> index 9f47230c8ddc..3af369089faa 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
>> @@ -14,8 +14,10 @@
>>
>>  struct xe_device;
>>  struct xe_gt;
>> +struct drm_printer;
>>
>>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
>> +void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>>
>>  int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>>  		  const struct xe_reg_sr_entry *e);
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
