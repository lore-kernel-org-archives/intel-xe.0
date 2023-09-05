Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E79C83F2C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 16:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F300810E15E;
	Tue,  5 Sep 2023 16:09:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D3F10E15E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693930154; x=1725466154;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B6+eDDMaGWQskpW7mb7+stLB6RbxEpRkdOtiVeEJtbw=;
 b=cFFkkH0HWIEYR5zv66iCjxgqjqN1mQDdB1cU7d8YgnCd0PKXXSgVEUSr
 YZnrzzOkCuVtUIrZqe9H7npFhu03wXyObh8l7fbPBSwDhYwQUnTeaXwlh
 S/DCXg+irYm1AFfm2SBuACw/t1+ABdzfHKQj7PP3pqQBNfaERqVuA92Hf
 ffiNTWdwn1KVe7DycJ6/Zjiy8zbVt/84o4GLhvfKkw9B6L9cSTv6X0NKz
 SyYkZPDpCLr5Xt7mT2LbMtgz23OJjUhYqnchKilVQSII4UmlX8tY5DJWG
 7tQNeD6cvyjpcVjs3SiiYU50vK6Y+wiPpoZ9qkWmtsMwFcavXOIEYA10W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="463206344"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="463206344"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 09:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="717916353"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="717916353"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 09:07:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 09:06:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 09:06:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 09:06:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 09:06:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrqZ9d82vzNlN+s8R9PdX8loGIxzDf4O5/7yyXDcSuh/Y1oquCeT+1fG2ybjKKzMyydPHEgV+B2xhK+OF2Hfv5Si/AvbNLTYFTZrinDLVa3bYWcgGxZADBoTvJKbbzbx+2mfjahnWzdel1CEOGJwj2nFMoEp7b/5nWlEfytORPmUVPFaEw15dVntNOru2mEyPJjCsyIcM0B5uCcdEGez8y10PiTZBDpuKHsAV651cSHrq+f3tl5WbPzbJAwW3pWrimgDbWhAZ41D4q68gOVOCoPS2G3N8z+ZpOCwIt0/jfV8jTpbwNMFR973dQ974BJrh75JXH1SSJiXpAo4P+GqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFXLlIF3rdoBk1VWJYoAmbgA69QTtBTucNpqjbq9rA4=;
 b=R+VVRC3kfGpc4jicoHQxhTHibakBa7nnZeTDr9F0Gk3NWq1JOM3sQB3NXeBVmAqwjWowQpE2myvEdUG9QDrtrx4mi/yhFuDLs02bUPuzaiesMzuE6R5bYicHBYNh15tspK8QIxceDU7GsOVkGF/dYqLuGHiSsWUtG47Bn76C38J6a91JKA1nKxFZ6L6xYbIAq6HvyDgSjVVzP2KhmAaRZPQ+TGu3vzB7EfDDCkHu0TK018USZC1DtCNs85Tspay0DthvkAyxM0wdhGlbWV2YdwizHunGiG5y6YsfKOfSvNtmCTQR/V9QlL9PopkxHv1bg519QkjPjro080AAJLAE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 16:06:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 16:06:54 +0000
Date: Tue, 5 Sep 2023 09:06:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <hvnq7gwydeywkxqudheplygoldzk426ss4uetaypucw2hpeh7z@wqphplzfgxhs>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-3-lucas.demarchi@intel.com>
 <753666f8-0d87-9bb6-87db-4784b8b71dc0@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <753666f8-0d87-9bb6-87db-4784b8b71dc0@intel.com>
X-ClientProxiedBy: BYAPR11CA0065.namprd11.prod.outlook.com
 (2603:10b6:a03:80::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2307f25e-2ddc-4fc8-4ef5-08dbae2a1f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8puoJvChA5Zx63KYcTivsPxSunghwhdnOwUm3t2E7NF/dko+UP0DauKekqvcDzwUIk17yaZE3QjmDNkCgDSN+IjqyDzPAyJwvQTKnL+QI/T1LwJFCm5VYTXB76+1VKwNoKZyOJgLQLJB5I5qebLG46C8VvjINkl3tAe4SEvB3UBMLCgBsVLK5EDoqYI8VZbamuY6BcLMjpJijlvZgNLnU33FK/D93YmpmjQyuCShfO9Pe+E8QVtCzZH902ZIRKab8NfFPEI/ywdC+a75hQNbWywMsI6pqsXftdLT6d8t2YQAg4jqVUY5tzC5dUb4OsZ4IaZRU8mD5VYTwriktLUeo4BbggP9k92+CTlrCtayK1rklcV0hhGHX+uN2eb4x0vBae6YXBBtXXT+RAnJTIpo/JvRk2aYR1OOSYiMKdoSVWq1REBVefbIjl+Gvsz/p0GstfrVFqfTKw5FRJ7C0p+I9jfiNTz5vFf6kTszMGsvWcK4fUFV8U/QiouSIpt12fhhhrGNNtL2kq709nGS8S4My+70vIO73HKlS5BNmhhqZIAgLm/RCzgTHDpr02GaCvigG481ZPgs0s49YgmwwvDBSwVHzwCB7Ic9MwzwOfQxdZFgl4tcNNXVtRpbKg7Y2LVC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(346002)(366004)(376002)(1800799009)(186009)(451199024)(15650500001)(2906002)(82960400001)(38100700002)(33716001)(86362001)(107886003)(6862004)(4326008)(6666004)(8676002)(8936002)(26005)(5660300002)(66556008)(41300700001)(9686003)(66476007)(66946007)(6636002)(6506007)(316002)(6512007)(6486002)(83380400001)(478600001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b0mEcv3P0JkNuw7b2A65W1KaNGAXidYQgQYWbXz8c4EafIqsuCzkFl0savws?=
 =?us-ascii?Q?KLQ67tgDL9ilJDRkJ2Jkife2dXNQqFz4yd1YmXo/1Hj6qof1na7hs+fpZGlw?=
 =?us-ascii?Q?4Rh1LRwagrfxjGNjy1eopKqh43ElkhrSFnFQKi2zUovFDmPgWxkX/eo/384q?=
 =?us-ascii?Q?HqX8e7WyN7lFIVC6jvniRb4qZGJf1Qdoey5D+gqUQgTBhXqJ69nWzKvjG0qx?=
 =?us-ascii?Q?kaT97wPz7eqmsUpmT18l5lgaU09jvKlxoNHmWkGTvNThp1abfMGIFDEKkjnG?=
 =?us-ascii?Q?PtF2MrWv2075tN5vQnsq31McNZxswE9ZJ2m4fkDhJLTktrso23tNl01xRvm7?=
 =?us-ascii?Q?MN7j9dXfyXXG0o2nZxsZIThGJX5KRyAjho+nCYPcfjNL2BPy54R6Cgwx4d65?=
 =?us-ascii?Q?T6qIKcBgLL+dWHNPAsYFp2KnkclUa/wt0CU3ClAGDbYIGy46o3CxinmyxxI5?=
 =?us-ascii?Q?rrXCBdCNTELammtkupQn7UUiEoJItbbooMvDblQj0DVbFhkv3r6tzDorvtUz?=
 =?us-ascii?Q?XwX/7ru/mTxKp/a9CP2WvjIGyvTrLeDtGqEj0UPgb+M6ZjOGYNjpi2uCYfrd?=
 =?us-ascii?Q?cv0w5YpdM5oI+rlZSdzRwvGuAZEJU79Qhz1kLK91LY/AYCMI96amyB0IAr/O?=
 =?us-ascii?Q?XLyw82tF6wACN54bM2rPMHgARf5AL+EiY8Dp4g+c2rtbBy/k9tcQg8P0AHrg?=
 =?us-ascii?Q?L4i+0hBmtKjhfKV8SHRa4rY6AyUho1SM3au4QRhwrOkNOF+uGvW7Y/NJveLx?=
 =?us-ascii?Q?8Pnu1EqyHDb3B8i7pAofSgOa2Exa6miH120X4YB51VybVtdUp0eF1Ik9A1SE?=
 =?us-ascii?Q?BET4pgmsI/fvpoKN3RMNL6lb87ZxVNqcKDf28wXhI/Ue2lUsIZIGfNKezFOd?=
 =?us-ascii?Q?9nnvywZcb6Qg1ifRTTE22wdY74JjNt5/ARuWyncwtqtzDiK5W5w93+Rz1nUL?=
 =?us-ascii?Q?z7chORheK/VWe7MrJr7XDDQECoBKC+G7BiylJ6EvGuVuyCoal0VxmqOmdXQG?=
 =?us-ascii?Q?qdp1Ig20HXAkGedfVVC7E7kvsFWfcugTGRootPgxv71j/gPLWvYKu/OcCY3E?=
 =?us-ascii?Q?bH2kgQQyje9u1xgUM3W3ph6bRnDD7h9JTNUKPT7T6vvpzlPZEK+lgLdpCLbk?=
 =?us-ascii?Q?/QNgs8VqqMeCtwz6/heCmk0Grh3rjS8OMjxNwuCD2HAKFrm8JrtA3KtATifk?=
 =?us-ascii?Q?8eDw8ty2yQ/lYUnMq22efE5NGfSEPz6yGXypfxKFc3XGMa/3XhiPoiei85+r?=
 =?us-ascii?Q?RZEQQSlS5qPL5qMWuGrw73P7fbyM6R8Sd6kMBqR4kBmJQGcFfA85lEbtznBT?=
 =?us-ascii?Q?cfdlJETv+LOqOcYHDA7C5W5bqPHuXl+RvwvSaOU/FzHoqsjianYQlQ7su1W9?=
 =?us-ascii?Q?JBQrfULcn51+u2feddg9L9est0zDz60APynrE940EoqDi0yZrg4JpKr9t/qd?=
 =?us-ascii?Q?uirQTEyg6wEWRqvI3eU3HWNdJgctUrQkZ2xRDyup7xqm2UfzhVavw+3Nd+j9?=
 =?us-ascii?Q?Gyz+8Ak1DHor30/9o+Z/foA82ZDu8b4bIV5vJ3sHUsbwNtRpJlbLEtX+VuZ7?=
 =?us-ascii?Q?hEkJtvati/36e/Q51iQixQgkQ/0v8HBRnBMwpeqiEHAI7naxrEJkJjq1ktsF?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2307f25e-2ddc-4fc8-4ef5-08dbae2a1f77
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 16:06:54.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEobI53gvpAcE90bSqJop/fM0SQsbmPB4RP7lU/b3zWZUAz1PJvCRtd8J5LTiLnBpusVdHlrJZLg3x/QAZHVklaEWg67K+1vwvnNVJ6QxBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add dbg messages for LRC WAs
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

On Tue, Sep 05, 2023 at 05:04:08PM +0200, Michal Wajdeczko wrote:
>
>
>On 05.09.2023 16:31, Lucas De Marchi wrote:
>> Just like the GT and engine workarounds, add debug message with the
>> final value being written to the register for easy debugging.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 3d6a7c11bac1..bd307770a620 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -116,6 +116,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>
>>  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>>  	struct xe_reg_sr_entry *entry;
>>  	unsigned long reg;
>> @@ -133,10 +134,14 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  		++count;
>>
>>  	if (count) {
>> +		drm_dbg(&xe->drm, "LRC WA %s save-restore MMIOs\n", sr->name);
>
>shouldn't we use xe_gt_dbg() here?

I'm not sure here... maybe. The LRC WAs should be saved per engine
class. Currently they are saved per gt, which is not entirely correct...
we end up applying more workarounds than we really should.  This is
another fix to be done on top.

for the current situation, as long as we also migrate the gt/engines
workaround application to use xe_gt_dbg(), then we can also change them
here.

thanks
Lucas De Marchi

>
>> +
>>  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
>>  		xa_for_each(&sr->xa, reg, entry) {
>>  			bb->cs[bb->len++] = reg;
>>  			bb->cs[bb->len++] = entry->set_bits;
>> +			drm_dbg(&xe->drm, "REG[0x%lx] = 0x%08x", reg,
>> +				entry->set_bits);
>>  		}
>>  	}
>>
