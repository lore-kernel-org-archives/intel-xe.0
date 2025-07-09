Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3514BC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 13:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E581010E032;
	Wed,  9 Jul 2025 13:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpEH9EZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6A910E032
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752068612; x=1783604612;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E5pa7EjyCTAqb3NxJX2lGxUBKJKHClEbZN/r1mN9Y2s=;
 b=gpEH9EZ5dbfmpKXZph4IfJskQ4MF/PjpXBx5+ihFwu1YWETHGsbn/hS+
 HOp1WdL8/gUdOzjsK+qqfnM5gosI3rosZtMmGWQvipsq6jlK+fCQrmHKC
 bTbZ6B4Lxo85qjKnQABIIlBG2uT4syAjfaCCyYsfAPphLpEl/cYpFFKVC
 eTPoO9gG9dw1MtJlV5TH3gzzJ9Ynt2rQwHc9mulectK7F6lDVZnMwllAg
 S7WXQIQvRxlDdFAmePm7cPSghoniJeVc0fOcyiFEUfVPReLQlRU6gWDbV
 CHS3D7/2AkJ/B5mYmFjnKboUBs/1f4YVIUXNILzXfE6SZK4eyuJZ+G5fH Q==;
X-CSE-ConnectionGUID: LeqswkDnS5GdBYnh3IfiUg==
X-CSE-MsgGUID: URDm0P3iRZSsWtqSfz+LJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54418084"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54418084"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:43:32 -0700
X-CSE-ConnectionGUID: oQ/h0UgmQ/qPlkcdo6xJdA==
X-CSE-MsgGUID: VJeYbuxNTxKbHf1h9J0+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156259838"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:43:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:43:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 06:43:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bq9IQgfg1vMAaZ1FDoAXMblLMwtwT7wuqpVR+tDpGjLZovR0jbADONcKWoqCURIIiGdXieLTp7DLTaJTPXRa5a5wqPZZ6s6ZKUlDHIrNwL9Pzs+UyVReA2bMHNn64VCtu10u13YPwnifouR6p/9isj0CoCXx3Q6Zp/zG5XTy7u2RSqvyIXvSO2nKcxXwkQsgPMi+ruQzaxdkHFPgCls/1F3O4br5pRhca8BvjOSRE5h91AM1u8wvr2f12bjt3yWbRzC0RIlPSyrezvYr2MIxnB6/Z9OrPOVch6+rGTXtXfAZMJx+p6BWU1bnPAsfGLivJ2AnygtVw0+y1JAhe/R4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FGqwWRx0HuajxlhNnLZ+q2Q0TGzMTlVcANbh/WUaCw=;
 b=jv/EECpjcBVJLafYW5cj6tZGLdnxHR7NguVo7SN8lxRMTZK0t+PBYbdCyx26EAxmfu1FrcYKQc8KITxvsbfXAN6UUCetspJntAW5CC8mlnP7htyuDquvp46dfk0G9jdaQvGStkQfhu29Zdb6CL9o9SNe6888ZI+NBvmj+I1JnAu7salGNBVuYeSMaKD5Kc9ISb/s7eo2IFyhFpd16vRC7TFXPpk6HZO/UyjGDTsDYaM9vQ1Jg2L5AHwpgpQiR3IQRsKePIuxKSeix2cGH8+SlYm2KrjEoZbfnsttQxrz5Lb3U7lXVUr84x2PnQVLA8KkcV9RVAT6QnB1WEfxQycoLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 13:43:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 9 Jul 2025
 13:43:29 +0000
Date: Wed, 9 Jul 2025 08:43:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v8 6/7] drm/xe/xelp: Implement Wa_16010904313
Message-ID: <kdkh36i4bvml7zt2pgusm5l3f3uizyeopjdtxydxrnogai4ekw@qrcy4oc5kbtu>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-7-tvrtko.ursulin@igalia.com>
 <nsjsykie3vxairexo4emiyu4ntma76krzknerwenbzzvzcyblj@3lnuuhfdbuux>
 <c69fb4cd-914e-4304-95df-6c2e0642d1be@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <c69fb4cd-914e-4304-95df-6c2e0642d1be@igalia.com>
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5238:EE_
X-MS-Office365-Filtering-Correlation-Id: b351ea21-0b9c-4704-96db-08ddbeee965d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C0TFWIR8ccfneO2uH6+dnLj9C9x652nDXJwKLTsrJ/3eJZ2Nu2GyxRp20jQi?=
 =?us-ascii?Q?MLpLVQjbUeUkPbj86PGdJ+zcJp9FRzwa0sJKzKBF5t5fuFAjLTKnfMnmyiAR?=
 =?us-ascii?Q?PbSMh0VSDcDNEZamvTWj2vSzc4gsdZEY22JkCT297/e8ELcmzzmQNSmbhgS7?=
 =?us-ascii?Q?/YPcCu8duotlp4u5OH4i2EEzPQ6wiONLN7vYVotVtjx3aOyNetOwhVN/dcDV?=
 =?us-ascii?Q?HlhWRMF3nSkcmtnlIyN+V1SbhpPZXbYaZ5WfBqujrPPFS1pO3Ww3eO4vnhO6?=
 =?us-ascii?Q?y22srS+oQNOyXceCQxIi0Gs1bkYEMbbabSyYLVfU8yTIA5WseEMPkN6pvNee?=
 =?us-ascii?Q?2QocEswX1fCRwMsY12zI4hVAFah7k5ehHHKOp5d2uh/8F8x8KZk0YLI484tT?=
 =?us-ascii?Q?ZhlC8wExBU8jvbdq+32ep7aMjLBbwYA3rv6Z1Cv/240Za/Ar7cluZ0cPYClU?=
 =?us-ascii?Q?rgQB5H531pmkjgXb2eo7hw3fpaEx0VcVZNa4Ru0+ZmNIqDNbjIhMzvLCImgJ?=
 =?us-ascii?Q?vr7fBcPDBaej2kHMcxaOr4XtBljdlHAAw9amOvTDtSgyP9fCbitjbIrhalpz?=
 =?us-ascii?Q?SNT1S05KAQKgdYLaE9Hovmsk4mpbOVWIPNTRV3P3Yz5QJkG5aq0vUjjx8UGe?=
 =?us-ascii?Q?QeufE8E2n0VWyCr8JIqJXCKxNC4LKd6O7eOAKQqXZvked1cRgf9Q9gpPp3/n?=
 =?us-ascii?Q?wNgj1aK79C3N2/rJwxF7y5CzR7LtwDmEbIHyvukywoZ6UuR1ULcUyRL1t4Ri?=
 =?us-ascii?Q?QsZO3QdYuxfLVJt/HSzFOxeSaUM9tedIjAOhLTCq80g62rbdSUPwtHYQLBlN?=
 =?us-ascii?Q?pGep5XvNa/cwTnJwjfdiZtgj7DrgUvM8SwmVqOX9KoymQ82ZkklTV0TXZKUb?=
 =?us-ascii?Q?SrrA+IpkP0f+QhWUsbA9Q7dQnAjnnpQ74IqE3Dkyw5BYJwab4g6PjjytAlVH?=
 =?us-ascii?Q?uyOzxyXIC82FhNO2qsW/uo2ZVLzIngwsXgfsXRGdeu90U2YQau1FD9fyXeSa?=
 =?us-ascii?Q?VbgUdQYYtGuzhI4xzgq/pu3OS0Ud3lpcbEMmS+iujdLhuoariXifwDgz+XSU?=
 =?us-ascii?Q?jhWAqQaKB5pV+Tih5hOiEw+pRTLfJlrijrZDV7ah2n/5T//2sZx0qWkZjJWY?=
 =?us-ascii?Q?kIKqeNw66yaDCc7TwTNdbnC5FG7I1VwQjHb5E0P58McrovJ30ZJdZXSiiJmF?=
 =?us-ascii?Q?u7BPGXCdTGP54g9H4Cj5RPgETTFMnv8xSuD+jogrM/dUlwT9nki7yftqIU7n?=
 =?us-ascii?Q?mXDZ+POP1s3zB2UIfFWjG732JuJ0v/BRsMwfPYZt0c690/O1JhYCSCOxBBDI?=
 =?us-ascii?Q?K850zc70H2gCUK9b2yv8klohjdl0MH24T3JUV88w5GjnSwn2XDLv4DLeeTou?=
 =?us-ascii?Q?HjB5O86i3KBYQV8P3KJFP1ZLaBIOgOmxXpbDp3hQLpuNMa/FvuwZif2jtF40?=
 =?us-ascii?Q?0OjwlA41OtA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BOx4ENiPdZbYHzPeRy7OZLE/GEN0Eejf/feCnwssxg2Kkt6hJME1IentHQ9A?=
 =?us-ascii?Q?mjPmR8lA29b20JZpx1RZxNyLxeLcIzOI2PxxKzqH6MImG9Xt5koEi9JK6wlT?=
 =?us-ascii?Q?9yG+66FeXloi4YK8Kn1Fo/1V1fbP5dNQ3ff1D04yBN8LLM4r2Tyw/J8RhPmO?=
 =?us-ascii?Q?B7bYhx7lJqH+yTZOujReS3Ew7Z94+q4ZPZPuc/uURnStELd9yFaBuP+upEtk?=
 =?us-ascii?Q?m3ecVFVpdcqUMkJQGKEZLfKKKFOJOAFiYHSw2LD9+wiIMeQPtSpjtMtn4ogq?=
 =?us-ascii?Q?4Gd1vJUsh4j9uCIzQCnwzpkbxnJ2X/njppyJ+NEnmhljjwwTdEEBiNXE/aIl?=
 =?us-ascii?Q?jBW8R26qy8/perEjhOyEYV1QoamNsaJVAO4urqqDxoHHfo41csAZNOP9KdKF?=
 =?us-ascii?Q?FKDuFNamTrrAQ2/YyquBHSIKzv9rlMvaQ/+Xmlu1yjCzld+5P9uQxbSRQM4K?=
 =?us-ascii?Q?/xKXKqHwKwvPpQCl9l7iX6OqfZjQJVnd8yRvDS4LCKp0mo5suP2hhrHBEgMr?=
 =?us-ascii?Q?cu6NtAwdebixf7uCPqm4J3dlhCX3xxx+6MrJjB8jr/Ty/7nQPX8JC8v5l03l?=
 =?us-ascii?Q?lkc8bMqSFVshzOIyWA6QMq1y9nnHW2bUOMIxoTnQ3j+Blz7mGpJAOt1oxNp9?=
 =?us-ascii?Q?tzeys3W6MmIBC/1+yniid4cn3SxG+lr9+X4J6Ikczhwb2xzTwmO0S5cyqM7I?=
 =?us-ascii?Q?mFgnjSHi3yV3StNeotQ9AU3yBm8RbFQRspDJAZWroZQyALG1lQn3ggfj/rPx?=
 =?us-ascii?Q?Uu/4ExbPj/yf0Net/+WMS17bMei7yxjj3/2gQ53a7T+E5afGswddZTtrZcbf?=
 =?us-ascii?Q?38CV+tKJKiWvEXIYZYvf5B/0PtGQ/zAwbrA1uOtGnRtqxY/+HjOyFAqoIVhW?=
 =?us-ascii?Q?xVZHThG/kBoC47WLhEBpjS/DJdzRKtj70ArgqcevZtk5pvMXmJRJM8d9J+EH?=
 =?us-ascii?Q?cxO6mDazGHCbipFgu4jqHWVQhof0/CKiAKBd3fXnu/rSqhzGmbUcQR/IsjNG?=
 =?us-ascii?Q?K2Qt7ywU+dPoWNqi6ayrag54Bcs91cS/rFv0Fo7cZlvYVu4aW1g5yXiiibjC?=
 =?us-ascii?Q?Krfb/3d1LfoI81Z+pOvdXUaKBvtVt/8L33B4ZPxOae5uXBaaWR/Jd1eShFiH?=
 =?us-ascii?Q?ksAGPZxWOsesBZ7bno94S/4Fb2LYRXz4K+SFqDD/mXyBmGqxnT7TFqtEQDU6?=
 =?us-ascii?Q?09DzPoycrl9sxx1ruGaXaar8W36m2tOQkGTLq5OARVL9ObIJgFqJvTbO1J/n?=
 =?us-ascii?Q?heS/1Zvd4b5H2DlUHGqOAhZL+VTp7tJvzlK0w9IjvqycKLDvHzZ1VOJ9SIAm?=
 =?us-ascii?Q?EJnGqepnMKFl8u7K3gvlHNhMPwa5kNZLqOQckRcyFPsemTS35uJeKTBGQkpt?=
 =?us-ascii?Q?7cNCelNhadFTJ+wqBOfuOZsgynjUhXM6XAshVTTJbVMW2HmK66RAAOu4RFC9?=
 =?us-ascii?Q?ky1+LVG3x/3luEKYZwMugeyPOozGVwnsVHVDWlcxD/rOiOQETfjMMCo5GR4D?=
 =?us-ascii?Q?7S65kqnhpK9Jyv1Y7tcsYarp35iHVzAXAB/Fx34LurtmOS1R3Zb1c3xh0hfY?=
 =?us-ascii?Q?axKIV2oB2wAGUAnXa47yI0Myx5FaGElmdR80JSYiyY/usXai23rVRBRJdy7C?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b351ea21-0b9c-4704-96db-08ddbeee965d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:43:29.2168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFKJZrU1AZ/kfEQ8aa2SV/qVfZGhQYpJV5AarGefGIrfnQi9P1cURgGrqn11P2NN4lJuFYLzxx46vsMtvzBjcj6khKYu9bU5O+ioq+iogCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
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

On Wed, Jul 09, 2025 at 11:07:07AM +0100, Tvrtko Ursulin wrote:
>
>On 09/07/2025 00:21, Lucas De Marchi wrote:
>>On Thu, Jul 03, 2025 at 09:20:58AM +0100, Tvrtko Ursulin wrote:
>>>Add XeLP workaround 16010904313.
>>>
>>>The description calls for it to be emitted as the indirect context buffer
>>>workaround for render and compute, and from the workaround batch buffer
>>>for the other engines. Therefore we plug into the previously added
>>>respective top level emission functions.
>>>
>>>The actual command streamer programming sequence differs from what is
>>>described in the PRM, in that it assumes the listed LRCA offset was
>>>supposed to actually refer to the location of the CTX_TIMESTAMP register
>>>instead of LRCA + 0x180c (which is in GPR space). Latter appears to make
>>>more sense under the assumption that multiple writes are helping with
>>>restoring the CTX_TIMESTAMP register content from the saved 
>>>context state.
>>
>>I'm requesting a clarification about that to hw/validation. Because this
>>doesn't match neither the i915 implementation nor the PRM.
>
>Yep it differs, as discussed before.
>
>Could you also ask about the programming note for INDIRECT_CTX and 
>INDIRECT_CTX_OFFSET from the public Tigerlake PRM (Alderlake is not 
>available), which says:
>
>"BlitterCS/VideoCS/VideoCS2/VideoEnhancementCS/PositionCS: This 
>register functionality is not supported and must not be programmed for 
>these command streamers."

if you look at CTX_BB_PER_CTX_PTR documentation it has a similar note
regarding BlitterCS, VideoCS, VideoEnhancementCS, ComputeCS. I will
double check which, if any, of those notes are accurate.

>
>I915 does use it, hence I copied it from there, but only now noticed 
>this. Maybe that is the reason Wa_16010904313 descriptions calls for 
>the wa_bb to be used on !rcs.

maybe it depends on the gt version... will check.

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
