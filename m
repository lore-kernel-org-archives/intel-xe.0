Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB908C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 20:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756D510E5D3;
	Wed, 30 Aug 2023 20:57:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7CB10E5D3
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 20:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693429028; x=1724965028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7MxIFZMmoSgIs/7HzoVeFQxq2ijvywdHQH5GvpLv3DM=;
 b=oKTelTt2h/EvuiGAutaI06/3sKrNwVI5pZVnn5YvpxUEVKLZjwbZv+cD
 fMnEr1Y011RnaeG37muGOmou8siPWgp3NasLWQOhK7qIhUe9gWRNt6dR8
 ua0rwWa4v/YTra733O2Z/qv8Hp0kGwTR54/1SFRuSesPbd2puq5+hz8z9
 zjScAJWlx2keZvzzSTC5iItp45W/s0D1Yjnh5QkFvbsd+pTSK6VW8hj8X
 yPM2OzK4npLqytzCbpEfOGmsfW3Jfqj3ljPdRJLw74RwYaXhrBOMWFJEq
 EqcRHPCJLLJxOwWZE2M9ngs6jRfick2WAdY99X6BDvaIoIHJNv0RLYFWK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="378463918"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="378463918"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 13:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853871235"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="853871235"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2023 13:57:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 13:57:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 13:57:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 13:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1mu1Yx3uWlybcf4c5f9maJGtcpyM/FVi8or3Wss/UcUdXcyyXDsmCnhzcC2l+fL/Ck0t8ihX7RqZNvLjIlr2kaXfVvutD6h0eh+irh/H57slTdxKFFHL/5Y6xG4/sxP+Spm2oUQ8y9tGDRGaK3gG29py5bTZO9rwOoFmh9EG6ged8tvCrqRb7h6l30DbHVBTCcRiV+9biJ04dpadA0VBtro/d+oerCLQXg5TPAftVn0/4Bu63a0XY6q21ZsmQ5eYUcOPL2RQzeA/09BGt5HOfuy2FQ0VuEWKY7hkpoVSlC31vLVI1lRR+vbu1ZfriDPWDK6TLNNXWbdMrp6rkJhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAmtr3tjtblMsIt6DJw4W77NqXdNvRY4XXJ7CPk9Hp8=;
 b=Uyj/pV4UbTzb4pXe2gnKRe9LMbqw0URoqAhCmZlijiuVbsR5Da7nvYssa9MNqqUnLlkZ6RhY+L1SAe7NDvElYiyif9rFmMHcCAEYcoZRkx24Alxngc6F5qeAMOIIABr9wRTtc48tfH+h1hp3mG/RPqmDC1GVvXYh5XHZhofwZlX/HKYlNszWA74xke/T79cZuPZJYfZ2aK1l+4kB6F2nFtfPMHRFlmCV0jp9Dev4SC0tuRhhhUjV+XWltgi1tMxixx4jJs/mqhKyW8ZNn5V9ZebvA6UUGugEylI7GhwFqTfiSaQ0HXCCixLlJIIFkf8Zmurs9XEZKwCg1ITsAFBfBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 20:57:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 20:57:03 +0000
Date: Wed, 30 Aug 2023 16:56:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZO+tGbmexPz6sI30@intel.com>
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
 <20230830051544.369643-3-aravind.iddamsetty@linux.intel.com>
 <87cyz514dt.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87cyz514dt.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM8PR11MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: bd83df0e-e1e3-4712-39b2-08dba99ba948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Erf78Y77H73Qy+26CFCoIj68LcxduVlUug5ze32HK4hZEhS7dq6cj0UaM32CPGdI0pWR0c62ARaelC/BEbElzc6mHoqRSpNon3uheeIcaXdCMXYqr6AbcUqtRSr9XoTOWihz0S0jtOY3YYZhLRZ87eltCxmOoSVVt4SrTCaTeRG7Ai+IPpE+fptZTyUzsayK+1mMnYaN0ygRRhWoqAb6eHa8Y0JIO1qkgWzTSkszpbvZsDSDgqCVpTuFY7iT8yU1412ncuqeO7d8jB8s8CMhtqRwgXjY0CuyPt4rd4J0vTYbRRAliojBhbFaD34LlRJ/yqmNO/e35IiFnxqClKF3dUHTE4KkGMM/tOuH+Yzvjr/x0O5Qh+zy1QU1b8yYiMJLUpG+9GR0oYIQLwyVONcUAz95dVlq1SyrhBJOCjlvzBaDUcIqNxpxqZcbLBP/7u5YZGnPCUh01mkt5myHlLsl3s+3KC9fGzHoDTV8/iQZiBenjHJq4ROiMJbFtT2htBcQ1Y31adyz9yi0H7rFHQDFDRk3VVUuxNOfdBFo3ofcZWUoDYn6mQWTgB8Lwd9iX5m4bd+vT3gQh3qMf2Sb+Uusyf/oihcN6A+qGjM58/8NIYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(1800799009)(186009)(451199024)(478600001)(4744005)(66476007)(66946007)(66556008)(37006003)(6636002)(316002)(82960400001)(38100700002)(2906002)(41300700001)(8676002)(8936002)(86362001)(5660300002)(6862004)(44832011)(4326008)(83380400001)(6512007)(6486002)(26005)(6666004)(6506007)(2616005)(36756003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CcV14xZ7GHVehVluW7ELUVBcqzPTWfJdhPzC3son2iVefFROpdtyFXg4IdXO?=
 =?us-ascii?Q?1o8F9RfehazaW2puDZ4iKRBM1vBOiWv8Ao82xpllf0MVF1XHCKNqR0n1H+S/?=
 =?us-ascii?Q?oSZiMKrRIyVD1WGkhdOy2q5LKXAwHAdlmGXZiFTrztg2T2Ey1JbJsc2lbvZQ?=
 =?us-ascii?Q?42yHwYuxnjfXdU+7pS4Tt9pSQhdDGZhUClDe6tuyAsT72OuVeA8CUm1Va2pM?=
 =?us-ascii?Q?k6ZrkDlpY0CcWM6i0eRFWXjCPgxMu0z8FSoeCVMlA+SZ5eMpN5JJnRFc1aFT?=
 =?us-ascii?Q?0f/SJtdoY0aqFNKEVBV65P5VbvhKTsn17+3jompHesIRBFLEi1TPhp0WeQzI?=
 =?us-ascii?Q?Ozfk49QcaS9/cpC3kYKeJj4XhdgqE1BZdcoJ7qQuVIq261fivb/Ik4cvgQVK?=
 =?us-ascii?Q?aIR5KS7EnC5I77tc0bV655sAzqRp+OTu1F6sZ3plT6P1qLTzwy1BAOaSQVP3?=
 =?us-ascii?Q?wdRndgn+L8kYqZf+bPQLSadd40BPxTDuFsrrMz4ZX/G6qjbmbeRXu0qiDg5d?=
 =?us-ascii?Q?H9IO65CO9UshyNWCFLFIpbn8Y6BuFuE7z7n67pW9Ht+CpFQA+ZOcb1o8rcRe?=
 =?us-ascii?Q?hAeNaAE3NKg1MC1+KliEN+10FdAXjaP6ecAZJUelAJE5EbYvHIzB8BfWPTrK?=
 =?us-ascii?Q?s54DGh0cnGQOZTBCxyMyIGXmm/X54sjMQThIBsColffTlvbLSh6UtmeREcTi?=
 =?us-ascii?Q?/Im5DNaID3szHS+wCqvDn58gwJG0P1ZpV9DHfgp63eEoXYyGeAQ37BUIDNzP?=
 =?us-ascii?Q?EAZwCFAVau5nDXnQzrBd0j1jD8MfDO1eWC771Dp/qBDUqXgPWoMzrF0X8qSr?=
 =?us-ascii?Q?TLQdsBq+URRDLsoDB9WcEW8QrroNYk2Fd0UZR6Ag0Ksn+zMgF1SiIBJOPusl?=
 =?us-ascii?Q?MYZiUyQQgmrBjkjpNwhNGfsM0Dgot7mIV2ybt9MshzDx6XlekYRBW0EaA9Lv?=
 =?us-ascii?Q?7Ilc12LVUmSg0PIsJSVVpdg80e9c9mICcr2whesnS8YFefW+I/NoLtfcb2mK?=
 =?us-ascii?Q?GhBomShrd5s47CqiisYWS7uCb05A0k4DfvI7ZT3C70nQuqzlac82WCW6/pAA?=
 =?us-ascii?Q?o7qlBlZTv6SK8KM3zDAVwdh7aS8uQgxautk5JQLZL7T2YQLJdD7vDyHGbs0v?=
 =?us-ascii?Q?d/fuitSld1XyHzdfLdcyTfxZ6samr/YjndNVwdLFsfOBzdN2psZ0eIwmoi/3?=
 =?us-ascii?Q?kBpkV+IU9a8d48ta8Td4c5D5IzkO7ee25MVbcy1wcQCQhHg5UzsuMGzJnUyY?=
 =?us-ascii?Q?2W5oW9MI0Us90gDZbEGPZ9UhY1jO0nZbZ33isfodWvFVt7rsjxKwtYQLk0IP?=
 =?us-ascii?Q?ewKvxfGV7LiP/MRVDt7BXWBJXJ8FfTfxhvwbOBGyp8WYYqYOwypHBlFJU4sp?=
 =?us-ascii?Q?GsS4RaTrAkBfizVWKC0HQMP86ZPW23EMiNYhVg5ipeUUwZYRDbCD+mYtFW9j?=
 =?us-ascii?Q?CiiRbx9vXP+1mvYcxDQyEnGME+z2Rh7aaIPSNpa7pJ+6y/0TMgJB9VxPiPiU?=
 =?us-ascii?Q?Yn4gGQ7TsOKhdiI7nweiGpv5UoWrah53hoO4jesvpwfQmhLW4U8QNlcfsEqy?=
 =?us-ascii?Q?U4z4Z3TW2ML4DWZgqRvgVJHXYio1hi8Zi2EcePDqwKfLSAqkigBpnjaWuaWp?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd83df0e-e1e3-4712-39b2-08dba99ba948
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 20:57:03.6648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozIR94cQ/WzsQLlHRmncx/DM0vNg6OzXVB71AmtRNSWVKdekelrVLQYhWmE+FOj0WARhTDO8+MiSHizIXG1bDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5686
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Use spinlock in forcewake
 instead of mutex
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 10:33:02PM -0700, Dixit, Ashutosh wrote:
> On Tue, 29 Aug 2023 22:15:43 -0700, Aravind Iddamsetty wrote:
> >
> 
> Hi Aravind,
> 
> > @@ -162,7 +162,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
> >				   domain->id, ret);
> >	}
> >	fw->awake_domains |= woken;
> > -	mutex_unlock(&fw->lock);
> > +	spin_unlock(&fw->lock);
> 
> No need to change anything yet, but let's get some more opinion on this: is
> it ok to (a) just replace the mutex with a spinlock in these force_wake
> functions, or, (b) should we have a second set of functions to be called in
> atomic context, say: xe_force_wake_get/put_atomic? So we should use (b) in
> atomic contexts and everywhere else we just continue to use the previous
> set of non-atomic functions? Or just converting the default set of
> functions to use spin lock (as is done in this patch) is ok?

It looks okay to me,
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thanks.
> --
> Ashutosh
