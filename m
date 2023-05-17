Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C1CC77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 20:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E0310E46C;
	Wed, 17 May 2023 20:10:31 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2B710E477
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684354229; x=1715890229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7cC82b5zL+YObsTHRq/poTdvkOQiGSDcve9FBIZuR04=;
 b=Wj7AGhmZB+jCR29X0q3itX9EYhbgcyo0Le7jPBcQNaotfI0zIpmJD9go
 VHVkqUoWjhxon4TEsdgSnwvnx3GOs/oDGL04iu4teCe2F+eFiMMvjV76F
 7gOnaEea+Vm3ZK5axrwbEiU1jq+6JSr/G2WX1rQ3YLTMpKoFLnF+1vW+8
 u7Su4OEDli+r//R4XCpGpDZrwL12HREnQYxCIb0L4m6TXXKKJW1SbvIan
 CVDsDVba0a60aqOL+JCRz1/wSmswtJ0O1VodNbmVu/exeglLoP1TFk6Q+
 q2n0F4xh0DnymYSkXTTk4B2nlqRobUpIqCerq16Bum5/J5HeBUOtPPnlX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="354166432"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="354166432"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 13:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="701874836"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="701874836"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 17 May 2023 13:10:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 13:10:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 13:10:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 13:10:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 13:10:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1J4HMOZ8zfUeV2Xo8fSORxY+ZxgOkq2qM5Ey+RCkPb0giPw5wddoshhM7BgyLDv/RxsxNheXpiGLNYvcW015j/eBaWzpKP7rUHgx8uDMdLhHMa13QRJ87JqANIavyjoiVuTRNga4ER6aSwgVYubpufrim7x+O0HITuWw+iER9rwx4EoBxMuH4RUMWQfWqa7zHs5DycLr9Jx0yFVbxyYIcyssz3zz3kmNVuj/D3vD2jRBcdc9kFIy1WPzJYRucVVKJxKQX0+H86q1gZQWaV/GDw7LJvfRSXS9bfVQgW5zaPjv/xvdLnKJONTncI+N5kpPgqR8wOEnvoGq6qe/wpjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7CSVrSl3dYMFSQXN754rjerm9xWt89pU6WSYJOo85c=;
 b=mjA6X26tCC+BPVldQT17DYa1uKCB+Z2taS7IuCQ2qpKzFnuU+Cs/dPvPAixCq1xTducj1lMwbJ+6MJ15O7QMOx3+TmkBuzEyiX3ctVGfMFArwO6sYfO2Q4M+LukrcRd7o4Y/9PLi/DQpICZb5F9+NHjedP4gAAI6frugqdBVC+UJiuiN6bb0iRAFBn8EcDZeqptebSp4KrjnPk+dvlYgow5R32b9bwjdNwKeBxvljlrHXF7NFZ3pqBqUKf7qBbwh/lhkSkkwVsEftSTL+8nDeCtxq3g6Lj358BEJVNtO2W2mqUoCtqBsBEL6eP+joqb9weS01rC5Xw7bRHxSsSz02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 20:10:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 20:10:02 +0000
Date: Wed, 17 May 2023 13:09:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ffxeiq5qey2emkulzkprsl3siainkq7yywc7rpdmdxtiwylygp@qhtes62ct63r>
X-Patchwork-Hint: comment
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-3-lucas.demarchi@intel.com>
 <20230517171126.GO10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230517171126.GO10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: a7db7520-ac21-4e09-78ee-08db5712b27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iehBpWYla9ERVX6zLneJzLOv9GOXtc5aQmIPl6hpKSmVD/9GrbL6iOgJiKk7DRFY6yM54f4mnPT4yMf6a+rHqeTBAhjzdJhSsysP3154VIUNb86A6ZOQxEIIRF7KAjaLSeUR1YPXvqo/VFTNAYqxp9XEHHdzNqlH+Q8vES6DnuqkP06QCCfzPeefpQlft//H9KkOr4KyorLZosPjXSEQWL2wasJNCUw0uOW+YkzMkFlHjL5PgdK9Jhxjtcqmzb+GGaF2I89h3OvtWSFde6tcM5v+r2mkSolbYIkl0xPQkpbOentTO4XfMZgbeIXc/BlNYhmzM/9UiD37JPmfBZzKQt0chjOKEuNuugjY65quJNddYq2t3R1HDx169bbyb09O7I2A+K2I0btcZbGMK0+Eg8jH1zvQJI8WQdLKVPu0pFMJAA9JPmuTp0hRjE41lCwy9UZHzVPfx2N6zz/3nrdBhJjnpqBJf+ajXusLWM/WXeG2BgM4Svt+jr5ufLzGo00Axuxz67izM05D6TUcMeBFeDIb5jqUQzjF/YWpYFTbN+ejsiB0aixCO0rWtoNY+kxL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(66899021)(33716001)(83380400001)(6506007)(6636002)(316002)(41300700001)(2906002)(38100700002)(82960400001)(4326008)(66556008)(6486002)(478600001)(107886003)(5660300002)(9686003)(66946007)(26005)(66476007)(86362001)(8676002)(6512007)(6862004)(8936002)(186003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EH8qGRMnGkGaZQ1u0uKEuMdCEAvSnB1JPo5Z6VUDLicTc0v+K0puegc89KeL?=
 =?us-ascii?Q?FXHQnXcrLzErFwG/ywB2b7gcE7dCXgjkt3l6mCBwkMaA+pM2H/gH13xGnMWk?=
 =?us-ascii?Q?CZBXYpsQd53I1yV/FHySrzZJasUokmxKBw9tqPcIvzwngLQNfEusMD6r+t2x?=
 =?us-ascii?Q?q8RG9Hy14QoSkJHxpNcXJ7uq6I3CvV9bkNCWuxqFmzmPNr2FFel0hEjn6G3g?=
 =?us-ascii?Q?hKyN4IG/dtvsFhvNVMObZFBff8cM9d4oJfD2w5yRLtkx9So/TDVKZldnJ2rH?=
 =?us-ascii?Q?mQDDHyUFahvT7c2W65znMcNeQBtHv5s+SouMDKgWmQ0dcrq3c4dRj4eGOBFA?=
 =?us-ascii?Q?IMT+bR8w/unBR08X6rk4inVbKzopnOkkegChqCrVZ6OZlKDRoAY7847uLn1e?=
 =?us-ascii?Q?l0v3rvgSaQjCSnfcXMGGlXrwsr+bwZjc2LZfByCfLC1uuXERAmH5fmsikQP3?=
 =?us-ascii?Q?32LehGTfxM2SeF3ahgZ5AuUDz7peaJZ4lvPkGUCzFLuruY0q2CR1WodxAFJv?=
 =?us-ascii?Q?teaW6OGE+kNCkVARnoz9NoN13/Niehf98IRYuiHAJhOHtj/EMT0MRo7bc5k4?=
 =?us-ascii?Q?LZxqk1ciaNzh7kouA+WggN3eA4Fp9zP/MPZISPTq4azdascOnewUYqDTZ3/l?=
 =?us-ascii?Q?5MBumE8YUGLj+auaFZDp86BWqulKVga909Scsoj6ajnOJgNfBmeObqNOVmAs?=
 =?us-ascii?Q?seFYuJ0ZBFmjnDDYne6IVtE/041RRQZUWClwZX5DG5Nim7sJL3Q2jBM2KeUU?=
 =?us-ascii?Q?X+Lw4OkoXQYAphkSI/jkhkeO1NyizLEMsPa8/H976MYKGbNbD2dCtjkx9BAO?=
 =?us-ascii?Q?zDQnSeWnolko8pbFm6YCjkLH/f60UIeDAS7Vye4I9TALCXbogDejKyk3CJ5k?=
 =?us-ascii?Q?Apu7KmJHJWWxLTC0cS2Zcu3re/NbI1UihHv2F58n8HX4Fi22HQQ5RT+669AC?=
 =?us-ascii?Q?rrlB48TEMutBj8qksuyH2a4yhgVao0QTTrUBrYN28GsUAz+XitiPffmg8ZZz?=
 =?us-ascii?Q?t4kicWjl84EhEsZfau7bK7ZkC0r5E72Ph7ZY8RH9j6I0IXAJmOt9cmmf95Wi?=
 =?us-ascii?Q?G1dCNYIioOZYr+9iFOO31UPe5cjTc+h03mMzAbAYGaOl7eLFg9qGXvrjSVE+?=
 =?us-ascii?Q?AvmL80nZ1bRY7x3pEFC03V20ESxGlxDt0+E3cUPj4E81pVUSGgWuVNfDREMk?=
 =?us-ascii?Q?t0ys9EMMcg6zsAjJUoaXjIvGla8FhVg+aP2sZvpEU5xvy+lupSOVEOeCWD5k?=
 =?us-ascii?Q?15U9NcFIZzdAVKh13ufS3/sGW8KWRfT8qHe39GqE5McsAgdZuOKpk5FSSMKv?=
 =?us-ascii?Q?MrZka7BYNAfiAg//B0DuAZdutMOCd6oNIRdYyHUzDJg6ZteIyWuFOaRNIlSI?=
 =?us-ascii?Q?TF4x5P3pNhBtoFMWtkf287g139uQvWqQ8QzCrWZYZSC+MUI4EM3VLmG5JUDq?=
 =?us-ascii?Q?FTtCztpj2IV0BuoDHldTVqcGFdafdnShPdK7JxkctRtMCFU7N6pBkAGnSU9x?=
 =?us-ascii?Q?LZySBDu+bJXd1ZWU8NZx37R1XMVDXsnbjk80g/DAOSUW6h3EZ8vbTrv452J/?=
 =?us-ascii?Q?ZuSNEHOGE97+7od2gqMVHLGj7G1efLjJCF/Vmd0Ry8huLingpNxLHMtK9NET?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7db7520-ac21-4e09-78ee-08db5712b27c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 20:10:02.0542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll8KS1NoGL/fJvSytps08bRi4SO7yJ29XQEIv02gRjwVG+0EFW91rGaNFgLwxbnzNnuzKNhYibefLJvAxKz/RQuRxzAs2PVxm8iaZ08ljLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/9] drm/xe/rtp: Split rtp process
 initialization
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 10:11:26AM -0700, Matt Roper wrote:
>On Tue, May 16, 2023 at 03:19:43PM -0700, Lucas De Marchi wrote:
>> The selection between hwe and gt is exposed to the outside of rtp, by
>> the xe_rtp_process() function. It doesn't make sense to pass a hwe and a
>> gt as argument since the gt should always be the one containing the hwe.
>>
>> This clarifies the interface by separating the context creation into an
>> initializer. The initializer then passes the correct value and there
>> should never be a case with hwe and gt set. Internally the functions
>> continue receiving the argument separately.
>>
>> Also, since most of the rtp rules match against device characteristics,
>> add support for processing rules based solely on the device. This will
>> be used by follow up commits to process some workarounds.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  3 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c      |  8 +--
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 +-
>>  drivers/gpu/drm/xe/xe_rtp.c            | 71 ++++++++++++++++++++------
>>  drivers/gpu/drm/xe/xe_rtp.h            | 10 +++-
>>  drivers/gpu/drm/xe/xe_rtp_types.h      | 15 ++++++
>>  drivers/gpu/drm/xe/xe_tuning.c         |  8 ++-
>>  drivers/gpu/drm/xe/xe_wa.c             | 12 +++--
>>  8 files changed, 102 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> index 4b2aac5ccf28..f96ef1987719 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -238,10 +238,11 @@ static void xe_rtp_process_tests(struct kunit *test)
>>  	struct xe_device *xe = test->priv;
>>  	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
>>  	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
>> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(&xe->gt[0]);
>>  	unsigned long idx, count = 0;
>>
>>  	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
>> -	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
>> +	xe_rtp_process(&ctx, param->entries, reg_sr);
>>
>>  	xa_for_each(&reg_sr->xa, idx, sre) {
>>  		if (idx == param->expected_reg.addr)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 751f6c3bba17..1bf28b1ad319 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -281,6 +281,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  	const u8 mocs_read_idx = gt->mocs.uc_index;
>>  	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
>>  			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
>> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>>  	const struct xe_rtp_entry lrc_was[] = {
>>  		/*
>>  		 * Some blitter commands do not have a field for MOCS, those
>> @@ -299,7 +300,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  		{}
>>  	};
>>
>> -	xe_rtp_process(lrc_was, &hwe->reg_lrc, gt, hwe);
>> +	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
>>  }
>>
>>  static void
>> @@ -311,7 +312,8 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>>  	const u8 mocs_read_idx = gt->mocs.uc_index;
>>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
>>  			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
>> -	const struct xe_rtp_entry engine_was[] = {
>> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> +	const struct xe_rtp_entry engine_entries[] = {
>>  		/*
>>  		 * RING_CMD_CCTL specifies the default MOCS entry that will be
>>  		 * used by the command streamer when executing commands that
>> @@ -332,7 +334,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>>  		{}
>>  	};
>>
>> -	xe_rtp_process(engine_was, &hwe->reg_sr, gt, hwe);
>> +	xe_rtp_process(&ctx, engine_entries, &hwe->reg_sr);
>>  }
>>
>>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> index 7a2bb60ebd85..98f678d74445 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> @@ -63,7 +63,9 @@ static const struct xe_rtp_entry register_whitelist[] = {
>>   */
>>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>>  {
>> -	xe_rtp_process(register_whitelist, &hwe->reg_whitelist, hwe->gt, hwe);
>> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> +
>> +	xe_rtp_process(&ctx, register_whitelist, &hwe->reg_whitelist);
>>  }
>>
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index 0c6a23e14a71..648a38bf8f0c 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -23,11 +23,11 @@
>>   * the values to the registers that have matching rules.
>>   */
>>
>> -static bool rule_matches(struct xe_gt *gt,
>> +static bool rule_matches(const struct xe_device *xe,
>> +			 struct xe_gt *gt,
>>  			 struct xe_hw_engine *hwe,
>>  			 const struct xe_rtp_entry *entry)
>>  {
>> -	const struct xe_device *xe = gt_to_xe(gt);
>>  	const struct xe_rtp_rule *r;
>>  	unsigned int i;
>>  	bool match;
>> @@ -62,22 +62,30 @@ static bool rule_matches(struct xe_gt *gt,
>>  			match = xe->info.step.graphics >= r->step_start &&
>>  				xe->info.step.graphics < r->step_end;
>>  			break;
>> +		case XE_RTP_MATCH_INTEGRATED:
>> +			match = !xe->info.is_dgfx;
>> +			break;
>> +		case XE_RTP_MATCH_DISCRETE:
>> +			match = xe->info.is_dgfx;
>> +			break;
>>  		case XE_RTP_MATCH_ENGINE_CLASS:
>> +			if (drm_WARN_ON(&xe->drm, !hwe))
>> +				return false;
>> +
>>  			match = hwe->class == r->engine_class;
>>  			break;
>>  		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
>> +			if (drm_WARN_ON(&xe->drm, !hwe))
>> +				return false;
>> +
>>  			match = hwe->class != r->engine_class;
>>  			break;
>>  		case XE_RTP_MATCH_FUNC:
>> +			if (drm_WARN_ON(&xe->drm, !gt))
>> +				return false;
>> +
>>  			match = r->match_func(gt, hwe);
>
>Would it make more sense to adjust the signature of match_func to take
>xe as an additional parameter to allow general matching without a
>gt/hwe?
>
>Actually I wonder if we should just split out the addition of
>device-only support into its own commit later in the series closer to
>where it gets used.

I'm not sure because:

	1) For the use cases where we have only xe, i.e. the OOB
	workarounds, it would be odd to add the FUNC() in the .rules
	file.

	2) the context where the rules are executed is not the context
	where the XE_WA() happens... we don't have a complete xe
	initialized yet.  I think that would tempt people to add the
	callback function just to later realize the callback can't
	really be used

What I think we may eventually want to do is to split the rules into:
device, gt and engine rules.  However I think that may increase the
boilerplate code and make things harder rather than easier.

>
>Anyway, not a big deal either way; up to you whether to make any changes
>or not.  Either way,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


thanks
Lucas De Marchi
