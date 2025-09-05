Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DE1CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 12:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F4410EB98;
	Fri,  5 Sep 2025 12:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihxU6Wx9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4D410EB98
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757075454; x=1788611454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HAU0rVGDApS9cxUCbdN+p/jobzGUqQNM2+e/DFEKPpM=;
 b=ihxU6Wx9cIDTvnROmp6V83mRELuBMqLi1/MlewzYk68TSe+f3UkwQnTu
 9TOE8wcMCWgZR6Bs2ZugFpmsaRFHXA/MQ5CHJ9ZY5Q8Cy4ThnViEaWBug
 vGcTqyys6gX2crhj4pmlEVRvvi0UeC6IwYMnmOrZJsS/BMHYaM76KKxsS
 q+w/lSuGH0hFvcQCMdsV4QepJ8ZxuyPA5iG4DYZ+pWytBbQj4rZoB4s9v
 YWgWGHGA4E/ezIH/pQhbJdWErxfuoFgNowYfedlAxgOYyKk8qg53mrVoa
 J77NUq5DQfJIHz8uDMEfAut9baCkPK7YkuHL9D05Nw3czel4BFaEyN7ao g==;
X-CSE-ConnectionGUID: ruVDVxsNQJ6idUItAllvZw==
X-CSE-MsgGUID: OYN+0/r9QLKYD/M1ZdzEKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="69683270"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="69683270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 05:30:53 -0700
X-CSE-ConnectionGUID: D8hHkxHCQfyAfsHT4GSzbA==
X-CSE-MsgGUID: heKGqYMdQpqdpkHWJWvWMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="195811241"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 05:30:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 05:30:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 05:30:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 05:30:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSVRfKZsfUwShMRpOVCr1RSR29GeBQveO9WlRcOLPDwcpDJzqcOgE1hHHJKSteggNon1kVOoIoIUkzGcOFi0bA87kG6ivub7aID/qCIZVqRj5B34DEK9KxB4j/VhZj72BHBS77Ak9h3AjkIH4QyaFK+u13t+/H3c6cokHvDeHomBV/D3aKiRoLt8wBM+UHtIR+IwGLq58ct0mKHtUwjSaQmr7CnfWaEX+hHnCmGOFD5BYByAd7Ot+iWF4tCCHgmoMklmFa4L98DFTXy7RH4aYxWGweMuwwJy0ooU5fWR7HJjD0FeR00OK6H+t2X/5LorCfxXtgl19PwdYgY88CJ0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTFwHFAO5sV8KenmXcEV6C+F1nq9fq6y1wXBuWkB1OY=;
 b=ItetldN7vpwH6Mk0zLK6QdkUILK0HsI3bYTVSjpDrb9axCgpsb6aqViEe9+nwVYTAZ2ECcX6vIlNQWayscaEk4oBT8Qaro4Kztwc8xHtmHM4ojTid6hOAuT6XMae3UyDbcuzRbl7dB2gbYmd3WFS0suRAglI82X4uzxj1kQriXGLVwDBxMcEEfsbiA2Wd8q4pXjVyaa9Rvcnm9R7TMkjlrZIETVQ/yzbUHFXmNDi2pJ8hAdveVgdv9h0hDnUdBQnkoX/gaz8bqh67POMwTaSXMLXHEh4PEREyC3vjaaYgXpgaD/k/A0L3hsDBTpLR+2TmkYwgFRI39KeHcbFlCK1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV1PR11MB8792.namprd11.prod.outlook.com (2603:10b6:408:2b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 12:30:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 12:30:49 +0000
Date: Fri, 5 Sep 2025 07:30:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/kunit: Allow to run tests against custom
 platform
Message-ID: <7lyh2doh6t2he7srpztwcm6te76dwaalzuvfpj5otpwoddcinx@nxqccphccit5>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
 <20250829171922.572-8-michal.wajdeczko@intel.com>
 <gwaifbohn7ocyslucdwns5mlqywlzte74x6ngop3cqilxc6oo5@capvsl2qcxz2>
 <23b32a25-e157-435e-8b23-ccacb59be55f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23b32a25-e157-435e-8b23-ccacb59be55f@intel.com>
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV1PR11MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c75f291-9405-42e5-c68b-08ddec780ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?D8pVdpjodRuLHfM6EjjhF2+XmKfAu8bhrNm2d4XLD9sr0FF3h4dk9zthOU?=
 =?iso-8859-1?Q?zyO5AXdIQAgTQ5sCzRVnX4JvTWnxxdVQZtMdvMH3LjTRPZDnKRE0cR/9Xz?=
 =?iso-8859-1?Q?bjl1JZ0ZVYcrCPVP2yDHc3d96lr5llVICrz1ynJHbiexT2YvYUAlCi7v+1?=
 =?iso-8859-1?Q?sSWN30aafpWXrwWvjCv0ROs95Dipk6bRqQYIhhlcQhZ/Ek9B74Lq0Va3BB?=
 =?iso-8859-1?Q?i2E1+ZvNAkQs7yKwelWez4TaHiTnfW57TKh/w2QE3DqiSLixPnjznEvqBT?=
 =?iso-8859-1?Q?o/MZkKFNsEWsJW+RkIIqBwrsRrxVzY28zmqg2QQfVCEjkPCrzKXG3ofZzP?=
 =?iso-8859-1?Q?0HWRYaqBu+4p6ZMY9ACAON+vabS4lXZKziKGYJ4FwzbIBSMeY6X5m+E/cf?=
 =?iso-8859-1?Q?QZyYYBYkEW3I6mYqyJZ2gqQXxY5aMgeuyz0nNLsrS4yhIVLgqoBKU1wZct?=
 =?iso-8859-1?Q?5N4YlhyfmUlXedxi1+c1ZVb2hUqTJzOkpol7BEnV0rYOhMRqqbGjB/Sfti?=
 =?iso-8859-1?Q?EZKe5m0aE4gFm/wgKOhnAoxVvA0Xra0iNGt0Kps51wIqequkrm37a3c/Do?=
 =?iso-8859-1?Q?liWC9lHqy2GGESER66J6OERkeVJlFe9kDDjuaddTiZ+Vz9b4iMHZeg+MOb?=
 =?iso-8859-1?Q?tJpeLlwf7RQTdBPnSqtPPLgwod7HmPpEO2tIagQT2AGbW/JZ3m7PGr302e?=
 =?iso-8859-1?Q?tRv8WXJhJB1va1KtWRdIf/tUgoXjFYJDrUZXfsmzOoIjqeC+rtqWe2LUFs?=
 =?iso-8859-1?Q?xOcKM2zFC8OrGXUenozRRbXzIiEBKI0ejdB5stPjEYWkldQvGtc/Fuw5EF?=
 =?iso-8859-1?Q?IUHHhJo6unxSlvg5SqleuWmSLaSbAvLFQwrQ1evGg9H3U2OTRtlBGlQ2Dw?=
 =?iso-8859-1?Q?Qr9bgH2VDRnQ2X8jSL5yWyJdtssKB+pvaGjQ8/HpSK2kLPxU9OztE0BQpB?=
 =?iso-8859-1?Q?Z1mBUL0riikgLipCF5ziCMh1IfmwAyOOY58HSoacjEO3FdGmCLhB5EbxYJ?=
 =?iso-8859-1?Q?ujpGySgv4PE6d97ApJWlNrRnnwmQjA0swrutAp6kuwPBxugU7yOC/COEqd?=
 =?iso-8859-1?Q?iuoxuVLrsBflji5/gJb/ExEuAolvLWr9IVaV8Ha4JoomSVnxrA8/Hpubrg?=
 =?iso-8859-1?Q?awWpw8Xr+zunX36ggzhdXQ/LqF+aNIdzk2D6+fzQ1PT3PqMUsHxwf/izMe?=
 =?iso-8859-1?Q?P3sfhn2szOVp5fHkkXqP57D1KEHv1TcxIitvFreEsc2u/Q89qMkw8XXiWP?=
 =?iso-8859-1?Q?F2zWc2vQh1Rec5sPeJWYPVOK6Mb3dkj2+1TBTpXqJ4hJsJEwf1eQNwBZQn?=
 =?iso-8859-1?Q?vdhR66Wq/JRp7lyNvySrreHUIle8jOtHjDetmEy+k+FAKdF1B7yB52nKG3?=
 =?iso-8859-1?Q?J/CnIqPF0U4tJA/0p50RIUWMVyLRsrOhL4sk6aNa65oPlpnpeEhlm2d+tk?=
 =?iso-8859-1?Q?ep5cARWznhrcKzbwZuyOYtotOWfAVzjsRI9Y2P/YXMhieRCm3bUBqv6swq?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4A3VC61Z9A5uJYSi6vZirp3sbC0Rpt7HeyKQ1z/NvlJAKh9QLAEQiMJoMF?=
 =?iso-8859-1?Q?FqgIzTznrL5x1jfo2K9H5EuuAZXa7uCEt3nuWhswfqDf+Ml32qjVkWD08f?=
 =?iso-8859-1?Q?h7NCrJ1aPEIZqQseNLmRDOhYQanMSNA+OpOVutiSob+BeaiBry5eoWzLjQ?=
 =?iso-8859-1?Q?865M7cK+DC7aDwsHBtx28gH6LQaT5YAZd2vB4QLPbZy8pCqLA9dRQ17Kxm?=
 =?iso-8859-1?Q?cp0Kk7jV+oJESlk/OQdNK41+/ebT0m6DjBrq8yKtKyI9sH1i5icncccEEP?=
 =?iso-8859-1?Q?f6Vhk2N0v4fVmWRCqVB46FzZMJT5f9eJoYVeXVy6TPDNza+MXsShkJC95d?=
 =?iso-8859-1?Q?Zx9lFaGpt39on1TuWyTUUng7vMPEdzfFoJyRmONFp7l+sOgJwLHYQzaXc+?=
 =?iso-8859-1?Q?hEohjr/1YpqXnbM+rWNIi2FVY0TzHBtM0z5ZsbanJt5QmRyWp4hs/DgbBn?=
 =?iso-8859-1?Q?Tt6qabXgnJU0038EjItrV62lV41VA2ZVWHAvsjXH9gJps1WsfSFHxEb4KI?=
 =?iso-8859-1?Q?XaXf4pAT34cuOHPP3PaGrRJHnTBtXFFCvcLn2sjyYG3mv0y9t3oYIY9ZGE?=
 =?iso-8859-1?Q?JUY5MTxQV9ZTNsexZe0lI39c5uPr+qwM3owk4zpdbsMFor7NoDul9lMEFl?=
 =?iso-8859-1?Q?SNjn0FQ1d98QxIhq/hUPR9SZO1g3rT4bHjzUNtMcRsn55ZDXKUCYXT6rEP?=
 =?iso-8859-1?Q?52QG2CtHjbLlXpj1v40Lx5yuDRNsZrQlj9a7pyLQmTz74uxrJmMBNf6dNl?=
 =?iso-8859-1?Q?YMjpdzYiL3J2npdHKusEZv7cHGUrSz5JxGTP9NBAQoyOa+VrRdgOp1CfWH?=
 =?iso-8859-1?Q?uaLTJQjSxLiL3yuvyRJh7hAlFUONp23tK1ykm+QxNN4pWkYP8kELGntoxf?=
 =?iso-8859-1?Q?WmrfLCVVZyMiE8XmtwyGskgGDA3ABcvZpSdgqYpUjuHnXe7oz3vEvhYTiI?=
 =?iso-8859-1?Q?0X/6nFWVD5GUEAqTDLSN1LB7i9xbnuHq2SpggYoGFhKXDnjq0SCm9sZK+m?=
 =?iso-8859-1?Q?8RQx3hTuK3whkIbObTowV7uHKGdgvz5IunXHywHcXmmYOY5NcLG10QGwgJ?=
 =?iso-8859-1?Q?1CftKJRhonxmvLO3FD78Ov7ezndc91UcNaHUcZ6KYV41LBCvAer1JtyD2A?=
 =?iso-8859-1?Q?Jc+CNcMr5dIoRtM8TEyMQZhvFHiYbcBndNFOLfjFveGsKO+UFhL1QWspP6?=
 =?iso-8859-1?Q?6kjQh7RC0yBd+vozeYo1myT76coigDbB87Y8pAz9C8yQhS7jvcRDunR7lh?=
 =?iso-8859-1?Q?afcpRBFaErfWGVvdANqA+vpagR+v3qs3YEfhV/qUPNsdEtzgJzQYj02Mti?=
 =?iso-8859-1?Q?0uS87nL5niUeFwAjoLUIkSoUglsLOO/04M0Z+Ai+QnthR3pyoX4GFporD8?=
 =?iso-8859-1?Q?306d+AF76aOFIeM9Wg3mCmei551VBecSpD62xTOJ8Q5n5qUht5KWgPHcNt?=
 =?iso-8859-1?Q?h/IKeHPyEtMF6Tvc6c1WOey26s8nbLpYLGZX6GMMMjUtvnBLBtQQpIoSSW?=
 =?iso-8859-1?Q?iaS1HqQDftXt22uvybh8F37XYClV9zLUGks6eE+rFUtbWt/NpPpFxam+08?=
 =?iso-8859-1?Q?gdaQkxxsSn1GpeGPTXCthy4cT7xl/EzeRZMynsS5+lueqF9755qPBP6JjU?=
 =?iso-8859-1?Q?0f8a2Wdl4SSHd204O4yDsn7GiiSiAooV+hlm1Pg45+VUmUzeexGJvDKQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c75f291-9405-42e5-c68b-08ddec780ba7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 12:30:49.4801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYj6OwNjUz9+JkakSgCAEfAptsinOGZu8QJoYvUzl00k1E6DnACSuVMpS+RrkN7Vw3buLtp6eXKbsxRFUEycnM3EXlDRupBsvjUvNSeVtXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8792
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

On Thu, Sep 04, 2025 at 12:14:45AM +0200, Michal Wajdeczko wrote:
>
>
>On 9/2/2025 9:34 PM, Lucas De Marchi wrote:
>> On Fri, Aug 29, 2025 at 07:19:22PM +0200, Michal Wajdeczko wrote:
>>> We might want to run our KUnit tests against not defined yet
>>> future platform that differs from the existing ones only by
>>> new GDMID versions being used, but otherwise it is similar
>>> to existing graphics and media IP.
>>>
>>> Add kunit-only "dut" modparam where we can specify GMDIDs to
>>> be used by param generators:
>>>
>>>    $ tools/testing/kunit/kunit.py run ... \
>>>        --kernel_args=xe.dut=LUNARLAKE:2025:2025 \
>>
>> I don't think we should polute the module params for the xe module.
>
>but this extra modparam would be only for CONFIG_DRM_XE_KUNIT_TEST
>so the driver is already not in a production quality, do we still care?

having CONFIG_DRM_XE_KUNIT_TEST enabled doesn't mean anything about
production quality. It only means we have an extra module to test the
internals of the driver + some additional text/data and injection
points in the main driver.


>
>> I'd rather have this in xe_test_mod.c and then it may call something
>> from xe to set the behavior we want.
>
>I'm afraid this could introduce cross-dependencies, maybe we should
>move some code to xe_kunit_helpers.ko ?

how so? The depeendencies are already in the xe_test.ko -> xe.ko
direction:

readelf -s /p2/build-drm-tip/drivers/gpu/drm/xe/tests/xe_test.ko | \
	grep " UND "
      0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND 
    238: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_step_name
    239: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_pci_media_ip_[...]
    240: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_rtp_process_to_sr
    242: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_pci_fake_devi[...]
    243: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND kunit_binary_ptr[...]
    244: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_pci_id_gen_param
    245: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __kunit_do_faile[...]
    246: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __fentry__
    247: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_pci_graphics_[...]
    248: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND dev_driver_string
    249: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __ref_stack_chk_guard
    250: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __stack_chk_fail
    251: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_kunit_helper_[...]
    252: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __ubsan_handle_o[...]
    253: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND sized_strscpy
    254: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_tuning_process_gt
    255: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __kunit_abort
    256: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_wa_process_gt
    257: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_rtp_process_c[...]
    258: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_reg_sr_init
    259: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND drm_kunit_helper[...]
    260: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __x86_return_thunk
    261: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND drm_kunit_helper[...]
    262: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xe_rtp_process
    263: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xa_find
    264: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __warn_printk
    265: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND kunit_binary_ass[...]
    266: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND kunit_ptr_not_er[...]
    267: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND xa_find_after

$ modinfo -F depends /p2/build-drm-tip/drivers/gpu/drm/xe/tests/xe_test.ko  
xe,kunit,drm_kunit_helpers

So what I'm saying is that you should leave the module param in the
xe_test module. Then you call a function from xe that does what you want
it to do. It could be something like this:

xe_pci_add_extra_platform() (or could be xe_module_* too). And then you
pass the arguments needed to define the new platform.
In future it may even be useful for us to use the new_id in sysfs,
although we'd need a way to pass additional data.

I just don't want this test-oriented-param to show up in xe. Also
because we are avoiding new params at all as they usually have the wrong
scope.

Lucas De Marchi

>
>until that time, maybe I just push patches 1-6 and try to experiment
>with this last one patch separately if this extra modparm bothers you?

ack

thanks
Lucas De Marchi

>
>>
>> Another option is just not to be a module param and simply inspect the
>> kernel command line. It should be fine if this is done from a test
>> module rather than the real one.
>>
>> Lucas De Marchi
>>
>>>        "*xe_[wp][ac]*.*_??"
>>>    ...
>>>    KTAP version 1
>>>    1..2
>>>        KTAP version 1
>>>        # Subtest: xe_pci
>>>        # module: xe_test
>>>        1..2
>>>            KTAP version 1
>>>            # Subtest: check_graphics_ip
>>>            ok 1 20.25 Xe2_LPG
>>>        ok 1 check_graphics_ip
>>>            KTAP version 1
>>>            # Subtest: check_media_ip
>>>            ok 1 20.25 Xe2_LPM
>>>        ok 2 check_media_ip
>>>    # xe_pci: pass:2 fail:0 skip:0 total:2
>>>    # Totals: pass:2 fail:0 skip:0 total:2
>>>    ok 1 xe_pci
>>>        KTAP version 1
>>>        # Subtest: xe_wa
>>>        # module: xe_test
>>>        1..1
>>>            KTAP version 1
>>>            # Subtest: xe_wa_gt
>>>            ok 1 LUNARLAKE 20.25(Xe2_LPG) A0 20.25(Xe2_LPM) A0
>>>        ok 1 xe_wa_gt
>>>    ok 2 xe_wa
>>>
>>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/tests/xe_pci.c | 125 +++++++++++++++++++++++++++++-
>>> 1 file changed, 123 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> index f19b1a64128b..0ab3f71b0fb7 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> @@ -12,6 +12,91 @@
>>> #include <kunit/test-bug.h>
>>> #include <kunit/visibility.h>
>>>
>>> +/* defined as arrays to allow reuse param_gens macros */
>>> +static struct xe_pci_fake_data dut_pci_data[1];
>>> +static struct xe_ip dut_graphics_ip[1];
>>> +static struct xe_ip dut_media_ip[1];
>>> +
>>> +static bool has_custom_dut(void)
>>> +{
>>> +    return dut_pci_data[0].graphics_verx100;
>>> +}
>>> +
>>> +static enum xe_platform find_platform_by_name(const char *name)
>>> +{
>>> +    const struct xe_device_desc *desc;
>>> +    const struct pci_device_id *ids;
>>> +
>>> +    for (ids = pciidlist; ids->driver_data; ids++) {
>>> +        desc = (const void *)ids->driver_data;
>>> +        if (!strcmp(name, desc->platform_name))
>>> +            return desc->platform;
>>> +    }
>>> +    return XE_PLATFORM_UNINITIALIZED;
>>> +}
>>> +
>>> +static const struct xe_ip *find_similar_graphics_ip(unsigned int verx100)
>>> +{
>>> +    size_t i;
>>> +
>>> +    for (i = 1; i < ARRAY_SIZE(graphics_ips); i++)
>>> +        if (graphics_ips[i].verx100 > verx100)
>>> +            break;
>>> +    return &graphics_ips[i - 1];
>>> +}
>>> +
>>> +static const struct xe_ip *find_similar_media_ip(unsigned int verx100)
>>> +{
>>> +    size_t i;
>>> +
>>> +    for (i = 1; i < ARRAY_SIZE(media_ips); i++)
>>> +        if (media_ips[i].verx100 > verx100)
>>> +            break;
>>> +    return &media_ips[i - 1];
>>> +}
>>> +
>>> +static int dut_param_set(const char *val, const struct kernel_param *kp)
>>> +{
>>> +    char buf[32], *s = buf, *tok;
>>> +    const struct xe_ip *origin;
>>> +
>>> +    strscpy(buf, val);
>>> +    tok = strsep(&s, ":");
>>> +    dut_pci_data[0].platform = find_platform_by_name(tok);
>>> +    if (dut_pci_data[0].platform < XE_METEORLAKE)
>>> +        return -EINVAL;
>>> +    tok = strsep(&s, ":");
>>> +    if (kstrtouint(tok, 10, &dut_pci_data[0].graphics_verx100))
>>> +        return -EINVAL;
>>> +    tok = strsep(&s, ":");
>>> +    if (kstrtouint(tok, 10, &dut_pci_data[0].media_verx100))
>>> +        return -EINVAL;
>>> +
>>> +    dut_pci_data[0].subplatform = XE_SUBPLATFORM_NONE;
>>> +    dut_pci_data[0].step.graphics = STEP_A0;
>>> +    dut_pci_data[0].step.media = STEP_A0;
>>> +
>>> +    origin = find_similar_graphics_ip(dut_pci_data[0].graphics_verx100);
>>> +    dut_graphics_ip[0].verx100 = dut_pci_data[0].graphics_verx100;
>>> +    dut_graphics_ip[0].name = origin->name;
>>> +    dut_graphics_ip[0].desc = origin->desc;
>>> +
>>> +    origin = find_similar_media_ip(dut_pci_data[0].media_verx100);
>>> +    dut_media_ip[0].verx100 = dut_pci_data[0].media_verx100;
>>> +    dut_media_ip[0].name = origin->name;
>>> +    dut_media_ip[0].desc = origin->desc;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct kernel_param_ops dut_param_ops = {
>>> +    .set = dut_param_set,
>>> +};
>>> +
>>> +module_param_cb(dut, &dut_param_ops, NULL, 0400);
>>> +MODULE_PARM_DESC(dut, "Specify fake GMDID platform to be used during tests:\n"
>>> +         "dut=<PLATFORM_NAME>:<GRAPHICS_VERx100>:<MEDIA_VERx100>\n");
>>> +
>>> #define PLATFORM_CASE(platform__, graphics_step__)                    \
>>>     {                                        \
>>>         .platform = XE_ ## platform__,                        \
>>> @@ -64,6 +149,13 @@ static const struct xe_pci_fake_data cases[] = {
>>>
>>> KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>>>
>>> +static void xe_pci_fake_data_desc_nc(struct xe_pci_fake_data *param, char *desc)
>>> +{
>>> +    xe_pci_fake_data_desc(param, desc);
>>> +}
>>> +
>>> +KUNIT_ARRAY_PARAM(dut_platform, dut_pci_data, xe_pci_fake_data_desc_nc);
>>> +
>>> /**
>>>  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data parameters
>>>  * @prev: the pointer to the previous parameter to iterate from or NULL
>>> @@ -77,6 +169,8 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>>>  */
>>> const void *xe_pci_fake_data_gen_params(const void *prev, char *desc)
>>> {
>>> +    if (has_custom_dut())
>>> +        return dut_platform_gen_params(prev, desc);
>>>     return platform_gen_params(prev, desc);
>>> }
>>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_gen_params);
>>> @@ -152,14 +246,14 @@ static const char *sriov_name(enum xe_sriov_mode mode)
>>>
>>> static const char *lookup_graphics_name(unsigned int verx100)
>>> {
>>> -    const struct xe_ip *ip = find_graphics_ip(verx100);
>>> +    const struct xe_ip *ip = find_similar_graphics_ip(verx100);
>>>
>>>     return ip ? ip->name : "";
>>> }
>>>
>>> static const char *lookup_media_name(unsigned int verx100)
>>> {
>>> -    const struct xe_ip *ip = find_media_ip(verx100);
>>> +    const struct xe_ip *ip = find_similar_media_ip(verx100);
>>>
>>>     return ip ? ip->name : "";
>>> }
>>> @@ -207,6 +301,14 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
>>> KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
>>> KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
>>>
>>> +static void xe_ip_kunit_desc_nc(struct xe_ip *param, char *desc)
>>> +{
>>> +    xe_ip_kunit_desc(param, desc);
>>> +}
>>> +
>>> +KUNIT_ARRAY_PARAM(dut_graphics_ip, dut_graphics_ip, xe_ip_kunit_desc_nc);
>>> +KUNIT_ARRAY_PARAM(dut_media_ip, dut_media_ip, xe_ip_kunit_desc_nc);
>>> +
>>> static void xe_pci_id_kunit_desc(const struct pci_device_id *param, char *desc)
>>> {
>>>     const struct xe_device_desc *dev_desc =
>>> @@ -232,6 +334,8 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
>>>  */
>>> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
>>> {
>>> +    if (has_custom_dut())
>>> +        return dut_graphics_ip_gen_params(prev, desc);
>>>     return graphics_ip_gen_params(prev, desc);
>>> }
>>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>>> @@ -249,6 +353,8 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>>>  */
>>> const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
>>> {
>>> +    if (has_custom_dut())
>>> +        return dut_media_ip_gen_params(prev, desc);
>>>     return media_ip_gen_params(prev, desc);
>>> }
>>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>>> @@ -292,6 +398,16 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>>>     /* Nothing to do, just use the statically defined value. */
>>> }
>>>
>>> +static const struct xe_ip *find_dut_graphics_ip(unsigned int verx100)
>>> +{
>>> +    return dut_graphics_ip[0].verx100 == verx100 ? dut_graphics_ip : NULL;
>>> +}
>>> +
>>> +static const struct xe_ip *find_dut_media_ip(unsigned int verx100)
>>> +{
>>> +    return dut_media_ip[0].verx100 == verx100 ? dut_media_ip : NULL;
>>> +}
>>> +
>>> int xe_pci_fake_device_init(struct xe_device *xe)
>>> {
>>>     struct kunit *test = kunit_get_current_test();
>>> @@ -332,6 +448,11 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>>     kunit_activate_static_stub(test, xe_info_probe_tile_count,
>>>                    fake_xe_info_probe_tile_count);
>>>
>>> +    if (has_custom_dut()) {
>>> +        kunit_activate_static_stub(test, find_graphics_ip, find_dut_graphics_ip);
>>> +        kunit_activate_static_stub(test, find_media_ip, find_dut_media_ip);
>>> +    }
>>> +
>>>     xe_info_init_early(xe, desc, subplatform_desc);
>>>     xe_info_init(xe, desc);
>>>
>>> -- 
>>> 2.47.1
>>>
>
