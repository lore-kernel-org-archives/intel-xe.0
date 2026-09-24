Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F99AC98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 18:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4682A10F70E;
	Thu, 24 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fby4GFkH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD14110E565
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790274654; x=1821810654;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5icdJ8T3lo78sskpCUPp5rf1A9sM8ULTRhB3CjJAeI4=;
 b=fby4GFkH0wj0U2RmwJBkuG/IsPOysehaCSiBwXayHp8S6SsX+KUu5KZE
 73mNV3WAv8XoOd5QGUCwHCpM0pQZRO0siIYO84Cc0tIHvQEEfo2sJd3Lf
 cREwCoyqoIVWxCLocIakq9VDiuiUn8+xE7KFyDjLczl5cdRs9CcVnuYK9
 0MwPVdIlx1orcR7oePJ1CMrs7ife5MJFVZPynGv4ye4h5m0JU54/4Hd+Q
 iU7KBbYzM04rINjru+vP33efsraHCg+vcVQBBNlcASe7c/oaMGogzW4wP
 rJplWIC5+TJ5QiAm3HVrlwGGcz7FZvJUWgYIxo0n+Cny3fqAZ3OOG0FJ/ g==;
X-CSE-ConnectionGUID: S2Qqdo9qQUWVzu1/mRIQag==
X-CSE-MsgGUID: 0RaU9AvnTtKavsmi1OZvnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89967025"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="89967025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 11:30:53 -0700
X-CSE-ConnectionGUID: LbAelptERWKfAXJKLFOLyA==
X-CSE-MsgGUID: XA4dI7e4TxWoM8SE2+NeRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="277868277"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 11:30:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 11:30:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 11:30:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 11:30:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLiH2LDtsIqYkLK0X6iKyNr3ec6F6fsb/2g4gV6ay8Pz3MXwlJrfL3FOSpWS3nDCZrjkomrrqzvOA2YvFUFGFH7pizek+nEaM7QGlp1HRYIHCnkjzuFGECtKCyvRn/t7byHTZm/L6QYvg2uifBU5RisZnxSlRw+wGoaMZ28GHTiha8MYs9En8m1jK1s4pyXTO+0Bpx1JFA0t3YedUOIwFI8O5XrfAohWLy0eYWOjvpA6owStIbYTL+4JLHjnGveH85vLgm2Qcckfq93U9xlJb96cxMKyQYsheNVPsJ+4T6xgL4P4dBKNhRHw8d9BTFYmgafNfwtI+UzEs6FXBZk1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzcHRETtm5KjFvvZxqSEPqQKXoq2dzYuXmH0Qr+FOk0=;
 b=ANKK/P8K6u3osvrRM0hGE7PkGV387QFaMQ7sKzJGyJPFqSKMeMoLWLWYqhUM7maQRcPt9XmIjrd5ANwqetLd5kt4DQmtB+ONykHfGwqfCq3TF0ODBLzgydP4EE9azBMzw4TSa1ZHliW9KNxdfZN90SUWGSQ5/JAXBW+zlUOEX3J/5YceJb9yB2NrY6wKUPW8ic1fWQtU6pQgvNGAuBtViX2hSXmK6OiOILOMIdOUiBSi41iOVwZP/5BhU1txGln1NZdTGaPd09GF2eG0oApYteId/fFkSJxb8ikc4ylEhUOLXoReIoHX0z9T6W7EGJCYsYSzFV7rWG0qGdIFFzE7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DS0PPF4C13E72FE.namprd11.prod.outlook.com (2603:10b6:f:fc02::507)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 18:30:51 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 18:30:51 +0000
Message-ID: <dcb7229c-74ac-428c-a8f9-10dcd8efe3fb@intel.com>
Date: Thu, 24 Sep 2026 11:30:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/madvise: Remove unreachable madvise_funcs NULL
 check
To: <intel-xe@lists.freedesktop.org>
References: <20260915011229.203424-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260915011229.203424-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0065.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::13) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|DS0PPF4C13E72FE:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f988ef-d55b-4798-48ff-08df1a69f5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|42112799006|23010399003|10067099003|56012099006|22082099003|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: gVfiGI/2+EmmSAJlLMmLwAYkECxTwbQAfqvrvzKlXiysMk7GrzJd6JgE+MqeYE6yukTmQgRKnOrodcdhdYbSKVBqjjxMDJVxH0agwWJ2hm8W3dMyaTP28Uydfo29+KlKtkQUyz96KHLSzS/krHQuLX8riaxJA4wXoHsYWir+x1kqkgv9dsCqbwmRTQE9+T3GrQ0JzKsW+UHQblegh59Q+rAKrUEM0bBCtQEH3H+EQ9xMkLcgXbHjGqgwvDLtniR8Z5YAmGUaxBRGA3Y89PeZ/o0UIBhQqll0ATUK1YbCw11IYJLJC7jw6s9GPsrion14EoglXI9QyedFK1u804n2IJ+GEICmHjyi590SNsU1gu2WQ1z/cDLzgS9Qpqwe/6r52uNlFiuJM5r6VMjTzr+2WveTSBux0AgkT3G6o22JnbJrGGdLmeEjKJChYcBO05mc0X0Y6VfeC+krv5ZCiz+wd15XO9Ey8YYHi5ZKJB4hyFUv/1MuhWcboroi6O/yhFh9eV6K59hV1SoL0j8kVkG3aLVqeViKHHwuNMLSVBQ3IRyLxzB+J59eVNzwRKlqNrgxE36y9IWC8EfpMICQu/GSQmZ6Ue3dE34SXu3UL2bxMG9fdZ9Ppfat/pXCudIxlbpBHt3QPuRq8ccA7rZFP8yUs0tvwJ6+JF8sPiYBFFqoi38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2YwRHlFM1NxcXFka0NhNlNIeHVhS1RxbkRkNnptS0xNdjFBSEdhdlVLY0tO?=
 =?utf-8?B?djR2MEJNWEMvT1FaUzlka3crSDZxY1dTSEwwQm1ROVlIOXAzTFhDUkhqVC9T?=
 =?utf-8?B?OEsrU0wzU2orU0JFQ0lJbXFLZExEb2VTRVU4bHJXVGFLMzh3bW44QThCaHVS?=
 =?utf-8?B?dHVLQVMweFBRdFNWSXJCRU9YTHRPQnVxd2F1ZWJrTkJjRm1oenNwZ2t6ZHF6?=
 =?utf-8?B?RGQya0Nib0RDYUNDSkt3S1pJb2lsZml0OEt6TThhUFhqTUtaMTNRd1ZQOEtV?=
 =?utf-8?B?bmIxQU9xeDFGYzhocXNHaUtrVU9oYmwxK1FzZ2N0cHZIWnFTdmxENEVHbnNN?=
 =?utf-8?B?OTBjbDJ2K2dmeFUvNElYRmtWOWhnRWlKY0psTklxZW5lKzE2Y3BJK2tOVkhE?=
 =?utf-8?B?VE9WRjFXZ0tXWC9kRi9oZmYxTjN0Y3EwNUlhSWlja0p3cmZURmJkelYvd3Mx?=
 =?utf-8?B?aWY4dXZwZmJ1cjJScGJzdGhiSk9PWm50dmJwRFFpWEdKWGpBTE00MUV2THhy?=
 =?utf-8?B?K2RCSE40TE80c1FYMDVpeFU3eU4xcEZwb2ZzeXlEdDJYdkdpbS81MU1NeWxG?=
 =?utf-8?B?Yk0wblVBc0V2cWp5M2hkeDB6K01IVUVWQktuZHJ1TnRsSVBQdkhGWmtiYzRN?=
 =?utf-8?B?NGN5cWZxTW5uVlEvQ0c2Wm40QjdyZGJWRmlkYXRFUVFiTmxnaGNqSHo1SmlU?=
 =?utf-8?B?elEvbEVOK0tkaC9XbVdUMjhlS1JrM2FnNWRpOGxCaC9kejdqWVFtdjQzZm5O?=
 =?utf-8?B?NGtwc1o2eFozZk1BOVRWWXJycW5QbmhDUm9EZkhoRmlFaWFEZm1hUVRmakNr?=
 =?utf-8?B?dzFyZTQ0QkF3OXQvakpsRzg4OUpHYjF2ZlJlVnVKSzg2TTg1WlphSUdXRFRi?=
 =?utf-8?B?YnIvY21jbUxZdUxkTW85bDEzZHhqT2hyMFlDOW5ieHAyUFFRVDhsTnNtMEdO?=
 =?utf-8?B?RTlWWEQ1bXppT2ZKUmNQRVpRV1RoR1JveW9zWFc1TlVHeHRjQlIrbmVSOFk5?=
 =?utf-8?B?L293VnZSRXZicDJWTUtyRFB6SnQvYk1KNGkyMVRVaVlWbzd2anl1aUJIbFJp?=
 =?utf-8?B?dkY3TEhYVUkzdWNQUzlna3BKTHpKSHBNenJydHpIQ0picWp2MnhYeFo0aHZr?=
 =?utf-8?B?STRaSGoyNVl5WUF1MFZRd291NlhZVzk0K1I4S0YzdjJWNzJSSS83OHpGTDE2?=
 =?utf-8?B?amhkekdkQ1l3amdVQXpjQk1lQ0FtK2cxVno4aGd4Mms2cCtFd2NqclJMTkxE?=
 =?utf-8?B?cTRjQ1ZMV3lzVitHZWxSdGFGVTBiZzdpa2ZTamFuUmdyZFMwNTZvNnZBM0lO?=
 =?utf-8?B?SnJraGdOYnJMMDV1NlhQTEY3dC92SHljYWJyOGxkWVlMK2ZGU1BlTkt3eEtG?=
 =?utf-8?B?bnA2YVIyUWpBcWFKeTB0ZnRJZ1JySXpQWkNWZTYwdDVLekxjNnFPR2ZSOGZp?=
 =?utf-8?B?VXNrZXJuc3plb1gza0QyUVhvU1dOR1ZRbkZUQ2xZbUxBeGVBNlhxQmRBWEgy?=
 =?utf-8?B?Qy9vK0cwMlpGaEtjVFFjMXRrR2ZQL3lBaXJRM1JOVGUySk50Zk1IYXBuZTZS?=
 =?utf-8?B?NjBnV3BvR01aRDloM0NUVlNVMEJCa0xIbmRwZm1HYWtRa2ozL1VTeGZCc0dm?=
 =?utf-8?B?NTU4U3dSZVk1b2xFMmtuQ1hCNWFKc0k3S3dHUmJ0NXhyUDRpMFBzTjVxUHFx?=
 =?utf-8?B?NmxNVVFGcXZuaDUzcGJKMzJ6eVN2NFhUNllEZDlqSDBtM2taMm9ybkptUmVI?=
 =?utf-8?B?ZTNGSm9jMXVzTWpMd0FiaVRjdlhkNXFHSks3V1NXZTdRWSt1ZzdsR3hERlow?=
 =?utf-8?B?d0h6MmVBNENPVytLLzRKTlREUzFGRExyQWZQRDFLcURJdjBOYkF1ZVVwaGR4?=
 =?utf-8?B?b3BSZ2lJS2dkQ0o1TjZGUDdrQ2hYMmMvV0UyS2UzbTQwTitES1ZoYlkyNjNa?=
 =?utf-8?B?VFJGUHRrUWw3SkFlUStIMGE5ZGhUQ24wMlVtUE14SWtWOEJxNFhqUUlXTUVG?=
 =?utf-8?B?WnY1WHJvYWp1Zk9meWFRbGNOZjM3bUQwWmlCUm5qQitRNTRydHJhb0ovVVZk?=
 =?utf-8?B?V0Q3cmNKdmlTR213amdmb2VKRTNoU1F2bnVGejdnMmlsN0FERXhOR1BxUkFU?=
 =?utf-8?B?M0NXZjBOY3N6VVlrc1JGUDFHaHVDblZqanEvN3d4Y3diZHNqTnVLME0zT0R0?=
 =?utf-8?B?dnRuTU1OUzhUbElWeGFSZVVsZ0JPZ096bUp4M2NJNTVtWTFUQWRSOVI2Uk54?=
 =?utf-8?B?L0I3aVpRVmxCS0dDaVIxQ3dYR254c0IzbFJwSjVoV1BwcDNHU210NHB6TWVD?=
 =?utf-8?Q?l8gwcsgQ4ikhpT5HEC?=
X-Exchange-RoutingPolicyChecked: VdDAjHUVPs3mibpIOZvxlivcXCpTh2e/Rs0K8ED84L1mDJZQRCfKA5ppjUpIKLvhQsae/D2P8/LzrL8q2/KSNxOvq7HIjfO2a31VEX4j/iYS/gr2FeU0YJes5heE0btPWVU35Jw/PU2peUDQWO6a+4OeiBjgkOp8BTrpLBeVlPesJhhfV6IrGRTYZw2w2LS1EzyanIacNPcAf1KSvasYSiJwUIG0kSdgWxeXovFasFbecyOExyXteQaRgnXy1cB9/zaWsgcqf7xftS4h5ScpVXLPtIwk6r/z3haJWe2vm3a35YKuzG2kaEAaa1c4/IPRC/PdX9sDFnghlDcIhyB5dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f988ef-d55b-4798-48ff-08df1a69f5da
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 18:30:51.0869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Nk5Kp1ifa5axLMjs/T5+QeHskHrGc6d2lJ7A09Nsl4SYVYMPTF5ZwTI6XYhxBxR072gKB0afEVHlx5lXWTSZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF4C13E72FE
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



On 9/14/2026 18:12, Shuicheng Lin wrote:
> The NULL check on madvise_funcs[attr_type] in xe_vm_madvise_ioctl()
> is unreachable. madvise_args_are_sane() already validates args->type
> via a switch statement whose default case rejects any type not present
> in madvise_funcs[]. Every type that passes the sanity check has a
> corresponding entry in the table.
>
> Beyond being dead code, the check's error path (goto err_fini) would
> also skip xe_svm_notifier_unlock() if it were somehow reached with
> has_svm_userptr_vmas set, since err_fini only tears down the drm_exec.
> Removing the check eliminates both the redundancy and the latent
> unwind hazard.
>
> No functional change.
>
> Assisted-by: LLM
The code change looks good to me. One small commit-message nit:
Documentation/process/coding-assistants.rst specifies the format
"Assisted-by: AGENT_NAME:MODEL_VERSION". Could you replace
"Assisted-by: LLM" with the tool and model version used? If it was
the same as v1, you could restore its Assisted-by tag.

Reviewed-by: Xin Wang <x.wang@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> Cc: Arvind Yadav <arvind.yadav@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 0474768a38aa..5c7aefc641ee 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -713,12 +713,6 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   
>   	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
>   
> -	/* Ensure the madvise function exists for this type */
> -	if (!madvise_funcs[attr_type]) {
> -		err = -EINVAL;
> -		goto err_fini;
> -	}
> -
>   	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
>   				 &details);
>   

