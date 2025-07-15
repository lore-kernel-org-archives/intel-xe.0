Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1560FC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 22:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D8810E134;
	Tue, 15 Jul 2025 22:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtsZ+G61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0843E10E08D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 22:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752619612; x=1784155612;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Nf1AUFYnWRnM3zH641JDqxZ2p9ugQSNwSuEnAYtr+Nc=;
 b=LtsZ+G61GjENRgCxkFRYqMP0HDbBC4IaKWymH4t0PrxY7CqWHZ+Qf4DN
 Q1ASDxSYBti0nFLnYPa67viEfiszjl/c+Mww2AKBg91+5UQsV+yNEYxFt
 C+hxblL7L3Tu/i5V0+JO1Q+o3ocDjsz2Uc82aljW5KEBPGdlH7NgvhevB
 L7Qst9pbtWQgg98qxjh/tQmsHOLPAHeVXM7uOEgaMwa/+KJSFkcvEHNFd
 kRWWk3ivxx5XPZ6yLAgiupUYu6jYcOxnJmHiIjX3k486P1hSIJstSxyl6
 66uiC5fh2n9BLlorEpOsMY8u0DFZ//xaJ4zXVMoR5EoCZRSI9T5crw2H/ Q==;
X-CSE-ConnectionGUID: JE/jXTFLSjO7TXZt99l7eg==
X-CSE-MsgGUID: iSlCrF6iRFO21Fv9q/V0mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54946121"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54946121"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:46:47 -0700
X-CSE-ConnectionGUID: 8MOlTV5JSSWDkPyDot79Yw==
X-CSE-MsgGUID: UPhKYBO9RpiFcf9eykKfmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156747028"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:46:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 15:46:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 15:46:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 15:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOVjV1wJlg7PjhCky97fUfX1z6VAZ4vnCGdRNOocjdq632hyK905NsW8wxZMXolWbtXJypYX8Fs4LbFsunyIUEUlyZlBeskYRVopnjkHGyZfSyIK5T2phxPhQ/Y+BQFjDo0i/fYxSnNRch/4euwo3LZdpignQhlDZDn2oYuKESlb6b8QrWumXvuIHZLATaExHYY60CL94VqlxsQ1ij9sOfvApY0csTv2sFO4ZqVoZohctrq1xSO4sdEItWPxsuf7tqWTjeShZqp6BLDL1LDrTzhlQbbx8Q7UcewQwK0DXTFp4lAWVJGMYadecTzOVJVAVY2PvzuhvxbXfGD3ipwTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nftUDCG2O4QBj1YkeKzcRtLMdzZx4pRABubpu9a6Vlw=;
 b=hlF/mpjZ08eDNj7/zXCt9ZZavEtMEqqsTLmzny6rRBDv+dDMikjGhuxswzsGtVGzCsKbGsi6dvzJ9QwRhu/QKbJqoNtsO3iU+zgoBgP7nSqJ4JuITTNO7ZPLke5rUg3VL2kdkTTWhAhevwM3apJs5LI/CPQQc55WKjJe8A4N+t65bh5WhNyjWbAOQBCgqWhCkVNJ8PFNBJAT8gOnUxNKR1HMsM2ynhcq8mx4xKldVsxZehfDHo4UqRjNWHRouw5O9nrwvrremEysaFqm32u46O4Ln2Tk2jya2WD3bKDAngHH73zCky41YJnqbq2AjGqgx1huM5R9gmMrGiwE5if76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV3PR11MB8604.namprd11.prod.outlook.com (2603:10b6:408:1ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 15 Jul
 2025 22:46:37 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 22:46:37 +0000
Date: Tue, 15 Jul 2025 15:48:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/9] drm/xe: Add generic dependecy jobs / scheduler
Message-ID: <aHbatTycmnKPkQd9@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-3-matthew.brost@intel.com>
 <82e3ac7e3adb20156a3fc48568da2d49f0d9cbbe.camel@intel.com>
 <aHbEsL4K5usU+Xy/@lstrano-desk.jf.intel.com>
 <c6c9e45c6c205d5e631987761522b234d8bbfab3.camel@intel.com>
 <3b269d94a6fb2917b898bfa4dc714393e06c1b1a.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b269d94a6fb2917b898bfa4dc714393e06c1b1a.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV3PR11MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: a4414ade-3e47-4a21-ca27-08ddc3f174ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DbcQF+anMSWnp68TMAExunW4l4nJkiaFQuA3esqj/HxwAz2Ocsb96RcLCX?=
 =?iso-8859-1?Q?VsdrynTK3R/V6HzASuc/XxWsU4zmjklO08dkROBI0LKbDNZv3m4hz5YZys?=
 =?iso-8859-1?Q?xnp5k1j9wo9iFVi0CgCjME0aH+0MzYflayXdeGfZTzjsxOKC5zSzYGJ5u0?=
 =?iso-8859-1?Q?KTldQ9e8Xq1P0Nj8jxo/KW3n+V7iaHTb3ri9ZyqEP6yIR0aKW+eX0N6M9U?=
 =?iso-8859-1?Q?QajW4M1Gy89vcKC469ZXzB9AQDcR3QLEEvaWjLuzzsHCc50/5CvmDWMFj3?=
 =?iso-8859-1?Q?tCtr3B/9Bo5NAQtzbPV2WcppVUAWZNWuLRtTErzYrOgYz0+8xfI387h8Rn?=
 =?iso-8859-1?Q?GjlzryOE7qaeudYQl98aPXm3SocEPHxL9bzWGB16tRJilnRG8vY52auT2v?=
 =?iso-8859-1?Q?6qc/MyvIRJsCbJnw/3Q7rAd4svLBhAC79rRxjpChIQfrdw+V4o0g638maH?=
 =?iso-8859-1?Q?Q7E9ngetezSn9Y8zJNBys4VJmF8F/YdDNgRbRf8YGb72IpWprni6I2gljl?=
 =?iso-8859-1?Q?GNtXmQpcnVutgREUP0jMkbXLjI9f2FqA5mC316yOd3jjuIzZepKjgkZyec?=
 =?iso-8859-1?Q?d6lFaFnzU6xH8MPD+paGWgd0SjNTE4z9evPK5ofdSbUlM2Zm4hgy4lgTUd?=
 =?iso-8859-1?Q?Yf5bo65AkNb9lqt9wqJaO6kwuAPvhGPKqpsqLb9V9SZKscyubXpOZvqF7F?=
 =?iso-8859-1?Q?583c5HGit/GIxd11QiNSILcw06NGqwSlubcPBnxeQ/8cIRw37lLX7PVYZi?=
 =?iso-8859-1?Q?ogJ2AFWKwXU0w0d2y+WI1npanKQX4M00RHB8KUUFBnl6M83UAAgJkAdFdm?=
 =?iso-8859-1?Q?JKQniBIAmh4giJNn4JdZPv8HI3qwSBi5K7zDBTy5drLbihdslulp0Sj4uU?=
 =?iso-8859-1?Q?w60Csh3Js5hHOLvqP5vFQH2njRHTtXZ0rqeHkP1hI4Lz2YPfxiDXWviLnv?=
 =?iso-8859-1?Q?eS5IujcpvaN6oW3GHK8k3PGTKs0xBiZio1EJXfe0+dpeBu7Tf0HIVQDXnd?=
 =?iso-8859-1?Q?bNxgP1VwidvFRkIkBikhkY3hVsVNFtt8uMo9gv7UhzYdXxVqsZqBSoJbSn?=
 =?iso-8859-1?Q?zossD+xBuZMP3BBy7NvlirWkC6CYD8fPkUbShFGfw56KYQ3DOqLekFyjhe?=
 =?iso-8859-1?Q?2cTiV6bGX0rlvur+ByTdWqCFm8EW7noU0UCEOx14Tp88q4QKUBbKmMb8wz?=
 =?iso-8859-1?Q?fuEPsbrvwlgT+kXAqCUy/ukkcigMFtBbWBLLEDqz27pgfP4bXxiWUU5gsx?=
 =?iso-8859-1?Q?aJbt0eYKZYSWTLfbQmtjHEN1KW+w0bKQ+WnpcYNb4j9IQ0HMDi3QpdlsnS?=
 =?iso-8859-1?Q?tgc/jmi9617DCbkNEr9y3jLkvNnRrwodnV2s0l/gbzFwJKc1qbdBj1g/ty?=
 =?iso-8859-1?Q?bsM0q/3ATMt/SZu9UaGwyx24qZLTAZ6ATl88gLKGowK8Je5IZdSy2D6a2p?=
 =?iso-8859-1?Q?WK4/Yh1LVRaIJcnIJm0U6ZsEwYF1FYNy+r8kV4IpyMgxOaN6LCJzCDkrQS?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xfX8ynPIkE2tF0kZhZg3ic6tY0Cb52wL/We9vgVftUQThpuevMLZ/TNMej?=
 =?iso-8859-1?Q?ctTwNbFWP2F4Ui26lSqEbej0ZOf/oL1pHO5bXqplAPkYCkB9DHaVhWDLcs?=
 =?iso-8859-1?Q?a3LS1q0so4c+uMwWtvfvXZKFOpOs58O157GgGW1lf+WCLvrARtbZKsXFg8?=
 =?iso-8859-1?Q?fpTm4oSXQkhd/DQzTOwWp+Ek8cTMc+BGw9EdSabIun5utmorCNo4tUVaIC?=
 =?iso-8859-1?Q?O1JDFXbGNfW0OKiRDuBt1vH1fovYpZ6CcpimZrueFmsO2UDEqg/9lVx5XX?=
 =?iso-8859-1?Q?fA8gBkOTqqLNSg2/MtZTOFvtigBKd3Sgrl0Ev3s+rrhG+qPo/3Tt5+8XN5?=
 =?iso-8859-1?Q?x8xrtgNe+YQhziXkEYASvviytgnRt4kJS3fN70d8iguG1OZwPq56vKBBtU?=
 =?iso-8859-1?Q?pZDU/8wfe4bF15G+8bREGE4wThKMcuSLFjXVHHHPeRxm/Z8tVNOyEZZdTR?=
 =?iso-8859-1?Q?yaxwc+Mv2Mjy6FxuzJEjT9YH/C9rOQdCs3+scmHjICkKPtodHD6eCei0UP?=
 =?iso-8859-1?Q?KvLUAf7cJngXQ0WkuTi6xzPc4c9VFq4xjHlVvWJ9/VlNPNmnHBqMXJNqSd?=
 =?iso-8859-1?Q?wVRoqephI7mcXTxdHE+TTpHS9hkWprFnc69nV+pchrldI66XjEtbk1fjfv?=
 =?iso-8859-1?Q?P3Ig1wmZpMOc9c2GnOzzGXUHIUTA9USDCfHySvvKjlwdXVBD+God4K9nuR?=
 =?iso-8859-1?Q?kjR2eqXtmc/iFMadiTPEaTdULFIXWxFym27vSy5N5wrmWMEaXJcvelr8mr?=
 =?iso-8859-1?Q?SHk2JpA1FGZ4LIbuAxGgyGtamPdKL+9T/5UCDiawVe1/omSTZc55YtlZaR?=
 =?iso-8859-1?Q?yJ97tfvDSi5/Qxr2trHCBL6zBdC/4r5GegAQRNfb+bi0h03VuGtyJPUlOr?=
 =?iso-8859-1?Q?hzCiMRUw8Gh7m9b26T0ARXr1G5mEP0E4LRcj/uFFSJfvVpGNSMjWg5upzn?=
 =?iso-8859-1?Q?lwB5qd7SvYXpi/AfZodpBCuMVLMO2naPt6uvOctsP3u4ZNSoHm4YXbn77f?=
 =?iso-8859-1?Q?NAE65+XkR/TyWR8kadv7yEgoqicoaTIysKdAWSO2kbSdQsmR3gfwhZqoFB?=
 =?iso-8859-1?Q?dSzWvahVFqi+c+xq81A3sga6DWy9xdvk4qXG5RbxQ078LSZ89gbJvjYYC7?=
 =?iso-8859-1?Q?F+JfczXotcEx7osbQUiq5iVg/2HlJ5ncSjYMu/MehKhwJ3BDDbvnxsLLpa?=
 =?iso-8859-1?Q?MXMmJTKuDtiQH8DeIJo4RK7a3AFm23hgEEPsT+23QpTF7JtJr6WGtg313i?=
 =?iso-8859-1?Q?f9ADx0WwVpUllMOHOh7MV8iuROcZH/+sdBTtlmbI5CKHmtATu9q+yBOJAY?=
 =?iso-8859-1?Q?Wv8tCDOb8A0esEt5Wa6YZmANp6x4LHzxRMrbSbl6UZKtVPWKsKZ9Md5mhp?=
 =?iso-8859-1?Q?mYI0QKBSjLD/Zaqq86RdaFAfCocRcp3Mr3xEGc6x7R3p9WfmMfbJSp5jLU?=
 =?iso-8859-1?Q?Fh/r/MI9g51H9ebf9mz5xW6dK3roSZxn5eOsZ7BWmMbC3ljj0pPfL5c62P?=
 =?iso-8859-1?Q?k9Aamva5d1PJM1HOAKoWv1fAsvZqneRmG+tnG959bP/m3beyED38qZ9vVt?=
 =?iso-8859-1?Q?stIGPkTyVlfUZq9Q3yiu7oA9rIUdPMghi1o7vrnCPo4ZKCrni6yJ4a2l4X?=
 =?iso-8859-1?Q?oC6AHeQruf++LEXHTZcp/slZFiY3PRq7dGmnGW01NR1HuOaK+WP/qexg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4414ade-3e47-4a21-ca27-08ddc3f174ad
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 22:46:37.1917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgvX329WcFWx5YjzpaRObL52vFXDLpG2rNe7izbYBcQRe9cvUMNyIKnyMThvHjYnMw3g2SfpV6G5x6G8UiIM8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8604
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

On Tue, Jul 15, 2025 at 04:43:54PM -0600, Summers, Stuart wrote:
> On Tue, 2025-07-15 at 21:13 +0000, Summers, Stuart wrote:
> > On Tue, 2025-07-15 at 14:14 -0700, Matthew Brost wrote:
> > > On Tue, Jul 15, 2025 at 03:04:07PM -0600, Summers, Stuart wrote:
> > > > On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > > > > Add generic dependecy jobs / scheduler which serves as wrapper
> > > > > for
> > > > > DRM
> > > > > scheduler. Useful when we want delay a generic operation until
> > > > > a
> > > > > dma-fence signals.
> > > > > 
> > > > > Existing use cases could be destroying of resources based
> > > > > fences
> > > > > /
> > > > > dma-resv, the preempt rebind worker, and pipelined GT TLB
> > > > > invalidations.
> > > > > 
> > > > > Written in such a way it could be moved to DRM subsystem if
> > > > > needed.
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > > > >  drivers/gpu/drm/xe/xe_dep_job_types.h |  29 ++++++
> > > > >  drivers/gpu/drm/xe/xe_dep_scheduler.c | 145
> > > > > ++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_dep_scheduler.h |  21 ++++
> > > > >  4 files changed, 196 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > > b/drivers/gpu/drm/xe/Makefile
> > > > > index 1d97e5b63f4e..0edcfc770c0d 100644
> > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
> > > > > $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > > > >  xe-y += xe_bb.o \
> > > > >         xe_bo.o \
> > > > >         xe_bo_evict.o \
> > > > > +       xe_dep_scheduler.o \
> > > > >         xe_devcoredump.o \
> > > > >         xe_device.o \
> > > > >         xe_device_sysfs.o \
> > > > > diff --git a/drivers/gpu/drm/xe/xe_dep_job_types.h
> > > > > b/drivers/gpu/drm/xe/xe_dep_job_types.h
> > > > > new file mode 100644
> > > > > index 000000000000..c6a484f24c8c
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_dep_job_types.h
> > > > > @@ -0,0 +1,29 @@
> > > > > +/* SPDX-License-Identifier: MIT */
> > > > > +/*
> > > > > + * Copyright © 2025 Intel Corporation
> > > > > + */
> > > > > +
> > > > > +#ifndef _XE_DEP_JOB_TYPES_H_
> > > > > +#define _XE_DEP_JOB_TYPES_H_
> > > > > +
> > > > > +#include <drm/gpu_scheduler.h>
> > > > > +
> > > > > +struct xe_dep_job;
> > > > > +
> > > > > +/** struct xe_dep_job_ops - Generic Xe dependency job
> > > > > operations
> > > > > */
> > > > > +struct xe_dep_job_ops {
> > > > > +       /** @run_job: Run generic Xe dependency job */
> > > > > +       struct dma_fence *(*run_job)(struct xe_dep_job *job);
> > > > > +       /** @free_job: Free generic Xe dependency job */
> > > > > +       void (*free_job)(struct xe_dep_job *job);
> > > > > +};
> > > > > +
> > > > > +/** struct xe_dep_job - Generic dependency Xe job */
> > > > > +struct xe_dep_job {
> > > > > +       /** @drm: base DRM scheduler job */
> > > > > +       struct drm_sched_job drm;
> 
> Not necessary for this patch, you can keep as-is, but this naming was a
> little confusing to me. IMO it'd be a little more clear as drm_job or
> even just job. drm alone to me implies drm_device struct.
> 

I followed xe_sched_job namming here. I guess it could be better...

'base' or 'drm_job' would be better everywhere. Can do that is a follow up.

Matt

> Thanks,
> Stuart
> 
> > > > > +       /** @ops: dependency job operations */
> > > > > +       const struct xe_dep_job_ops *ops;
> > > > > +};
> > > > > +
> > > > > +#endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > > > b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > > > new file mode 100644
> > > > > index 000000000000..fbd55577d787
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > > > @@ -0,0 +1,145 @@
> > > > > +// SPDX-License-Identifier: MIT
> > > > > +/*
> > > > > + * Copyright © 2025 Intel Corporation
> > > > > + */
> > > > > +
> > > > > +#include <linux/slab.h>
> > > > > +
> > > > > +#include <drm/gpu_scheduler.h>
> > > > > +
> > > > > +#include "xe_dep_job_types.h"
> > > > > +#include "xe_dep_scheduler.h"
> > > > > +#include "xe_device_types.h"
> > > > > +
> > > > > +/**
> > > > > + * DOC: Xe Dependency Scheduler
> > > > > + *
> > > > > + * The Xe dependency scheduler is a simple wrapper built
> > > > > around
> > > > > the
> > > > > DRM
> > > > > + * scheduler to execute jobs once their dependencies are
> > > > > resolved
> > > > > (i.e., all
> > > > > + * input fences specified as dependencies are signaled). The
> > > > > jobs
> > > > > that are
> > > > > + * executed contain virtual functions to run (execute) and
> > > > > free
> > > > > the
> > > > > job,
> > > > > + * allowing a single dependency scheduler to handle jobs
> > > > > performing
> > > > > different
> > > > > + * operations.
> > > > > + *
> > > > > + * Example use cases include deferred resource freeing, TLB
> > > > > invalidations after
> > > > > + * bind jobs, etc.
> > > > > + */
> > > > > +
> > > > > +/** struct xe_dep_scheduler - Generic Xe dependency scheduler
> > > > > */
> > > > > +struct xe_dep_scheduler {
> > > > > +       /** @sched: DRM GPU scheduler */
> > > > > +       struct drm_gpu_scheduler sched;
> > > > > +       /** @entity: DRM scheduler entity  */
> > > > > +       struct drm_sched_entity entity;
> > > > > +       /** @rcu: For safe freeing of exported dma fences */
> > > > > +       struct rcu_head rcu;
> > > > > +};
> > > > > +
> > > > > +static struct dma_fence *xe_dep_scheduler_run_job(struct
> > > > > drm_sched_job *drm_job)
> > > > > +{
> > > > > +       struct xe_dep_job *dep_job =
> > > > > +               container_of(drm_job, typeof(*dep_job), drm);
> > > > > +
> > > > > +       return dep_job->ops->run_job(dep_job);
> > > > > +}
> > > > > +
> > > > > +static void xe_dep_scheduler_free_job(struct drm_sched_job
> > > > > *drm_job)
> > > > > +{
> > > > > +       struct xe_dep_job *dep_job =
> > > > > +               container_of(drm_job, typeof(*dep_job), drm);
> > > > > +
> > > > > +       dep_job->ops->free_job(dep_job);
> > > > > +}
> > > > > +
> > > > > +static const struct drm_sched_backend_ops sched_ops = {
> > > > > +       .run_job = xe_dep_scheduler_run_job,
> > > > > +       .free_job = xe_dep_scheduler_free_job,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * xe_dep_scheduler_create() - Generic Xe dependency scheduler
> > > > > create
> > > > > + * @xe: Xe device
> > > > > + * @submit_wq: Submit workqueue struct (can be NULL)
> > > > > + * @name: Name of dependency scheduler
> > > > > + * @job_limit: Max dependency jobs that can be scheduled
> > > > > + *
> > > > > + * Create a generic Xe dependency scheduler and initialize
> > > > > internal
> > > > > DRM
> > > > > + * scheduler objects.
> > > > > + *
> > > > > + * Return: Generic Xe dependency scheduler object or ERR_PTR
> > > > > + */
> > > > > +struct xe_dep_scheduler *
> > > > > +xe_dep_scheduler_create(struct xe_device *xe,
> > > > > +                       struct workqueue_struct *submit_wq,
> > > > > +                       const char *name, u32 job_limit)
> > > > > +{
> > > > > +       struct xe_dep_scheduler *dep_scheduler;
> > > > > +       struct drm_gpu_scheduler *sched;
> > > > > +       const struct drm_sched_init_args args = {
> > > > > +               .ops = &sched_ops,
> > > > > +               .submit_wq = submit_wq,
> > > > > +               .num_rqs = 1,
> > > > > +               .credit_limit = job_limit,
> > > > > +               .timeout = MAX_SCHEDULE_TIMEOUT,
> > > > > +               .name = name,
> > > > > +               .dev = xe->drm.dev,
> > > > > +       };
> > > > > +       int err;
> > > > > +
> > > > > +       dep_scheduler = kzalloc(sizeof(*dep_scheduler),
> > > > > GFP_KERNEL);
> > > > > +       if (!dep_scheduler)
> > > > > +               return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +       err = drm_sched_init(&dep_scheduler->sched, &args);
> > > > > +       if (err)
> > > > > +               goto err_free;
> > > > > +
> > > > > +       sched = &dep_scheduler->sched;
> > > > > +       err = drm_sched_entity_init(&dep_scheduler->entity, 0,
> > > > > +                                   (struct drm_gpu_scheduler
> > > > > **)&sched, 1,
> > > > 
> > > > Why the cast here?
> > > > 
> > > 
> > > Copied from some existing code that had a cast, not needed it
> > > either
> > > case. Will remove.
> > 
> > Sounds great. With that:
> > Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> > 
> > Thanks,
> > Stuart
> > 
> > > 
> > > Matt
> > > 
> > > > Otherwise this patch lgtm.
> > > > 
> > > > Thanks,
> > > > Stuart
> > > > 
> > > > > +                                   NULL);
> > > > > +       if (err)
> > > > > +               goto err_sched;
> > > > > +
> > > > > +       init_rcu_head(&dep_scheduler->rcu);
> > > > > +
> > > > > +       return dep_scheduler;
> > > > > +
> > > > > +err_sched:
> > > > > +       drm_sched_fini(&dep_scheduler->sched);
> > > > > +err_free:
> > > > > +       kfree(dep_scheduler);
> > > > > +
> > > > > +       return ERR_PTR(err);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_dep_scheduler_fini() - Generic Xe dependency scheduler
> > > > > finalize
> > > > > + * @dep_scheduler: Generic Xe dependency scheduler object
> > > > > + *
> > > > > + * Finalize internal DRM scheduler objects and free generic Xe
> > > > > dependency
> > > > > + * scheduler object
> > > > > + */
> > > > > +void xe_dep_scheduler_fini(struct xe_dep_scheduler
> > > > > *dep_scheduler)
> > > > > +{
> > > > > +       drm_sched_entity_fini(&dep_scheduler->entity);
> > > > > +       drm_sched_fini(&dep_scheduler->sched);
> > > > > +       /*
> > > > > +        * RCU free due sched being exported via DRM scheduler
> > > > > fences
> > > > > +        * (timeline name).
> > > > > +        */
> > > > > +       kfree_rcu(dep_scheduler, rcu);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_dep_scheduler_entity() - Retrieve a generic Xe
> > > > > dependency
> > > > > scheduler
> > > > > + *                             DRM scheduler entity
> > > > > + * @dep_scheduler: Generic Xe dependency scheduler object
> > > > > + *
> > > > > + * Return: The generic Xe dependency scheduler's DRM scheduler
> > > > > entity
> > > > > + */
> > > > > +struct drm_sched_entity *
> > > > > +xe_dep_scheduler_entity(struct xe_dep_scheduler
> > > > > *dep_scheduler)
> > > > > +{
> > > > > +       return &dep_scheduler->entity;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > > > b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > > > new file mode 100644
> > > > > index 000000000000..853961eec64b
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > > > @@ -0,0 +1,21 @@
> > > > > +/* SPDX-License-Identifier: MIT */
> > > > > +/*
> > > > > + * Copyright © 2025 Intel Corporation
> > > > > + */
> > > > > +
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +struct drm_sched_entity;
> > > > > +struct workqueue_struct;
> > > > > +struct xe_dep_scheduler;
> > > > > +struct xe_device;
> > > > > +
> > > > > +struct xe_dep_scheduler *
> > > > > +xe_dep_scheduler_create(struct xe_device *xe,
> > > > > +                       struct workqueue_struct *submit_wq,
> > > > > +                       const char *name, u32 job_limit);
> > > > > +
> > > > > +void xe_dep_scheduler_fini(struct xe_dep_scheduler
> > > > > *dep_scheduler);
> > > > > +
> > > > > +struct drm_sched_entity *
> > > > > +xe_dep_scheduler_entity(struct xe_dep_scheduler
> > > > > *dep_scheduler);
> > > > 
> > 
> 
