Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031C7CCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBA010E1FC;
	Mon,  3 Nov 2025 17:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScqRSfZZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79F110E1FC
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762189751; x=1793725751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1J46ceEgeMLux4t5caKshphY1B5p6nqv/FWYYV+R2SI=;
 b=ScqRSfZZlD7n/QCTIKMdp+tU6C/dSvA50jDQf0eZEBXyTT8D00DMd3nd
 WzrXqbTN/BCeGmEkS9+T7RkfuAdC2PCCJ0t7PbGFE2EKBljC7D3DsHCHA
 u54rXar8uRgREOQcqzHXRWrtwdMDpZWyPBC6kiFB6mSZGFIInqv0RqT2X
 09h/a7sygjteK8pNC30lOlJcedX/e3D8Zw9yeI/yJ2AD9VEjpQprGUuIO
 wVwm1FY8OAyQH2f1W8GoOWnfdNiZujeleFfDz0lJicvAPVuw/i0gk2Unj
 rZJALzF/m2+IUm4hPTLsLqX4PDGeG3YqIaF0ZQMGQqWpbo6vAxTYSO977 A==;
X-CSE-ConnectionGUID: WyYa6gLASUGlHd1+8EskkA==
X-CSE-MsgGUID: 9S6cfmPYTayIWBvdnPDpRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64308948"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64308948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:09:11 -0800
X-CSE-ConnectionGUID: u3hgCXolTjOSdfPn/CpHfQ==
X-CSE-MsgGUID: /x7htBDqTCCpOzbmURozmw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:09:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:09:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 09:09:09 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:09:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZxLnqo1cwv+Lq+SujrJssGcOQdLW9H+v9yKdtmvShKHGjazhFQENSZMdxGf8951pPKcajHsBilR0JQ0xf2M8nW6V3RRhKYbfE36jLwIV70YtcfDK9bVtNcmvzhMd3jBNIyJNepC0K60RQQ717VHwi4SitKg61nVMOYKaL64QOO/772gSP0qCNsA/p6euzVmXKodEIBXZI24JPMfp0yyjUQjwpjJo+Tn9vV7LiipEovZ0uJfNRypT/X0AUv2Ofm9dbqdDRkR2GZ2VknN4/KnGOzo1ywHa7hGIHRKbNvf827GJQGxHjLIEwKhfnZzufazapGu55SwGK19gXscPbetCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8UveSOFrXSyt2CTIvtydjwWCO2dhTSxmFPjp/ul2n0=;
 b=PULEa5P6xxgh+D/CRkDckVdgX6qCUfnMXiiOU0qNt3R+Ll8wP/lL7VuRjNg7qbagtUf0r+SiDhzhUSbkYXe9D6zdOn23cDPqsjC9mQZEEiGPP4dfemRwxkr6oYV/Kg7/GEaG0odVtafrRWYQvjl1x6VP+WF3xubAZSM2xy7q5rrmTc/XnyOmeZPa3FG3C2TWGsPYuahbcXrXvZRbJ0TI0NPeQ73MB1Vv4a/Kiudp9/OlDBkDC7xtpipidN+Xjl4C4J1p7ATsfPJsh77H9rQSPBOi+PGYrC8kf1g2LU1MBXtRSXJqgbEKBoxtLKIBSc2XZuLSLjfnXZLugH1cToyKSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 17:09:07 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 17:09:06 +0000
Date: Mon, 3 Nov 2025 09:09:03 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/16] drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi
 Queue batches
Message-ID: <aQjhr42LD00_pjkZ@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-11-niranjana.vishwanathapura@intel.com>
 <aQehbGWOY67EVOC2@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQehbGWOY67EVOC2@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 3359a174-7090-41d4-deee-08de1afbb24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CWwirubEAur6gA1yfgBFcL0anLENudaZprvfhrzG41v4Yj3e7ls0PYsS+ylY?=
 =?us-ascii?Q?fh2lxl3OsOEmsH/P6FUWab98cQIpealYLrr3IrtsU+s5MFMEpnkppRa09JZm?=
 =?us-ascii?Q?ND7Zhqsow8wK/c1wrstm04CORQvYrLcmzS8zLD61TPUnNnFaBxBETL/Dhctb?=
 =?us-ascii?Q?oNPDDslm8dl17N1m94AAiasy8o7tq90u7vyyn/EoDhq2SGPUwnFIln4GLCir?=
 =?us-ascii?Q?LuR/EBsdeO/8ahLHgwK6ehGzzT4ymNFSVCLctxy4y2XO7PMABDPE7bkGz+W2?=
 =?us-ascii?Q?5BkuFdt6RM7tFuA0uUqzDmpGhAVosgOyt3mBf9baCHPz2ps+uxXEWm65ZVLe?=
 =?us-ascii?Q?eJuQHMHw17Gz4raAayvh9O4RbCdSf8dYOT5v8bftEzJsH27It/yx8/EmEeo2?=
 =?us-ascii?Q?xtgNcXqzSojWv/6oS8/8Uz+H6BX4hr2vo+LkYFJefJCw3R4bGXYbmjiE7mf5?=
 =?us-ascii?Q?jP1txAuoCOhOYolnpCv94tGAPtHRsnC+7Szs02mFmzcuP0jfzLWqzSVpg+7b?=
 =?us-ascii?Q?TcXf1JHpOawMGBbCv8rgySeruWgOzttBVj8j7JUDHZEH31RVNL8PNN+Df90k?=
 =?us-ascii?Q?dVgfOtycZabmySKbctPEQkpyAKaTg5jDTPmenQ4mRnPqd7gnWDt9eP0NHP5E?=
 =?us-ascii?Q?YWvxwxCijmZZlI+5EtNUM0v1+ALShv5SVNszSemnUBhPzwloZe9ovCpkvA9X?=
 =?us-ascii?Q?+RiIvHPY7SDZ2ignPxPJk1yX7d8fX5FNHRMiN6qmc3XdnpE3IwiVYUAMKH9A?=
 =?us-ascii?Q?2WuCGEw3lqc4MZ2/gwFcBM/A82AMnROud9RwyqKR6fHc1FfSYQupGH/YsN4J?=
 =?us-ascii?Q?7zTa4ii87oEQ++me7d87Vdye151+UoPhrrHgbDR5S1MIcA6tbsVtXI6IxlDB?=
 =?us-ascii?Q?Hq8BJzmfXL4ALjqxZ3/r5oIRT0HdVaKh9G43JfjV6AROlLdq+B+hD4o18J+9?=
 =?us-ascii?Q?VC/TuRy75wU4zGiqVJxIbDtAvlC6DhARZi4vRSWp8n+KfqMQZkVF01cZaZnT?=
 =?us-ascii?Q?BG9k+DofhKK31MSqSULex7cvKXEu80VVmKcU8MFDPMqhw6LLwuLq1IbYZpMX?=
 =?us-ascii?Q?5PhO/dXR3n0vpbTRbv9bFazBTB4jBdsliwFtq+iWF4HcNyC47crerUAUZdGp?=
 =?us-ascii?Q?q8BO3pyXfhL5ytlXaijB7cM85cQLTJFj4ZcAZ8Xvji5/69XNz8d9Vqo68mWJ?=
 =?us-ascii?Q?t1VBWctzb/qzhVLNBSBJZyRf2bTuuskxdPZ2x+s4kyVBn+rCZsk3A5zxA72R?=
 =?us-ascii?Q?NLw1a/gzu2zs3Z4NyiocFqhhT7AQvfvT08JwPVaU2esDMNAtBHQsRiyNVY7d?=
 =?us-ascii?Q?yJpNiP1EoqJ1KCh0lXrNLtrLUAw29ZD84hPPSCp6HkefSi2bhQyKOyB4hzHN?=
 =?us-ascii?Q?IKwgMpJHHkQOFcApQpYHOZUT7sDxomyvUcWxCuR1FWWnoEaa3I4YNbAogpf+?=
 =?us-ascii?Q?1G82jm5jydsEi4K7CCkxy56Xsy16TNGB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qXJkNSXa0Sds8S77MYWBxITqG8NbT6zemdLyBdo8BCuNjkjZoCkhAE2DQPfR?=
 =?us-ascii?Q?jcyvozcr6avqUThj6kgzTInDZEVsfE1qmpAt4/nL242BHyHz4KVItNFZcKw+?=
 =?us-ascii?Q?60JHI0rbBXhXbEkcshe40NIoB4T3bGirziuUQmd33Xit2KnlqsWAJlMLcOZ3?=
 =?us-ascii?Q?V33Ppf9XSBkBP77gJxP9o3unwJCw4BNtLln0Tm1z6+PabllaDVwsA7HLiYQ5?=
 =?us-ascii?Q?F2wqBh6JiklPYO6fd5BYiwYVaiVt42+szbGjp7b/cbonaNPUsIZZClM3vryd?=
 =?us-ascii?Q?7RZRNz65d62By4LzltberLIq20J+fERZuG2w5fVAKP/drq++R87L8BZGzBXt?=
 =?us-ascii?Q?g4QH4ksndCCdETrT/8vYFhEuk/5D7EcmdfYtr5jQMlqrCravF5HphaYxuNVC?=
 =?us-ascii?Q?s9yieUvG/iyta2M80V+/2VHRdh2NPuNdXf0dgpw7uQhAT12bJaDltcwFBd11?=
 =?us-ascii?Q?OJV/3MxSbTY17ltT/MoBEznRNQ/E/164A+82ZBJ9raZb5EPUpOulClcg/mv1?=
 =?us-ascii?Q?2yyQo+DjyieedRwswNe+j9IKlTR84OAS6iw3BSM2nUzI04G9ZzLuAnVTxe6K?=
 =?us-ascii?Q?TP6pnl5uZa+9bljd5WDSyI4aoWJtuo66lBh1uYXNnbcd5mt6gJaWxLpKHn5b?=
 =?us-ascii?Q?FNyK6zaIFE9XQVS7DSbigmCvMZLYgNfBxL6Z2JLAEC73DUtNYg4h+5u/fCy1?=
 =?us-ascii?Q?EoX2470SWAQMNg7X7K64OABstGGzvjBH5vx2m84SVOWi7ktwyyHWwt8gkiDK?=
 =?us-ascii?Q?UKpP4N74TK/oV8nX8GIlP9HDKcszCe9ElTiDZ7SP4YJbp9Zt7Ukta5Enp4AQ?=
 =?us-ascii?Q?YllhfIRMkE1lsW4/k3qSN4rh9SUHudUjlNKNiGY44iylOSgpmOG5MsCBOVYe?=
 =?us-ascii?Q?DN2CcqpG45dDVsWQ9kVc4Ke8Uxyv/MFQbqfmEtU5NUhaJgQkNVpQQmrmL/Nl?=
 =?us-ascii?Q?bQ+2zm7RSoxNolfO9votOqtth4JT0DQOw+sMy4tMSdIE5ZQ9BawD8ayl+Wcu?=
 =?us-ascii?Q?5ew/zRykoaPWOK4lq7pQaZVqHE4yzWsNp6ToasFp8ZcOZcW2ApE/WCudUwug?=
 =?us-ascii?Q?h/tK8bCXnk/DqxWN0dNns1jSm56gNwQrZgoKqpv9eMyehHhRVFDisWA5fcLk?=
 =?us-ascii?Q?F62mDLZJIhWwUlWzQbvT2umeEvehJB53PuoO/YeC5c6x/2uhFkmH8NNwGN5d?=
 =?us-ascii?Q?UgW+TWNR7agTUexEvKj4v/XxjH2pG4RCURLQ/Pa1lbV3nYH/1H+ytXc5XHzj?=
 =?us-ascii?Q?YzUyJsOuw24zj2PkcmUqT3OU9JbbQi9BOjVrS6sDpu47NcJ6xzS2+82KdSiI?=
 =?us-ascii?Q?e5i0+gxDWOwfwjDZ+Jef0boofTpEVq4sv6vVGnXIJ1Em0hPYSoAmPksk2R/3?=
 =?us-ascii?Q?ERlxG9Dan++/y2H0jVZD8XVtNXfxHVeBw4SKCpnHx02iPBTxgtGKPaG+VVki?=
 =?us-ascii?Q?mJmvID1eRuJj56Gmhd2J0GNobpzJg+EA7o9XeooLXqZmZ0vVcn1yPCF6aRqX?=
 =?us-ascii?Q?zIxr9GZUalxk1MTSGNXw9N1Ns2mSEPlOLYquPCreExZdS/kaCQXJb5WqNIF1?=
 =?us-ascii?Q?uoqjVuLq4gEgghCSnuLhTC7szgJ4ZaZLjEVxDbDpzSTFBu/W92nggSY9/ZLq?=
 =?us-ascii?Q?ujGcrtK4x3Htp3H5lrTX9M8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3359a174-7090-41d4-deee-08de1afbb24a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:09:06.6409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3odsmeoTbv7Bqwn52pocCQjFy/3QHl13vpD1sNY4TOQ9Ajz5PY488rLln7gIoBbGGtwEuhrcWcrmlLxk2uwAHSPZEvcSEEeAM70BRc8nowcMWAcu4FV6ncDAlyIGzwD8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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

On Sun, Nov 02, 2025 at 10:22:36AM -0800, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:30AM -0700, Niranjana Vishwanathapura wrote:
>> To properly support soft light restore between batches
>> being arbitrated at the CFEG, PIPE_CONTROL instructions
>> have a new bit in the first DW, QUEUE_DRAIN_MODE. When
>> set, this indicates to the CFEG that it should only
>> drain the current queue.
>>
>> Additionally we no longer want to set the CS_STALL bit
>> for these multi queue queues as this causes the entire
>> pipeline to stall waiting for completion of the prior
>> batch, preventing this soft light restore from occurring
>> between queues in a queue group.
>>
>
>Bspec: <number>
>
>This will help in the review.
>

56551.
Ok, will add it in commit message.

Niranjana

>Matt
>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
>>  drivers/gpu/drm/xe/xe_ring_ops.c              | 68 ++++++++++++-------
>>  2 files changed, 45 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> index 5d41ca297447..885fcf211e6d 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> @@ -47,6 +47,7 @@
>>
>>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>>
>> +#define   PIPE_CONTROL0_QUEUE_DRAIN_MODE		BIT(12)
>>  #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
>>  #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index ac0c6dcffe15..71f0e19fe8ba 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -12,7 +12,7 @@
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_lrc_layout.h"
>> -#include "xe_exec_queue_types.h"
>> +#include "xe_exec_queue.h"
>>  #include "xe_gt.h"
>>  #include "xe_lrc.h"
>>  #include "xe_macros.h"
>> @@ -135,12 +135,11 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
>>  	return i;
>>  }
>>
>> -static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>> -				int i)
>> +static int emit_pipe_invalidate(struct xe_exec_queue *q, u32 mask_flags,
>> +				bool invalidate_tlb, u32 *dw, int i)
>>  {
>>  	u32 flags0 = 0;
>> -	u32 flags1 = PIPE_CONTROL_CS_STALL |
>> -		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
>> +	u32 flags1 = PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
>>  		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
>>  		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
>>  		PIPE_CONTROL_VF_CACHE_INVALIDATE |
>> @@ -152,6 +151,11 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>>  	if (invalidate_tlb)
>>  		flags1 |= PIPE_CONTROL_TLB_INVALIDATE;
>>
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
>> +	else
>> +		flags1 |= PIPE_CONTROL_CS_STALL;
>> +
>>  	flags1 &= ~mask_flags;
>>
>>  	if (flags1 & PIPE_CONTROL_VF_CACHE_INVALIDATE)
>> @@ -175,54 +179,70 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>>
>>  static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>>  {
>> -	struct xe_gt *gt = job->q->gt;
>> +	struct xe_exec_queue *q = job->q;
>> +	struct xe_gt *gt = q->gt;
>>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>> -	u32 flags;
>> +	u32 flags0, flags1;
>>
>>  	if (XE_GT_WA(gt, 14016712196))
>>  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>>  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>>
>> -	flags = (PIPE_CONTROL_CS_STALL |
>> -		 PIPE_CONTROL_TILE_CACHE_FLUSH |
>> +	flags0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>> +	flags1 = (PIPE_CONTROL_TILE_CACHE_FLUSH |
>>  		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>>  		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>>  		 PIPE_CONTROL_DC_FLUSH_ENABLE |
>>  		 PIPE_CONTROL_FLUSH_ENABLE);
>>
>>  	if (XE_GT_WA(gt, 1409600907))
>> -		flags |= PIPE_CONTROL_DEPTH_STALL;
>> +		flags1 |= PIPE_CONTROL_DEPTH_STALL;
>>
>>  	if (lacks_render)
>> -		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>> +		flags1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>>  	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
>> -		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>> +		flags1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>> +
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
>> +	else
>> +		flags1 |= PIPE_CONTROL_CS_STALL;
>>
>> -	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
>> +	return emit_pipe_control(dw, i, flags0, flags1, 0, 0);
>>  }
>>
>> -static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
>> +static int emit_pipe_control_to_ring_end(struct xe_exec_queue *q, u32 *dw, int i)
>>  {
>> +	u32 flags0 = 0, flags1 = PIPE_CONTROL_LRI_POST_SYNC;
>> +	struct xe_hw_engine *hwe = q->hwe;
>> +
>>  	if (hwe->class != XE_ENGINE_CLASS_RENDER)
>>  		return i;
>>
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
>> +
>>  	if (XE_GT_WA(hwe->gt, 16020292621))
>> -		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
>> +		i = emit_pipe_control(dw, i, flags0, flags1,
>>  				      RING_NOPID(hwe->mmio_base).addr, 0);
>>
>>  	return i;
>>  }
>>
>> -static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
>> -			      int i)
>> +static int emit_pipe_imm_ggtt(struct xe_exec_queue *q, u32 addr, u32 value,
>> +			      bool stall_only, u32 *dw, int i)
>>  {
>> -	u32 flags = PIPE_CONTROL_CS_STALL | PIPE_CONTROL_GLOBAL_GTT_IVB |
>> -		    PIPE_CONTROL_QW_WRITE;
>> +	u32 flags0 = 0, flags1 = PIPE_CONTROL_GLOBAL_GTT_IVB | PIPE_CONTROL_QW_WRITE;
>>
>>  	if (!stall_only)
>> -		flags |= PIPE_CONTROL_FLUSH_ENABLE;
>> +		flags1 |= PIPE_CONTROL_FLUSH_ENABLE;
>> +
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
>> +	else
>> +		flags1 |= PIPE_CONTROL_CS_STALL;
>>
>> -	return emit_pipe_control(dw, i, 0, flags, addr, value);
>> +	return emit_pipe_control(dw, i, flags0, flags1, addr, value);
>>  }
>>
>>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
>> @@ -371,7 +391,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
>>
>>  	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
>> -	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
>> +	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
>>
>>  	/* hsdes: 1809175790 */
>>  	if (has_aux_ccs(xe))
>> @@ -391,11 +411,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>  						job->user_fence.value,
>>  						dw, i);
>>
>> -	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
>> +	i = emit_pipe_imm_ggtt(job->q, xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
>>
>>  	i = emit_user_interrupt(dw, i);
>>
>> -	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
>> +	i = emit_pipe_control_to_ring_end(job->q, dw, i);
>>
>>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>>
>> --
>> 2.43.0
>>
