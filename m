Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A625D46C01
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 22:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37FE10E038;
	Wed, 28 Jan 2026 22:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGqXmHWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641D610E038
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 22:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769640859; x=1801176859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+PlcIDnjO1QDVXVUGmT5GJYBZgpblzhecMkPv7a/T3g=;
 b=CGqXmHWFG/cXkqUP5Pp9mg46mA4nnzxfbdLZMGSeYe0cKvCRw3CCTdP2
 NaH/Q+K4Fji8ghZz8V5y3K8H8nxhWc31AcSLmZLe9DjJIsTG3Xyjdj/8p
 PvqcWytbkNoi6Drtxx7C5Bpe8YnxwWdih5+aO9/ugf3/npWlWnI6DcLjT
 d60zJnDSQ5EWTl99Liz3B94L48FsFOV/114vBbOWI6BJJuhUBfCFBcZKd
 R0zW/Ot2QnI8Sr+PJBBIyCHjFtoNCzHOTSt/AcI2hl2YuYbaYwqlITcFd
 2t/kJITXYK41mSheMdvbhZIu5axSGC/1o1WfNsB8nx2xX0ZK75tz6Saor A==;
X-CSE-ConnectionGUID: PZfHeTetS5qWajeIvC9F6w==
X-CSE-MsgGUID: Iy232puORG+3T3dIUA2FIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70770606"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70770606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:54:18 -0800
X-CSE-ConnectionGUID: o7+nuhTOSTejXNBt43UAYw==
X-CSE-MsgGUID: M9I+a/x8RxepB1hrOaN0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="239132227"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:54:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 14:54:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 14:54:11 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 14:54:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBwa8UD6fjhSLxs71H02mAKL+5e4DpHQkqOflULvHkWXjxgtqNDflCTo+k7YWbiMKE4aNj8D9HYGMiGAq9V1nsybwDJJBDDWKVigU/npo/C5NztbTfhaCVHPcjA4mS+Q2CTVJET9I+o7Mb2g0x5Lp5Eni5SIbHreKAi6Q+WPxF+ZxzmdUuB2oaQKuwKN9lNHYCKYP2M5N8bMWxB2lpo6sMiP1SfSX9zr/0Q1UXAu8EPI5izHle0BAVLxhyftthsfG67HAjySB6BH7NAoW07VrBLDkye9cy/MNQlgF6Ii642xjPRMRS/VdBHa8opOF0Lytq327/lyU8rmmK2qeQPq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTavKMAb1fMZStCZbSrrQl1TAuLB3Z96usQaJhVUG8s=;
 b=A+97wLi4zHJxgEXGxN3NS1WKNM6j6b4nNLNwBrUXYDPsOL1HkBYUGw+3RMNUfgep3qs7y5dEJjak/xstMn3I0LJO9Zr967LHEiLHiMbJT5NAHkm/zqHCE2eCrMzACGC7G/VceGwQLDoueV6iGNgf50d4Fp88kXWjftsnZRHw/gl3qFfilcXUW54rn7X+GexfOSommgiJObVtx5SsvkytST3kjxWrVB5jNir4QGuyV6SnWQZpG2+mBsQDgm+CfI9BGDZDC7hiT6Rt6ltn+EdnvGTvxzh4OXFiErMgQaWRKsKm7wK6iLFan6oF0HHNsJsd/mCKHOFohXN1VTyYVrekaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 22:54:08 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 22:54:08 +0000
Date: Wed, 28 Jan 2026 14:54:05 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Message-ID: <aXqTjcGrosLmqD7o@intel.com>
References: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
 <20260127205004.GA2174980@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260127205004.GA2174980@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:303:6a::17) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH8PR11MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d9fe7b-7f81-4f1d-1543-08de5ec02508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0hEbVE3d2FWYUJkS3A4bkpSclBmZkcyV3pIOUg2V21jNi8wVGo4Y0JXMFNS?=
 =?utf-8?B?TUNodXR6Q294M0RWTDd0bUVHUUZDTGp5Z0N2dmtBNEZPTk8yNjQ5MG5lRWRi?=
 =?utf-8?B?WGxaS25qTzdOcnlmVXgzMVA4L2laV1R5LzZVRmJBQk5ueEx4V3JveWFST1A5?=
 =?utf-8?B?UitJNGVma294L3hDcFQ2TzhVclRJMFhOcnFNb1gzWlhoSi9GT0JLTk1vRG5I?=
 =?utf-8?B?WnpuRHNtV21tNTdra2xNVW9SM29yOTJTaXFOWHF2Vko0YmpLQnVGelNGYzJo?=
 =?utf-8?B?b0ZVNUx0QjBKRkhIcHNpeE8rN2hzaGdOMVlHcmxFeXBwL0ZrQmlpeTVjNGlY?=
 =?utf-8?B?RVgwVEVWWlhGdWdqOXcySGZlWkVMZ1RSVlNPREcwMWEyR3RmMHVDRlFTb0lo?=
 =?utf-8?B?TW0wZmZ2eEdjbGRCNTBQMmh6dXNvTGZ4eCtOeTRlUnZScDhWTlF4a0FrdVdG?=
 =?utf-8?B?Q080SGxFNUpJQzJHM3FQcUtNYzlkMWg1OEIxWDZZSjF3bkMwS2hsYzBPTEdP?=
 =?utf-8?B?T2ZRaFd1dGRpSlhseGRkUFJvbWFoQTlsdzlnUXRpNDUya2NCNXVFdEdJUmQr?=
 =?utf-8?B?Wnd3R2lseDI5SWZQa3dFZ2xFK2ROejRRL3orU0gzdC9ESFh3YXNFWldScjBB?=
 =?utf-8?B?czBIQ0kvbjdtcmIxRG9hZkptdnNFa21sWjg2V05sU29rdzhSWmtCa3RyeWVl?=
 =?utf-8?B?b3dMNkErUmNMMnVyemhkUFJxWXVXTXAyTm5lQ0FBQ3lZV3JzRlY4OU9qUEVM?=
 =?utf-8?B?RVpiajJ2alFmTVM5bGhpMXhBeGYrcGxtQTRGWmdrdU9Sc0k0ZUVYMnlpTWJn?=
 =?utf-8?B?Q1J6UkRGelAxZ1UrekpIZ3pEdENKS1ppZE5yeEZpSDJRZzRkdk96MVdUV0dt?=
 =?utf-8?B?aGJ0SjFPWENYalgwalZKRTI1TitHTGlLNjFzcnVjcHpDV1ZkclhqVW9PdzRP?=
 =?utf-8?B?cmVZb29SQXlGWXAvNG1aNEsrVUlyVUdST1Y3cjdjRUFGMjZQM3hRWC9RdVVF?=
 =?utf-8?B?UjE1RFR4VEN1OFBmUUl1R0kzS0FKYmJJZWxTRDB3d09iaXlyRC9vUlF0dkNG?=
 =?utf-8?B?UlVPQXBvWEkxVVFkM1dZb29BWVRMTGpNQThOcVJkWjExTkUvRzZLR0RVendL?=
 =?utf-8?B?OXI0VGFmVktabC9LMFBtS2pzMU51bFVnUnlMQmhOcGlaQlNjRUIxT2k5K0Ey?=
 =?utf-8?B?c2tpQUwvVGxpK1RQc0pRZDFoVkpBbWc4MDcrM01nQlpscFFXcFRyQzEzQ29Q?=
 =?utf-8?B?N3Z4TjU5MUkvOWVDRk50eEdPdERydUN0MWJ1RXdBc2RQcGh1ZWkzaHNTakdr?=
 =?utf-8?B?ZmpJMDR1REIyWWdEVUZmdkNGcEFHRGNGZVdQRlVKdEV3T3RGemJXM1M5Uk5I?=
 =?utf-8?B?MG10SlRSUXh3amVwOUFYWEY1dHNNMFVoRjNsVjY1SHIrQkYvUURPb1grOUpC?=
 =?utf-8?B?S0xLTFFzYzlOYnhyMnpoa2tFTGJTeFMyVnVTcmNEb2laazVwT2xtUmxHZE9r?=
 =?utf-8?B?Nmp1a3N5Uk12NFNMWEVscEhyNjBLaEE5RXlKK2MvVHh2ZVQ4L1dOOXErTDNx?=
 =?utf-8?B?ZDEzM1FtODhFbDdWSzJVbHEyWHlEam1YZ1U2MDczdi9tS2FQaEttUktmU3pK?=
 =?utf-8?B?bGFxVXVRZFBqeUdnclZXTGJ1c3psOUFCd2JVOUs1Zmh4QXhsdnlOT0YrNzlj?=
 =?utf-8?B?aGtoRHZ0blJQYUREdENBUGRKdTlTeExycEZiTFR6QzlwZ3RBa09MUEhGclRE?=
 =?utf-8?B?LzdsSjc5YWpPOGJRN3hjV01lZ0haYmdaendiOWdkSzR5ejEzbEFqZ2tKUVdy?=
 =?utf-8?B?ZlZwRWtjZ05JcEFaei9KSkM0cmgzUTdlcU01VjZsMHBYeGFvRzJtWEd5R25m?=
 =?utf-8?B?Ui9WbXFZbWUyUno5aG9PQU0zclMrajFaQ2tqWWVadVM2VmJ0Z28rcGdrZWZ1?=
 =?utf-8?B?ZTB3NEYxbzVFa0pDN3RBNjh2SFN1aVQ3TzdJYVRwa0dsUWZwZDdnNlJBSjVl?=
 =?utf-8?B?SHlYaExVUWNlSm1JZkJUbGZrQTRCSUlOL1M1Y0RxdThTUXJ1Z24wbUdPdjls?=
 =?utf-8?Q?+f8MJm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGowNi94N2h5QVNHeXdUNEZpbnRzRmxXVmJ3dURvTnY4eDAwR2w1bnFIWlVK?=
 =?utf-8?B?RVFtNER5UGM3bENiS3hvTWlJV29EeFFNeDNlMEVLR1NydU5SUW0vc0k1OGU0?=
 =?utf-8?B?RklHSUVTakJlUmlHUHJTMXdmcit5cTRkamo2Z0p1QVRxS2VSNDY0Y3VGcXdw?=
 =?utf-8?B?cFoxS3JNV2txeXgxU2dWanIwU1dxeUdVamxZTzRWQWx2NTBsU2tURThKZmRG?=
 =?utf-8?B?TFQ5YUtGZHdycE9kVUN5c3JwOXVPNTFKblFwbVVzczdvMU1Ba3J4VWFrREtL?=
 =?utf-8?B?TkU1UXBpODR1QWNLRWhjeGVjYitUTW04aERBQkJVcHFjT0FGbExQMEZXaFVC?=
 =?utf-8?B?OEcvdzVtM2ZqRkExQWU0Y3k0aStQaWZUOWo4dEhtM2hxMnZSZjViaFF2M1hn?=
 =?utf-8?B?QUhQNlBBeTlYODNDSW82L0F1ZmRiZ0FQei95c2d1cXU4UVlpL3prdW90KzhC?=
 =?utf-8?B?a1J3NUFLOEg5amZPK0h4NTZXZEk1emZ2c1JFRzVybDg0MEovSHVCMlZnSlJx?=
 =?utf-8?B?cHNhTGYzRGlsYlNPdEsxUFEvckwrNEQ5WEtJVHpyMm43K2hIQi91V2FNMHpF?=
 =?utf-8?B?Qjl3cEdHY2greDZFOVJaVkRoZTB3YlFRNGQzVlM5RS9YY3RMdThKNWJhd05x?=
 =?utf-8?B?aHAzM0pHcER2OElQU1lqaVVnTENGa3dJSjJtdTlDUEtveElINWptMzNsS3dj?=
 =?utf-8?B?OTZnb3p5bi9QbDdDWWN3eFN2K1ExZ0VONmJDQWFLNVlxeVFtbkNPTXV5SG04?=
 =?utf-8?B?dmphZ3VnREh1R3I3djZVZXpZMmZaQXdJdmx4U2JRcmt2ZjRCU1VuV2xzZ3RR?=
 =?utf-8?B?Tm96U3oyS2lMZEZnL09vOGdYcnVBeGJ3SkJFVTUzcisxTjBONTR6WlJLbllz?=
 =?utf-8?B?SDh1czczVVBVbkpvQ1NLSUFuUGlyT3E0OWVIVXJwOE1nQ3BGbFIxelI1dzQy?=
 =?utf-8?B?ZGpwYUx6NGg2anc4TE1acHFBaUFkSjBhQk4yYmQ3NFl1cVJhSzdXd1NyT0hl?=
 =?utf-8?B?ekJBVnFYTzRSOU96Q2JYdUs3bUx3bE9Oc1JqSFhrUUdrUHNJMWtMSWlZYjEv?=
 =?utf-8?B?Z1ZIVkJ4UG9TeHNqTTNzYTFlbEpLTW12NDJ2SFZPY3UxSU84dFRvUGpSL2Fx?=
 =?utf-8?B?MlF2ZnROWHlOSjJWQ0dzQmxReDh4RFE2djZSUnFBOHl4a29wUEZhdUgwaDNm?=
 =?utf-8?B?cE9GUTNTM05VZkQrVmV0OG02VUdnWXN6TW9QbTlSVVJDR3lBc1NLUVZoakpt?=
 =?utf-8?B?TUJzWng2OHJ0RU9ScUlqQ3NYelZZVTdEYlVnOTl3UTRnTEtOWC9tMlg0d3hU?=
 =?utf-8?B?TGlMb3F0Q29KWFFxUk9ZZTNEVUh4bEVoTFlBa0pSK2N3YTE3Q0NqZ3dZaGw5?=
 =?utf-8?B?aGhMN1p4ckJIZHNvdm5tVTA3WVlmWEh2eWcyMWRKZklZcHVMSmlMbTNZK2J6?=
 =?utf-8?B?RC92WlJKUWRwVTh0eHZvdE15eGk5R3pwVXFTQ2NkSGNteXNSdjc0VFlURTFn?=
 =?utf-8?B?Tkx3bVhWdU9aQlVQQzUvZ1pWMVA2YjFqVERVcVlCQUhsb2p0UTlEcjRGVGsv?=
 =?utf-8?B?THlmUE9yNkJBMHpkWGZBM3FQaVJza3FJMVRGaENuWE9hZmgxQVNqS1lwL0h2?=
 =?utf-8?B?OFN5M0JSMEwvUm1nY2dCN1czc0tkWjR4MlZtb1lQVllmbEpMWDMxK29xSTRn?=
 =?utf-8?B?RFUyd2h2U1ZKRnlYSldUWm9WdzMzSjY3bStpZ1JmQWdkRldBemZYQ2J1dml1?=
 =?utf-8?B?UFNrTmxaR08vTzRrUUhwOThCVysrUnZydlhrenplbkxWODhCdDJETkMvd2w0?=
 =?utf-8?B?ak9XMzB1bmdHM0NBcnBNN1JtWXJ3QS9HeUsxM1hjcy9sNWwwbGtBOFY3UlJn?=
 =?utf-8?B?cVJsWVljdVJCSDI3cTB1d0VBOEF5SGJZc1lSQmFQak5FejFMd3VvY3RWS1JF?=
 =?utf-8?B?ZUJqU29SRkNDTlE5SGhDS3FVODNjYXRJS1R0WVltMm9sZXA5OEZkOGdhUkEw?=
 =?utf-8?B?T0JGRXBVbTV6RWdock5CQm1kd3M4VzgvZWxUdFNvYmtLeWF2TnpRTW04VFhs?=
 =?utf-8?B?RzdIaXJ0VDBhRnl5YXdwTjRya05WZ0FnUXJmTUFNYUxnaTF2eDBOa1o1ZGVW?=
 =?utf-8?B?TjgrOWFHNnhUTnhUbngvQzhVczNpbGxwSGRJSkcyOFBISzhiMnRKYmh0T2Vr?=
 =?utf-8?B?N2d6UUk5ZFBYTU1iYXBzWkZybDIzUU9YYm5pQ01zaDBBYWNCbS9Pc1ZkV3Rm?=
 =?utf-8?B?UzN4TXd1VVV2eWM0RmdwVjl1MnZPMXJOVmhiaGp2a3QrT1ZTTWtKRGZLa2d3?=
 =?utf-8?B?OWQ4dFlEK0l4aHA0M1pnL3hFU3RjKzRuNTQxTmVhNHhiVHFNZVN4NnMvaU9j?=
 =?utf-8?Q?xbvQIE7dKeLEmHvg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d9fe7b-7f81-4f1d-1543-08de5ec02508
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 22:54:08.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdHm+bYZ9evZZbRnXG72St8szc4OAWa/es424uiqHOyubOGtipE92+kW9pTXzKKZ4tQAj/zlomIEMb7LVyj4ZuCgu0b7UvCSYPVIOrZwQn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
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

On Tue, Jan 27, 2026 at 12:50:04PM -0800, Matt Roper wrote:
> On Mon, Jan 26, 2026 at 11:49:50PM -0800, Harish Chegondi wrote:
> > Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.
> > 
> > Bspec: 56024
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index a991ee2b8781..1153a7363cff 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -535,6 +535,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> >  	},
> > +	{ XE_RTP_NAME("18041344222"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > +		       FUNC(xe_rtp_match_first_render_or_compute),
> > +		       FUNC(xe_rtp_match_not_sriov_vf),
> 
> We don't need this; nothing on the engine_was[] list applied to SRIOV
> VFs so we never apply any of them.  This RTP match function is intended
> for OOB functions (and possibly LRC workarounds).

I added this to xe2hpg too earlier after I noticed some SRIOV test
failures on CI: https://patchwork.freedesktop.org/series/153187/
I can no longer access those test failures that failed back then. 
Maybe I can remove the line for xe2_hpg and have the tests run again
on CI. The line was added to the xe3_lpg WA too.

I will verify once again.

Thank You
Harish.
> 
> 
> Matt
> 
> > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> > +	},
> >  
> >  	/* Xe2_HPG */
> >  
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
