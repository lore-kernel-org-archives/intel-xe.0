Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006D5C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 04:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC1E10E241;
	Tue,  5 Aug 2025 04:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFWVqyud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E05A10E241
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 04:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754369020; x=1785905020;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eq9QxZE4NY8H+KIOA0uvIYeCuDCJqDsqu6V/NggMzZI=;
 b=CFWVqyudW8miLKOuH20/cQbp2kFN7W8um5aLHHZnq6PvsUP+oSk9wjy2
 vP5GE2kC3l5Fumyg89MP1PpkHSw8hedWl3ZyYMgBhq2nN/YRLwX/tNJ4S
 OH1tLx9iurKuvEGyICvwVCnEjQEAySN7Tyyzx8ktTIEgexwW52Rd8MSqB
 hCCj5Jzxc6ECrskUBvJvk1ZJJeLOWi5YrZEHSejRXrzyg6NHqjaXEBv2i
 1MySro8OfEWfZstR7UZILXZZmSRjvpGZdiPdJvcEvZ8YdTxb5pTPTDh7O
 KiCVg/GUhJ+Gcfki6W8Gx16owNkMZH8gA9DfiAOXYTzMmH/M6QWrs33Qa w==;
X-CSE-ConnectionGUID: Ty4MuszYScCJSfXx0ZBpyA==
X-CSE-MsgGUID: 17ScfiSDQ86gAEnwxIs11Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="55688964"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="55688964"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 21:43:40 -0700
X-CSE-ConnectionGUID: 430obd0wR4uB4yjf1Pf4UA==
X-CSE-MsgGUID: aG19U5o/Qz+BivAz2fTAlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="169647054"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 21:43:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 21:43:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 21:43:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 21:43:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4RChNwoonj8dHGIt9Ux99CcmSTJg6ROnV+3I7KCvrlRhipkigFajtKJGw4VJTohIuI30YJXmO3QBHtR6OsrWof+0AwdULodCbGHeOCPknJBaagwS2BsA67XbNIylxtJ7Fabl0rGau+90U8mU2h9w2Dt+AHHyCMhp1hbE6t8qqmbO69OGfZW1Un3ULag61dfuK1wx6YMo9DGNKy8/s7fG3KkdXeBCSjOTBIFcl0epdAi/k+7wfAH2EzbJybDLlMiBRT0HD4jFA4QsWAB6CYgvwFUM0Isv8aZCEmOE9AtPbOenddK2R1xXFC2CISn+XWp5YTyl1Kq5U5X/jQBwVnUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5bGLRTtf8xLPn/ZttN3iS1bAqq+4AYjc/yb2ZdpWaQ=;
 b=LhsS1AG5r9Eb+dySLqZPkwx5JOxuAvISt+UDjF4qADDqxd/Pi970llS8kPkrM28Igcdko4S0b5EnIMd8h9YEewLscTPpfacCKMFnLa1a3/TOxJPIUxhovWoNtwolpqaGMgRhUctIHH0pLmlvAuwHNx4XSBQBIfwRe7gFF33YJ8uQLr81909ffx9ik04RQ1YOP1YWLT+B19U/dW8PwKk3LU5GKR5KM84+XEFqs6IPk+pEDb1UZLDPSmfq2tfZNNANRsSHd7ymyIECguiMtfFFklOqHxmHfYvQT3KC0l1MZNGQwiLRWrzSLUiWLKFk68taGBKKITOfnuYp7d4+Upa2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 5 Aug
 2025 04:43:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 04:43:37 +0000
Date: Mon, 4 Aug 2025 21:43:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v5 13/25] drm/xe: Implement madvise ioctl for xe
Message-ID: <aJGL9uzIIOYemBnW@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-14-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730130050.1001648-14-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a6da42-5bd3-4a60-7c79-08ddd3daa43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4BWsomowTfB/+YHdPTi5b7nGniWpKxC14jsNiPQ82e9AsEsAOqKxgjs46c?=
 =?iso-8859-1?Q?DWv1RIomkehkex8TwVC9P8NkN077/i83/5J7+MQoqj//JzKdK8km7lrj5B?=
 =?iso-8859-1?Q?GTECfvj7CKvGk8u6l4f+x1ZZpUJxYsrFmk1zgw06g3fEfYN9+XGLAj6+BN?=
 =?iso-8859-1?Q?exru2AvaI2a9SiyI9s+JEkzka5gUyCmj5RtMhk0nZ2eHWoVDoSD9Fudoxd?=
 =?iso-8859-1?Q?jGXRY39pwqX9Z9ra7DlZ7YsJyNDOCvm9XDo3ZnpYxWB3Z9dc83C+vf/iMi?=
 =?iso-8859-1?Q?vOIp/0XAN/A1TsNhya7c4+KtTrseMP72i0stV5zY4BvNlfjz4OPgSKSY0K?=
 =?iso-8859-1?Q?j7hKpqHdidlqy4dw/aA5S7629h86V97p3gGuGLrHenz+AYsaCIJqUIjAtq?=
 =?iso-8859-1?Q?2A0cqlubxu6uFkf0dOq2aF2592/Lp+Wp9DVdXIfD7iB1GCzZeC9t0FdFFG?=
 =?iso-8859-1?Q?p2VMre3+xcV2HLF5ZtwDpvDp3qFast0hDt5FwMe55rPJJJKOKLbdxkTlWn?=
 =?iso-8859-1?Q?CeagiMCXmev9wM3lojc+CB/12oYiEvrV5rITh+VPfdIMaPLclyg+j2oban?=
 =?iso-8859-1?Q?ldR2fosaDFabTqpseYPOjuVt1LY33wEKO2rHkHDqzp4VMN5EFRFmFK2uBa?=
 =?iso-8859-1?Q?V/0vRWModzEAdvTKfLJ/605FqbrnBELBHeWaveULJ0cFNHiTEI1lNzzZT7?=
 =?iso-8859-1?Q?B/0PE2i+KYtKZGXKvCUzb1EISXFiYreSn+jwn1rx4uqY1GY/otpJKWmXDh?=
 =?iso-8859-1?Q?3XKnEZfbWZrYQp5UnBm1ZwYdZJtIDrYnSPFlbOA0ZDYYhdip5rGZXLeuvu?=
 =?iso-8859-1?Q?Tv0kVxyKxj+ZC72ytfu4R8whMUBkvAXUA28PXZ53DtEJ+zjUxsG3kMSPNO?=
 =?iso-8859-1?Q?MX+JsL727jP8zVUgvohTXuoLzaH+tI69UkhFciSqAeK4wdHuD0N7sA2nRm?=
 =?iso-8859-1?Q?UXru8UmSnK/wPKHy57MWmpoxvNxUaUPDoXOrdvBTfWDvp/EKK+BV4G7uf6?=
 =?iso-8859-1?Q?zQGwCZvl0U0J++FpBgEgqrSeLpqtCWe5pMTndJrs1Bh/piU3FZ/zQjuTDA?=
 =?iso-8859-1?Q?dggGHnaWaAhGr5raYMhpGzleciz7Mw3rHLFQ5b+2IPcxq8Yjq3+7Eii6cJ?=
 =?iso-8859-1?Q?hOmKzlyVJAyeR0UTMotdrJF65l0jsJSWN202OpdOcGbW1kS2n1h0zfMcgL?=
 =?iso-8859-1?Q?dQ2Ao6L8hy9a4CsCy3zZSGWfNcHScSn4fLV6S936rZXqiZ7Mt7UmvquXIn?=
 =?iso-8859-1?Q?/2IIdY/xDtC2LXXAhuA1+MGNKQA/1BI2PKmeP1ylFmLL/IxSQmA9IZ6rFz?=
 =?iso-8859-1?Q?yCSM/0YVG98oGBehx5ImT9vea0S+9/lBtW1nZO+D6jNVc6QoZ8vyw6112y?=
 =?iso-8859-1?Q?ijkWf0Dqkfyz8sI5dQFEMv4X7FWPCwMkAg2DwfheJtpnajsKKCfiAd9UAX?=
 =?iso-8859-1?Q?L06HEMByvo6HImrSoeSxXeUkJ+7YcJsoWqhM0A08iLM/7l3xivLa/QL9KC?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0nLfhQIvHmgaWqOSDB58d2ZtiWvcJaeKcz+5g4BBVa4YzoiWXgV17eEad4?=
 =?iso-8859-1?Q?+qOQGTtynqIC8Bqn9uDLG/vjVFsZTTLotdX63Vn3rngrXIFxjLrESuQ/81?=
 =?iso-8859-1?Q?zdd8J24pV01H0/p7PNAhhDTJJmt2aZNwhQjJZmKv/29vXxSx8CYHMmgTN/?=
 =?iso-8859-1?Q?iO7JpGNyooHxPLjmTKUvKfCUQtZeClK+bfPtbarQXOhuGkJxfZzYuNO/3k?=
 =?iso-8859-1?Q?pFZjPb2vOMLztgxZofqgSpna7aG9GxWUCuKYLyUMgRX4BZMgFgRlct0nuu?=
 =?iso-8859-1?Q?jvrf8DSztQcHjQac5QMgPUYz57ybHWmic/eqJZkqSPRgDjXhtrc9R2UpJN?=
 =?iso-8859-1?Q?gSawzl6/J+q1oRquei4O2AxYiWB3LD2pPQLJ+nM7eMaJPqtKQZG1c2Nyrg?=
 =?iso-8859-1?Q?udBmiRTAlNOiUkhszZyXbfV7OuNjSl5lrlHVKiRrrykJ0IMvw5FfEAT3MB?=
 =?iso-8859-1?Q?O2RiXFUiln0bdrKa3bDaYdV3EXBlifjsMrxRW21LMeivKmhXg26Xq4L+jl?=
 =?iso-8859-1?Q?UsjFHPCwSwr2BCzHlnfUbC0eUOLikGGwViSWMEaNChDds13+nwC4sp5b//?=
 =?iso-8859-1?Q?EpknthZaZn93KPnxnHG16KYU6HdZfQthTrlMDz+fk2zHALAFMrjigvyCkj?=
 =?iso-8859-1?Q?5Wo/1dCLKdoNu4AZrRSHMwjVmJ4M0Rcf9JZ+EneqlU30ftCOcvuU2msDMj?=
 =?iso-8859-1?Q?krHRpWDs4zVlXCV/P2fPa+r4eALdkytUxx8nNIdqC9iac8kM52SjG6nqkJ?=
 =?iso-8859-1?Q?gBuiLdGG7tqQ9A8rzEoG9kL70n/FKvM8hZIb3SZbNt4n6itC4Whdn1DSrR?=
 =?iso-8859-1?Q?1Fjj783Z1xPkfg0bbaNRtJZiulp4IR+jU/SK7AKDKeeeiw+igPnlUwSBNo?=
 =?iso-8859-1?Q?EjNAqZqKj9R3yuLKEQtZuZHtk7XXEo+A//QnUU43mxj6bohi9m/b6YfKvA?=
 =?iso-8859-1?Q?2nCqVIA3TERSaPgjUdmfMFIi91x8EOBlaoMt/+lcQ+nTm5OKEqCvkgK8oQ?=
 =?iso-8859-1?Q?pPLU31v2X8IANaFjYs4bpe8oK5ybr6gkWGcTM6xDoyW1V3GqsGyeSGFCC1?=
 =?iso-8859-1?Q?pZbkTUrnvitZeCK7jjxIKnEg+I5Slt5HKh0BX5hDlr//OU2IwcuGQv8LS3?=
 =?iso-8859-1?Q?rNYOejdMZpmOqyl0IGvgD6gi88/urxDQGeubsCach8cLtkrH97OzTPSF0K?=
 =?iso-8859-1?Q?fDJkCDzBJiC2dBmIjP4TB1XLzo9M9taPJldFRrAsxY1zxwxo5fuKJrdgkL?=
 =?iso-8859-1?Q?UCYnp8QawvDjj30Z7/7Y+jh/MWjA0Uqg/h5H444kk10XlxiCSnfuaRx9H2?=
 =?iso-8859-1?Q?3elhLRv7QmIKPOoCOZERxx0aHiePRCXmHN/sYMIy7TucMCdJ4l9e5LJtan?=
 =?iso-8859-1?Q?nMPxi+XUwOmIkeu4+ExVQmFzGCP7zMmR7Hj5ReBrgynW31k8bML29dnr7H?=
 =?iso-8859-1?Q?QeYUm0Bgr+eTbyHUd3zavlLlPg391qITMdXDre4Hpw3r95PSthEs6CGQiX?=
 =?iso-8859-1?Q?QjWfb2PPERCtj4BYBIb2vAgHslCqFsr3p1dZQnxscfoYd4Dmmr8gk0PmiV?=
 =?iso-8859-1?Q?2MhN4+0aB0OkFRMgQcPxrPN6Z0pIJE1m1zvUTur5/iKDWvjjXpj0NhTLZg?=
 =?iso-8859-1?Q?MqiMsbuwxLW0Qy59Z3zcZSrozLjMQRnaAfl5+c03Wf73KLNUXmQe5c5w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a6da42-5bd3-4a60-7c79-08ddd3daa43f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 04:43:36.9839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8mitk1s9ubNTxnr5TaaEmtq16u7zgJf2cPYH/I/dmwcXkPFS9QxLAVC1Hg3J8a9xBkEVUCzMqwbvLFYj7kmfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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

On Wed, Jul 30, 2025 at 06:30:38PM +0530, Himal Prasad Ghimiray wrote:
> This driver-specific ioctl enables UMDs to control the memory attributes
> for GPU VMAs within a specified input range. If the start or end
> addresses fall within an existing VMA, the VMA is split accordingly. The
> attributes of the VMA are modified as provided by the users. The old
> mappings of the VMAs are invalidated, and TLB invalidation is performed
> if necessary.
> 
> v2(Matthew brost)
> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
> fault mode too
> - fix tlb invalidation skip for same ranges in multiple op
> - use helper for tlb invalidation
> - use xe_svm_notifier_lock/unlock helper
> - s/lockdep_assert_held/lockdep_assert_held_write
> - Add kernel-doc
> 
> v3(Matthew Brost)
> - make vfunc fail safe
> - Add sanitizing input args before vfunc
> 
> v4(Matthew Brost/Shuicheng)
> - Make locks interruptable
> - Error handling fixes
> - vm_put fixes
> 
> v5(Matthew Brost)
> - Flush garbage collector before any locking.
> - Add check for null vma
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 308 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>  3 files changed, 324 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757..d0ea869fcd24 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -128,6 +128,7 @@ xe-y += xe_bb.o \
>  	xe_uc.o \
>  	xe_uc_fw.o \
>  	xe_vm.o \
> +	xe_vm_madvise.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
>  	xe_vsec.o \
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> new file mode 100644
> index 000000000000..b861c3349b0a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_vm_madvise.h"
> +
> +#include <linux/nospec.h>
> +#include <drm/xe_drm.h>
> +
> +#include "xe_bo.h"
> +#include "xe_pt.h"
> +#include "xe_svm.h"
> +
> +struct xe_vmas_in_madvise_range {
> +	u64 addr;
> +	u64 range;
> +	struct xe_vma **vmas;
> +	int num_vmas;
> +	bool has_svm_vmas;
> +	bool has_bo_vmas;
> +	bool has_userptr_vmas;
> +};
> +
> +static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
> +{
> +	u64 addr = madvise_range->addr;
> +	u64 range = madvise_range->range;
> +
> +	struct xe_vma  **__vmas;
> +	struct drm_gpuva *gpuva;
> +	int max_vmas = 8;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	madvise_range->num_vmas = 0;
> +	madvise_range->vmas = kmalloc_array(max_vmas, sizeof(*madvise_range->vmas), GFP_KERNEL);
> +	if (!madvise_range->vmas)
> +		return -ENOMEM;
> +
> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_bo(vma))
> +			madvise_range->has_bo_vmas = true;
> +		else if (xe_vma_is_cpu_addr_mirror(vma))
> +			madvise_range->has_svm_vmas = true;
> +		else if (xe_vma_is_userptr(vma))
> +			madvise_range->has_userptr_vmas = true;
> +
> +		if (madvise_range->num_vmas == max_vmas) {
> +			max_vmas <<= 1;
> +			__vmas = krealloc(madvise_range->vmas,
> +					  max_vmas * sizeof(*madvise_range->vmas),
> +					  GFP_KERNEL);
> +			if (!__vmas) {
> +				kfree(madvise_range->vmas);
> +				return -ENOMEM;
> +			}
> +			madvise_range->vmas = __vmas;
> +		}
> +
> +		madvise_range->vmas[madvise_range->num_vmas] = vma;
> +		(madvise_range->num_vmas)++;
> +	}
> +
> +	if (!madvise_range->num_vmas)
> +		kfree(madvise_range->vmas);
> +
> +	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n", madvise_range->num_vmas);
> +
> +	return 0;
> +}
> +
> +static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> +				      struct xe_vma **vmas, int num_vmas,
> +				      struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> +			   struct xe_vma **vmas, int num_vmas,
> +			   struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> +			      struct xe_vma **vmas, int num_vmas,
> +			      struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> +			     struct xe_vma **vmas, int num_vmas,
> +			     struct drm_xe_madvise *op);
> +
> +static const madvise_func madvise_funcs[] = {
> +	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> +	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
> +	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
> +};
> +
> +static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpuva *gpuva;
> +	struct xe_tile *tile;
> +	u8 id, tile_mask;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	/* Wait for pending binds */
> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> +		XE_WARN_ON(1);
> +
> +	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_null(vma))
> +			continue;
> +
> +		for_each_tile(tile, vm->xe, id) {
> +			if (xe_pt_zap_ptes(tile, vma)) {
> +				tile_mask |= BIT(id);
> +
> +				/*
> +				 * WRITE_ONCE pairs with READ_ONCE
> +				 * in xe_vm_has_valid_gpu_mapping()
> +				 */
> +				WRITE_ONCE(vma->tile_invalidated,
> +					   vma->tile_invalidated | BIT(id));
> +			}
> +		}
> +	}
> +
> +	return tile_mask;
> +}
> +
> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
> +
> +	if (!tile_mask)
> +		return 0;
> +
> +	xe_device_wmb(vm->xe);
> +
> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
> +}
> +
> +static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
> +{
> +	if (XE_IOCTL_DBG(xe, !args))
> +		return false;
> +
> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
> +		return false;
> +
> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
> +		return false;
> +
> +	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
> +		return false;
> +
> +	switch (args->type) {
> +	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
> +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
> +			return false;
> +		break;
> +	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
> +		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->atomic.pad))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
> +			return false;
> +
> +		break;
> +	case DRM_XE_MEM_RANGE_ATTR_PAT:
> +		/*TODO: Add valid pat check */
> +		break;
> +	default:
> +		if (XE_IOCTL_DBG(xe, 1))
> +			return false;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> + * @dev: DRM device pointer
> + * @data: Pointer to ioctl data (drm_xe_madvise*)
> + * @file: DRM file pointer
> + *
> + * Handles the MADVISE ioctl to provide memory advice for vma's within
> + * input range.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_madvise *args = data;
> +	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
> +							 .range =  args->range, };
> +	struct xe_vm *vm;
> +	struct drm_exec exec;
> +	int err, attr_type;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	if (!madvise_args_are_sane(vm->xe, args)) {
> +		err = -EINVAL;
> +		goto put_vm;
> +	}
> +
> +	xe_svm_flush(vm);
> +
> +	err = down_write_killable(&vm->lock);
> +	if (err)
> +		goto put_vm;
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +
> +	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> +	if (err)
> +		goto unlock_vm;
> +
> +	err = get_vmas(vm, &madvise_range);
> +	if (err || !madvise_range.num_vmas)
> +		goto unlock_vm;
> +
> +	if (madvise_range.has_bo_vmas) {
> +		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> +		drm_exec_until_all_locked(&exec) {
> +			for (int i = 0; i < madvise_range.num_vmas; i++) {
> +				struct xe_bo *bo = xe_vma_bo(madvise_range.vmas[i]);
> +
> +				if (!bo)
> +					continue;
> +				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +				drm_exec_retry_on_contention(&exec);
> +				if (err)
> +					goto err_fini;
> +			}
> +		}
> +	}
> +
> +	if (madvise_range.has_userptr_vmas) {
> +		err = down_read_interruptible(&vm->userptr.notifier_lock);
> +		if (err)
> +			goto err_fini;
> +	}
> +
> +	if (madvise_range.has_svm_vmas) {
> +		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
> +		if (err)
> +			goto unlock_userptr;
> +	}
> +
> +	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
> +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
> +
> +	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
> +
> +	if (madvise_range.has_svm_vmas)
> +		xe_svm_notifier_unlock(vm);
> +
> +unlock_userptr:
> +	if (madvise_range.has_userptr_vmas)
> +		up_read(&vm->userptr.notifier_lock);
> +err_fini:
> +	if (madvise_range.has_bo_vmas)
> +		drm_exec_fini(&exec);
> +	kfree(madvise_range.vmas);
> +	madvise_range.vmas = NULL;
> +unlock_vm:
> +	up_write(&vm->lock);
> +put_vm:
> +	xe_vm_put(vm);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> new file mode 100644
> index 000000000000..b0e1fc445f23
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_VM_MADVISE_H_
> +#define _XE_VM_MADVISE_H_
> +
> +struct drm_device;
> +struct drm_file;
> +
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file);
> +
> +#endif
> -- 
> 2.34.1
> 
