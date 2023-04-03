Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F219C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 11:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9F10E159;
	Mon,  3 Apr 2023 11:34:04 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4B310E159
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680521643; x=1712057643;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lfl6CvIwMt5+BVeZiKC+5v3vkKrfJM7v/D0cTS0FJVU=;
 b=PzeUuD2bfPf1e1CkP+mQv4tm9k/8XmXk/0XGcM0siG/7UQxe/U04Awoc
 nJadhoDDyfJ7DmYw8l06ImvPU+Bqek2EYXDN0PYB8LgsiQYszqwvWrg99
 Hg8Zot/O5iNogInISIOYWtbcqf1O1zseubYMrxqIp6liM2ytqtFG62NyL
 VtTF5pwvHGqBYGz7k72fVS42FXXuhSVmXMkuzBx+BjHucyshdxkklp3RM
 1BuvmlPq42gngIEcG/Nxxly6XELTCQyHc+bSPUISKCFlemm2YQP7KgVAb
 z9hyKvtnYBjyOag7CoGCh//pqO2wrsicTM51IAsDB2ip29GmUrxlR5xjO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322268295"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="322268295"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 04:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="718520734"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="718520734"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 03 Apr 2023 04:34:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 04:34:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 04:34:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 04:34:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 04:34:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccS3CAt2JMla4RanX9QZwqGf6OuA6TfLB4DFUuoRsGKF7uva9VqB/LmahC+9FD9IjXWMcElfndvSHr8jRTHydyz/eVGFaXRdWp3Tmqxd9AOW2YjPLFh2nLtpjJUbmw9LFlHvvFxhQ09nDJxzlvXsP02McXd27MEiVqLXpbX+le2lqYbnF5swNj8HcKDK7VBfn6lMPXYRUjdVOx3KBNvFcr7vPqVFLmIpHav8hldd05GwtT4mE+g9upI8mvaecaLzotleAzHTMBSpJjb29es8umjXoYIo4jymrNpW/avOjcU7RWurf6ZbUSM3o30zp9dLmTq7r9WNOOpkKmUt6s64+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P15O/IyI47yWw2Q6cwXqIiOtNWjEXuDzvmr2LtYISk8=;
 b=MgKGCrQMKR6+b5P52nQD/1j5I4Lf7T+nEaJYpkTz09IfAwouPvJq/M4H2H0/IqtWXv6Q0J6lCdvg0wmih+j92/4K3xtoT4+pDAacJsCPxlSXq50APvkmK9s67rn1NQ+8zzo8eI5C2FcatdNDXaZK96IBtrpkyfFJ4uGXnusu5QwT2p9u1nRCskE8HSYMvPt7oE+ekVcGfM8eQKrj0DWPr87DS2xM+ejt4hLrhxKxeyQq82slC/7o5T9hNJMt0grUNdo39STTVQC9h7/PX4Tp6D/le9LwIoJ7VpeXMxZopMOcIwCvLInZ0RienOTa0veaEIJ9oMXYdXddmUTmDoOZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 11:33:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::87b4:14a9:fca1:cfa2]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::87b4:14a9:fca1:cfa2%7]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 11:33:59 +0000
Date: Mon, 3 Apr 2023 13:33:55 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ggwkglplzkbnfkkxkifxk2azgcut2xqxxe626f7k4bhfkhj22z@hobncody2gxr>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
 <20230401085151.1786204-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401085151.1786204-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BN9PR11MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: c27535bf-f9d5-4fcd-28b9-08db3437512f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TZ8mdJgqbEP5k4m5NJ8BD7dAOOECzyJSDkWfILd9MW77bat8ZtpnJQJqb+NCATyQWe0EB3g9ahzABXiDgthXLFBLzWC47o1Dmw5IjaWRHLC1Flir69E6XcLGRSkob2mcGrbqbNlDWiyJpDlY0a5lbypSgcJSRGzlAKByD2xr5AyOy+y1TWslqvImkpXV74gVElSiQ8tCJh34Vl3QTA+2Q5rfB2nshcznYOgmLbXrBUCPDSyAoJguxe9BN1E7niK/w1AJaWEW9CicuK9IRvUJcff1r44jwMYeF6DtBMJKxG3xyBkkhxG8Dg63xoFV8vLK6+BL81UGWcdS+jSjYm++vfozwUSXhTG3Wpl/ui7SB5ALbGtg5tzr1EA7BOFyMFhQHiW33UzHw1QmpX+86+D0tJi6XcWbMxll4kxKNjbBCOkNnsFWS+P+4cMTsH7xX3EMTA+yvAF7KbR0sEDRF+g13kxwoLpf9A1OqOmCzBHFNgnZ3QFixhyU540TUwOjMJL0HnNSoWwoqvs5yKwLNb2YpFz7KYcz3YfVyPbR8/84pI24Y90SdX58fsYOcnjRPUBw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(2906002)(38100700002)(5660300002)(82960400001)(66476007)(66946007)(8936002)(6862004)(66556008)(41300700001)(8676002)(4326008)(6636002)(316002)(83380400001)(86362001)(478600001)(186003)(6666004)(6512007)(6506007)(26005)(9686003)(6486002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjIxWDZCK3NoYlh0c2FLSC8yeitZUGVKOFQ3ZXBna0EvckhITDRPbmszcTcz?=
 =?utf-8?B?emx0NTdxZmtBNEhselhBL1FsU051cy9UODhJRG1lKzhUbU5YQTErMFFKWmgr?=
 =?utf-8?B?SjZIUndMV1NFWE5FTlQ0K0ZISjJtKzR0dDlrYTRORTdEODcvdmhJMFlQQzE0?=
 =?utf-8?B?QjFlUmNLSnNyMXRYb0Nod09LaXM4SFU2aVBuZDBpRVp5UHhMdGpVRzhNd3c1?=
 =?utf-8?B?VDcvcGhoaEdOZklPTGhUanlRSkhTMktDcTRZRjRhQ2RtSndmNHNHbW0zaHJN?=
 =?utf-8?B?QzdYMzBUdkh2QUQrVlNFc3QrTUNHbUo5QTJEZkFaenBRbEk3dUFoM0RhM3o0?=
 =?utf-8?B?L20yT3FqNmNHSndkU05RMWJ6WTl6bHFsQkl6SzRHc0JuWENCVk00Z2JDWHJo?=
 =?utf-8?B?WXN2VStCeit5ekhJc2RTZndldkl3Y2ZLOWt6MVFXekV5S2NUZjFWOEdnVm9x?=
 =?utf-8?B?QU84L0ppelZieC82VFdKcGxGY3gvQm5UU1J5K0JnUjU4V1BFa0lxS05rOXJs?=
 =?utf-8?B?dzBWM1U2OGtHcmZOVEI5d0I1d0xyeW8yQUdUOXE0b1lnZS9MT2V3RkNxL0V3?=
 =?utf-8?B?VmJtcUNvMElrNkFFMzZ6KytUK1NPTy9SV1g1VkYzWDlUZ0E0ODl1RHZxNnRV?=
 =?utf-8?B?QXBFNmZKbSsrb1ZkRDZoZ01RRzVUQWxCTG8rOG52eWtRejdpaUZJYkdldjBN?=
 =?utf-8?B?dmFmNkpVL2xCUkRMQmt5dEJQYzg0eTBRSDJzV1o5SEVrTHpJMmR0QU5VaHFN?=
 =?utf-8?B?S1MzSmh5c0lVMHpDMWhVWGwvdzYySk9rem5SUDZEZzNqNWtXUE91WGNqOXhZ?=
 =?utf-8?B?S1dvaXFhRU8wUm9PMzRLZEErT3loSXFaQWx1azZHS2VPcDRTUWxSQ2oyamh6?=
 =?utf-8?B?ZXFtMldHN0RmRjFPTFlMczhpbTlwNHYvbmRoNXNPTGFuTkFqbVpFWE00b3NS?=
 =?utf-8?B?VEszUjV2UnllVGZNZTVZNFgrR2luMzAvenljUmVyb1ZtdnZUUnA0S1k0MFd2?=
 =?utf-8?B?TU4rY3daZ2dVM0hKOUhycVdXelNFaWd3SGNtbFdiWEN2dnQxcUYvT0VhQnV6?=
 =?utf-8?B?b1NZQzJBWENSMW1aSlhmZ2dXQXd2ckJXRjEyekZOeFk5Q3BzVy9hcGlBUjc3?=
 =?utf-8?B?OTBrSndqYXZvWnl6aXdORXUrVWtDZmdVZHNjSWNUa20zOXpMTnUrTWNYQ29J?=
 =?utf-8?B?MDg5Sms3NkRZODhpRzV6RkNFd1VsL2EzR09xNTZtQWhUcGhEMmRWZWwvUjVV?=
 =?utf-8?B?S0g0V3R6c0cwekxJSXhacnRSdzNLbWwvdXl1NDBrVG9NZDVoK3crQ3YwNmpv?=
 =?utf-8?B?RnA1Rk4wSTJ6a2lNZVdCelJWL3pqdi9ZdXpqc00zL2FYaGRhaXM0alVROG9q?=
 =?utf-8?B?aVJsaW9sUXorWXQ4QVJFdnNDZUpId202emVvZk80dTNmRkk4NENoT0htZFVh?=
 =?utf-8?B?UHB3TFZrV0E0ZDZNcGo0WFM3WVFwbTNkaWNkanB5MXRnUjZrS0d6bk55ZFZr?=
 =?utf-8?B?V01HVk85UmpnTXVnLzN2U2FSZm0rdWpvSjIwTVR3OHlTSFVNanNzZEhicUNL?=
 =?utf-8?B?emo0cVFpSkEyL1ZIaDlwaGtVV0tvUTBtUXR4Tm1jYldCVjVvaTdydFRBQzJj?=
 =?utf-8?B?ckZudjB2d05MUHZaV01UbkhCM014THZOVEJFVDJtMXVOWFZ3dnU5VmRBY2Ir?=
 =?utf-8?B?ZnJkS3diaGJyOGQ4Rmcyc0Rwc0twajhTYUtQLzlVWmNhWEIrZWJLemliU1pL?=
 =?utf-8?B?SHdpa2Ftb09UVUQ1dTQ0MkIwOWNRYjBJb3lTZU95V21qb3VVaEFSY1pUa2Nr?=
 =?utf-8?B?RytzUXhVV1VVdmdXS2lZcDQ3K0VQVjRrSHFOeW9WSmg5azEzRFR2MURvZXF5?=
 =?utf-8?B?ejVLcUJ0R2QrMWVzS2U5S2RiRmV5WUh6Tml5c2xOVUs2dDJMMml0eHVRY3JG?=
 =?utf-8?B?b3pGVjBKSkIyNUpPYTZDS0EwangzSmtrYmF5b3VFR0lUeFUwN1VFVUFmYlI5?=
 =?utf-8?B?SzNwQkRvSzB0cUQvVWRXRE9tY24zL1FHcXBOR3ZvRkZ4TlU5UER4ZVRldGNZ?=
 =?utf-8?B?QUtmVzRjaXl0OFB5QTZBOEtjZ0xwRzZnZGRIS1NtT1R4U0NtdG9HZ0NtY25s?=
 =?utf-8?B?VHd5UW5aSHcwdmkyMzJzN2ZSTHRpeGM0OVVIQjJIRWhSODJWRXFORHlKNXdY?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c27535bf-f9d5-4fcd-28b9-08db3437512f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:33:59.5109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCFeVCl3a7LtX1NMzAELj5sQTb2dNujMBkpo2Z9JI/f2ngpg6xcM5R9Z3rBhFyWAF5W8+5k3U0FiT24x/xdewcV9UOU5dDeG3FGlKRfur0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5529
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/7] drm/xe: Add basic unit tests for rtp
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 01:51:50AM -0700, Lucas De Marchi wrote:
> Add some basic unit tests for rtp. This is intended to prove the
> functionality of the rtp itself, like coalescing entries, rejecting
> non-disjoint values, etc.
> 
> Contrary to the other tests in xe, this is a unit test to test the
> sw-side only, so it can be executed on any machine - it doesn't interact
> with the real hardware. Running it produces the following output:
> 
> 	$ ./tools/testing/kunit/kunit.py run --raw_output-kunit  \
> 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
> 	...
> 	[01:26:27] Starting KUnit Kernel (1/1)...
> 	KTAP version 1
> 	1..1
> 	    KTAP version 1
> 	    # Subtest: xe_rtp
> 	    1..1
> 		KTAP version 1
> 		# Subtest: xe_rtp_process_tests
> 		ok 1 coalesce-same-reg
> 		ok 2 no-match-no-add
> 		ok 3 no-match-no-add-multiple-rules
> 		ok 4 two-regs-two-entries
> 		ok 5 clr-one-set-other
> 		ok 6 set-field
> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
> 		ok 7 conflict-duplicate
> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000000, masked: no): ret=-22
> 		ok 8 conflict-not-disjoint
> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000002, set: 00000002, masked: no): ret=-22
> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: yes): ret=-22
> 		ok 9 conflict-reg-type
> 	    # xe_rtp_process_tests: pass:9 fail:0 skip:0 total:9
> 	    ok 1 xe_rtp_process_tests
> 	# Totals: pass:9 fail:0 skip:0 total:9
> 	ok 1 xe_rtp
> 	...
> 
> Note that the ERRORs in the kernel log are expected since it's testing
> incompatible entries.
> 
> v2:
>   - Use parameterized table for tests  (Michał Winiarski)
>   - Move everything to the xe_rtp_test.ko and only add a few exports to the
>     right namespace
>   - Add more tests to cover FIELD_SET, CLR, partially true rules, etc
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com> # v1

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/Kconfig.debug       |   1 +
>  drivers/gpu/drm/xe/tests/Makefile      |   7 +-
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 318 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_reg_sr.c         |   2 +
>  drivers/gpu/drm/xe/xe_rtp.c            |   3 +
>  5 files changed, 329 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
