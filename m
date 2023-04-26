Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD55C77B78
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 18:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BF810E2FE;
	Wed, 26 Apr 2023 18:15:46 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EE810E2FE
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682532943; x=1714068943;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q0cW3K6n1BdTumlSXzId+DIC109nl17j65ZG9esKE44=;
 b=Dxc+dZi2o9w2fKnW2nLsQs921io2M0I6sw/erh5di2rZaEGX4YiuL8nm
 2r3Y1n/aaWcpARJTZ/kdj9LdBcQNTOZU+MYPAWWQzIdV7K1GAxeiGe4aN
 8aR/NIxx+ZdjA4znGk2w++2Pid+fQdH3Ft96E+KnzoZxJc9dtC7+jNUM4
 CFsr8HyurgOHpfjSimhvMz57OI7pOy/76kkY0VhG1NoyZqO7w9+oWhzZD
 1CSN6BUt3HkVkH9y6BYqC6fR8774xI8mdvlt8fRCh90BqZZIrA5NftWG/
 D7/mCmSUO72ttKfoxgRDS4SrwcaFprTJnmBfSe3nwet6q+LmWhnd8ZJ7g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336118070"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="336118070"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 11:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="763438254"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="763438254"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2023 11:15:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 11:15:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 11:15:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 11:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfqBH/XLijRFkNs5mU6+4sBSijrDRxHdCN/XRGrFB83EcJ9WAzNpUPIYkA40PHF6fm1nZVRGUI5zby6RldVePsHBy54erIwxFoNF6FrkhpIC1OhVzi4y1nq+p1Xmi0lwNtVtkwmZ4LxObAmv9mWcoRP6IjcvKxtHUqD6lMFZUyMKb0gn9rIqkvXCeueaj/u6uUZ9suJiYi777H8Nn2s6Qp66vEJRMUGneZQ6E5YYMi9n7Elss9UPAN/izZvGcyfLRGSRxJFFsdYEedmofZpg0e5nym5/238I7g3/5NRRKvM6kXf+TPiYV9F7K9wXR7sei23vnaAIVeH5saj14OZp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HBXDKhZf5zZqi7HFqSOpb6usvJN1g7B9+5wrnmTuCI=;
 b=OISnkB8F4GtLlmfpSQla/GI8kfeZgWgBEVXyHRkoGfADAbg/kw4ypwCxtFkxbU+AAl6li9dOgetY03DA5jXcGG//M5ZEEqNP1SboXSb8XpHaoA9ytboTNmNe5Fhh2d2cCF4RkmPey9CZnsrppJP/M7lc6k++33wsC1dy0uTdMLdezUDZP4FXhmYyhdB17CePTcqT7imLE+zEFuog3OsdL00bevZnO/ZBmIDb7YDRnBqBcRXzCgqBJiydn8VGpjm8MKCr9nPZV71AVvJeK/qGEv5BbBXd1ElYJFTfWO9u8cBtP5wb1RAhyRych3ivwb/z8Wbn22k7OfwNx0WWQStbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 18:15:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 18:15:39 +0000
Date: Wed, 26 Apr 2023 11:15:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <fjypnmrunxzhf4e2td7htgopwsg4o2uxudqwbfdhacjmdgwhqy@5lsiot4infh4>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-13-lucas.demarchi@intel.com>
 <3286caad-48f5-01e0-6e15-4e15c69e3a3a@intel.com>
 <fk47pjv5rnfsnxac4goeqhwlolffa3wnsyejjn23b2ji2ud6ma@llik644c37ma>
 <475b902a-b734-53b6-cab1-4a78838a5a68@intel.com>
 <jaoxg7iio733vdhbfxeqrl3efq6dt6ojirbcvtazcg2sepj34w@6z76cml323df>
 <tximigyq6m3h4xnwifsyyshbf7eposlrnmetcusstk4b56lnvb@g2idj7bro7wj>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tximigyq6m3h4xnwifsyyshbf7eposlrnmetcusstk4b56lnvb@g2idj7bro7wj>
X-ClientProxiedBy: SJ0PR05CA0187.namprd05.prod.outlook.com
 (2603:10b6:a03:330::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 977f1f18-90b3-42e7-470f-08db46823d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LE9HaZ6f6lVnawApX6YBPEnMguTfX4k5jaDIKV9m3EmSakSucxdIisRX8cs3CU7i2hH209Ga6DcHCtIpf0JIpbqNggwtux5eRb5ZHF1VC1xbF+69+vPe5vmbtdUZ1Ft9vs+bfyLMUAozApz6ZMKOj8eyYDttQNzNZHlt2fl4AchxLbbercK5LAepd9TmzvDnhPv+bYItcH9fs7Ye8eycXLB5FPNNehqqXzNLn7FOl1dfq5n/juxgOGXGLXwGBkKD0TRBxcbmI4tFXq3sWxq96PKP9gP0YISlmlnfRhrnZ0YlmDcgSVp9NQcBw/2b45EA2M3J+CkVApG5pTQxD48ootqUKss7UxCMCfUCUQS8O0pk4M9OPIyOA0OWgb0fnehM9RFAoyqc3mvd6VaYf8LI87IyDTUU5vaeXNTN+hyskQ6BbhpL52Jbc3UAxLOcSiOLUacFvFJlqRHBR1yKs9FjbI6Na2MMKGqI9uOxNenlsi+gKFGOqMlApO5R15eQlYA14PjzZALvZomRg6C9JYg2mmAn5PV0g6kDv2VUBtkY2//x+dJOwV4c4Nvyqd0eSwFK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(41300700001)(26005)(6512007)(9686003)(6506007)(5660300002)(82960400001)(8936002)(6862004)(8676002)(83380400001)(30864003)(2906002)(38100700002)(6636002)(4326008)(316002)(66946007)(66556008)(66476007)(478600001)(86362001)(186003)(107886003)(54906003)(6666004)(6486002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ara2/6RRF5J0e1hTjA6Xo3cPLt95DzvwyfbI2OAYyZQ7Am3DOFssbEHX9k?=
 =?iso-8859-1?Q?oMRcWmYm3N9HRJTJcHCZJEzWai9xWFitW2A8pLIfSf+Rpp7DvZXFIBrKwg?=
 =?iso-8859-1?Q?xrRDFZlSpqfrSzDjBMMU60Ywq5zHUVtSOXowIXRR870wwIAjsd6H11yMio?=
 =?iso-8859-1?Q?9oI2LWwVcfuAXHGmq1R7ATu+YZwX6REObs40z8V0B+s0NwIxISq0uEkLfu?=
 =?iso-8859-1?Q?QWF4yfp45/boUciYA/0EHx+7rYxMCDiHQtUL2uA2NVtLxUAwm/D6K6/vJm?=
 =?iso-8859-1?Q?ZUhhcAq8DV5FA4uRJzD0cg7gp39xI62gBS1HFGc7zLlR/9SGSlvPvprSj0?=
 =?iso-8859-1?Q?UHxQUtraHazuzf1OzRN/ZTh0PW+zc5Vz/yA5+Eron6abO9LbXJ8CjKSrBF?=
 =?iso-8859-1?Q?03K/105/iwh1gBpDntLC9QFq2eXbT+32CI1Oh+BJtrQXPlmiZE8NLsNvGe?=
 =?iso-8859-1?Q?DtDwvfVZYOPgU75iJ/snRrFNt5jKn2Eh5zOA9oK27tvn/NBI7+x/ttQ7aF?=
 =?iso-8859-1?Q?xIebwLyYwUdFfzCQYlasleZOhdljRqaumSMZQcGCY7mB+lBGUJ1MCoLRK4?=
 =?iso-8859-1?Q?GnM/NQfLNLSWWLEn3IrB7frOMsC+Prqgp6krKpy66lxRiVm+oo15u6kUi9?=
 =?iso-8859-1?Q?LxUAAHcad1+ECJE5qJDcKaD7dpMwYwtNHOe7rcuXIf4ac6bvLA/HSZ5Riq?=
 =?iso-8859-1?Q?9xpEXqDMm4upk70eF1xZ0V1OEPQCQkRAsQ3+HO9M40KdGifo2gbKbE5fiq?=
 =?iso-8859-1?Q?CQoGeT6Ob4I+7zrEhdhCc/41rXTY8Uu0KUuB8jHdcGnUjY95NvSJxXHPnR?=
 =?iso-8859-1?Q?XMNrjiUPcA8Tb+pDtCVNAZEDCP48jn2xF+umXvrVKl76SmEeh4DD0FT9oz?=
 =?iso-8859-1?Q?vw77vy5mhasUNt2lvUAh2uR/evRgSuHuqIEk4DDg96ctuTIJ4syq7+kLUo?=
 =?iso-8859-1?Q?AeTgmz8DFkQZg+BrctvM9odqQWt8U/y8qGMo2zmRUrT+0ZR+Kjv9SNVAFd?=
 =?iso-8859-1?Q?IedjbUFfcQBcn5YIYgdeC+2V9Ca1F71XMByEAhWaheKB9NHJMLT5LKrY3T?=
 =?iso-8859-1?Q?ioaXrSYKSjEAIFZaFo2fJWtHIOwYpJh6y+wZn+U2fOrIxIEdPm0fP/6zpD?=
 =?iso-8859-1?Q?ogi3i/+pfRfauXZCWtd9SDIWdHdGi+6Izj2rwOZ/d8sV8wnenOskDocU6K?=
 =?iso-8859-1?Q?/x10RVvqpUxCB0WB+G0pPC0AH594s/p5NBzSVe7Fo7mCSDlf+3ZinSHRNG?=
 =?iso-8859-1?Q?GuOQ3QX7wHNBrZCwKetvQXQZjOKNqcAH/dPeqGS20yLocLDKF6bLqP8sAj?=
 =?iso-8859-1?Q?oofLZb2e7lLMwyo6qNs+A8DAAQGQxTqNYN7tdnKXqYqaMhymcY7RTscSQb?=
 =?iso-8859-1?Q?iH7lSDNZYWS2/lcjpFvfilRImKwUFiPCwy2oMO3q6z4QHd+Y2llC9XZ0j8?=
 =?iso-8859-1?Q?OKsonvVbBDU2e8pr1IS3grgSeqizsEDbmCMl8FerAI9kfwtXfHJg/YY79J?=
 =?iso-8859-1?Q?2N36/h4sXaiXZNYl1Kt5U73UfXjR2bcobucxlskH7P3sdslFfOI1zkZc4H?=
 =?iso-8859-1?Q?jAqHwXONlt2TQoQ6jF3gZ9AIn+PA0blwab3k3uswSveMIJlUFv6vO7T4Qm?=
 =?iso-8859-1?Q?PVVPRuzEDpqNI25DcwCBO+hEj7J3/u32ya2aH+5P7wALA2xjnxjsamGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 977f1f18-90b3-42e7-470f-08db46823d55
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 18:15:39.4183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dJmsc5RKCwIHe/TdaGfNvsZNr0VXy1HuLp3+Kj7k9db8PszIEWmtfm0HfQJVvTUBAeN/40V0onXIgz14EKhztZ/qM11Li6d1Nv8AvQ2Giw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/17] drm/xe/rtp: Improve magic macros
 for RTP tables
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 05:22:33PM -0700, Lucas De Marchi wrote:
>On Tue, Apr 25, 2023 at 04:13:10PM -0700, Lucas De Marchi wrote:
>>On Tue, Apr 25, 2023 at 07:00:31PM +0200, Michal Wajdeczko wrote:
>>>
>>>
>>>On 25.04.2023 15:17, Lucas De Marchi wrote:
>>>>On Tue, Apr 25, 2023 at 01:03:54PM +0200, Michal Wajdeczko wrote:
>>>>>
>>>>>
>>>>>On 22.04.2023 00:32, Lucas De Marchi wrote:
>>>>>>The macros for writing the rtp tables have some downsides:
>>>>>>
>>>>>>    1) They are fragile, and when making a typo it's hard to know
>>>>>>       where it's failing for someone not used to them
>>>>>>    2) They polute the global scope. The CONCAT/COUNT_ARGS/etc only
>>>>>>       work because they are defined exactly the same as the ones in
>>>>>>       kernel.h.
>>>>>
>>>>>hmm, I wonder why they were defined locally in first place ?
>>>>>Can't you always use definitions from kernel.h ?
>>>>
>>>>I didn't want to include kernel.h for the 2 macros it would use
>>>>when people are actually trying to reduce the size of kernel.h due to
>>>>being kind of what our i915_reg.h became. Also the count args to 12 is
>>>>not exactly what we want.
>>>
>>>sorry, but I still don't follow
>>>
>>>if a ready to use macro is defined, I see no reason to define own copy
>>>just because we don't like to include header where it was added/defined
>>>
>>>if size of the kernel.h is a real problem, then I would expect moving
>>>CONCAT/COUNT macros to linux/concat.h/count.h rather then creating its
>>>own macros in private header (unless they are really non-generic)
>>
>>my thought was: it *is* happening. Slowly. Over time. Let's not add one
>>more dependency on it.
>>
>>At the same time, there is no good reason to block the rest of the
>>changes (and actually the entire xe module being merged upstream)
>>by attempting to create those headers. Yes, that could happen in
>>parallel and go through the right upstream branch. That branch is not
>>drm-next though.
>>
>>We have only 3 macros that were typed over and over in the last 30 years
>>in slightly different forms.  Once we have a concat.h / count.h we can
>>easily migrate to them.  Example: `git log --grep str_yes_no`: such
>>common infra takes time and synchronization between several trees.
>>
>>See:
>>d2a8ebbf8192 ("kernel.h: split out container_of() and typeof_member() macros")
>>
>>And the disclaimer in the header itself:
>>
>>/*
>>* NOTE:
>>*
>>* This header has combined a lot of unrelated to each other stuff.
>>* The process of splitting its content is in progress while keeping
>>* backward compatibility. That's why it's highly recommended NOT to
>>* include this header inside another header file, especially under
>>* generic or architectural include/ directory.
>>*/
>>
>>
>>
>>>
>>>>
>>>>>
>>>>>>    3) They are not compatible with rules/actions with registers
>>>>>>       passing additional options
>>>>>>
>>>>>>This new implementation fixes (2) and (3).
>>>>>>
>>>>>>For (2), prefix everything with "_XE", so there is less chance of
>>>>>>clashes. Also, the maximum number of rules and actions is 4, so there is
>>>>>>no need to make the helper macros go until 12: reduce that to 5, so if
>>>>>>more arguments is passed, the compiler gives an error that there is not
>>>>>>definition with _5 suffix.
>>>>>
>>>>>I'm not convinced that adding local definitions with XE_ prefix that
>>>>>mimics functionality already defined in kernel.h is the right way to go
>>>>
>>>>see above
>>>>
>>>>>
>>>>>>
>>>>>>For (3), change the implementation to concentrate on "pasting a prefix
>>>>>>to each argument" rather than the more general "call any macro for each
>>>>>>argument". Hopefully this will avoid trying to extending this infra and
>>>>>>making it more complex. The new changes to how the arguments are
>>>>>>constructed using tuples will allow extending the interface where it's
>>>>>>needed: passing additional register fields to allow creating our own
>>>>>>xe_reg_t.
>>>>>>
>>>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>---
>>>>>> drivers/gpu/drm/xe/xe_rtp.h | 68 ++++++++++++++++++-------------------
>>>>>> 1 file changed, 33 insertions(+), 35 deletions(-)
>>>>>>
>>>>>>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>>>>>>index a3be7c77753a..53650f09efe9 100644
>>>>>>--- a/drivers/gpu/drm/xe/xe_rtp.h
>>>>>>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>>>>>>@@ -22,43 +22,42 @@ struct xe_reg_sr;
>>>>>> /*
>>>>>>  * Helper macros - not to be used outside this header.
>>>>>>  */
>>>>>>-/* This counts to 12. Any more, it will return 13th argument. */
>>>>>>-#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10,
>>>>>>_11, _12, _n, X...) _n
>>>>>>-#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6,
>>>>>>5, 4, 3, 2, 1, 0)
>>>>>>+#define _XE_ESC(...) __VA_ARGS__
>>>>>>+#define _XE_COUNT_ARGS(...)
>>>>>>_XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
>>>>>>+#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
>>>>>>
>>>>>>-#define __CONCAT(a, b) a ## b
>>>>>>-#define CONCATENATE(a, b) __CONCAT(a, b)
>>>>>>+#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
>>>>>>+#define __XE_CONCAT(a, b) a ## b
>>>>>>
>>>>>>-#define __CALL_FOR_EACH_1(MACRO_, x, ...) MACRO_(x)
>>>>>>-#define __CALL_FOR_EACH_2(MACRO_, x, ...)                    \
>>>>>>-    MACRO_(x) __CALL_FOR_EACH_1(MACRO_, ##__VA_ARGS__)
>>>>>>-#define __CALL_FOR_EACH_3(MACRO_, x, ...)                    \
>>>>>>-    MACRO_(x) __CALL_FOR_EACH_2(MACRO_, ##__VA_ARGS__)
>>>>>>-#define __CALL_FOR_EACH_4(MACRO_, x, ...)                    \
>>>>>>-    MACRO_(x) __CALL_FOR_EACH_3(MACRO_, ##__VA_ARGS__)
>>>>>>+#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
>>>>>>+#define __XE_FIRST(x_,...) x_
>>>>>>+#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
>>>>>>+#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
>>>>>>
>>>>>>-#define _CALL_FOR_EACH(NARGS_, MACRO_, x, ...)                    \
>>>>>>-    CONCATENATE(__CALL_FOR_EACH_, NARGS_)(MACRO_, x, ##__VA_ARGS__)
>>>>>>-#define CALL_FOR_EACH(MACRO_, x, ...)                        \
>>>>>>-    _CALL_FOR_EACH(COUNT_ARGS(x, ##__VA_ARGS__), MACRO_, x,
>>>>>>##__VA_ARGS__)
>>>>>>+#define __XE_PASTE_SEP_COMMA        ,
>>>>>>+#define __XE_PASTE_SEP_BITWISE_OR        |
>>>>>>+#define __XE_PASTE(prefix_, sep_, args_)
>>>>>>_XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_,
>>>>>>args_))
>>>>>>+#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
>>>>>>+#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>>>>__XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL
>>>>>>args_)
>>>>>>+#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>>>>__XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL
>>>>>>args_)
>>>>>>+#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>>>>__XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL
>>>>>>args_)
>>>>>>
>>>>>>-#define _XE_RTP_REG(x_)    (x_), XE_RTP_REG_REGULAR
>>>>>>-#define _XE_RTP_MCR_REG(x_) (x_), XE_RTP_REG_MCR
>>>>>>+#define _XE_RTP_REG(x_)        (x_), XE_RTP_REG_REGULAR
>>>>>>+#define _XE_RTP_MCR_REG(x_)    (x_), XE_RTP_REG_MCR
>>>>>>
>>>>>> /*
>>>>>>  * Helper macros for concatenating prefix - do not use them directly
>>>>>>outside
>>>>>>  * this header
>>>>>>  */
>>>>>>-#define __ADD_XE_RTP_ENTRY_FLAG_PREFIX(x)
>>>>>>CONCATENATE(XE_RTP_ENTRY_FLAG_, x) |
>>>>>>-#define __ADD_XE_RTP_ACTION_FLAG_PREFIX(x)
>>>>>>CONCATENATE(XE_RTP_ACTION_FLAG_, x) |
>>>>>>-#define __ADD_XE_RTP_RULE_PREFIX(x) CONCATENATE(XE_RTP_RULE_, x) ,
>>>>>>-#define __ADD_XE_RTP_ACTION_PREFIX(x) CONCATENATE(XE_RTP_ACTION_, x) ,
>>>>>>+#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)   
>>>>>>_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
>>>>>>+#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)   
>>>>>>_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
>>>>>>+#define __XE_PASTE_XE_RTP_ACTION_(x_)    _XE_CONCAT(XE_RTP_ACTION_, x_)
>>>>>>+#define __XE_PASTE_XE_RTP_RULE_(x_)    _XE_CONCAT(XE_RTP_RULE_, x_)
>>>>>
>>>>>maybe local macros should be defined with full XE_RTP prefix and be
>>>>>tailored for your specific RTP usecases:
>>>>>
>>>>>#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
>>>>>#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## _ ## b
>>>>
>>>>these are not to be used throughout the source code. The only difference
>>>>I see from this and what I did is the prefix being *XE_RTP_ rather than
>>>
>>>also the actual outcome of the macro includes "XE_RTP" prefix being
>>>added automatically (making this a non-generic concat macro)
>>>
>>>>*XE_.  Since this is not to be used outside the header, I'm not seeing
>>>>much value in make it even longer.
>>>>
>>>>>
>>>>>#define __XE_PASTE_XE_RTP_ACTION_(x_)    _XE_RTP_CONCAT(ACTION, x_)
>>>>>#define __XE_PASTE_XE_RTP_RULE_(x_)    _XE_RTP_CONCAT(RULE, x_)
>>>>
>>>>this contradicts what you said and following that would make it very
>>>>ugly:
>>>>
>>>>#define __XE_RTP_PASTE_XE_RTP_ACTION_(x_)    _XE_RTP_CONCAT(ACTION, x_)
>>>>#define __XE_RTP_PASTE_XE_RTP_RULE_(x_)        _XE_RTP_CONCAT(RULE, x_)
>>>
>>>or
>>>
>>>#define __XE_RTP_PASTE_ACTION(a)    _XE_RTP_CONCAT(ACTION, a)
>>>#define __XE_RTP_PASTE_RULE(r)      _XE_RTP_CONCAT(RULE, r)
>>
>>humn... if this works, then it seems to be cleaner. My previous attempt
>>on trying a similar thing ended up with the preprocessor not pasting it
>>on all args, but I think that was still when I was using the
>>CALL_FOR_EACH macro. I will try with this one.
>
>there's big caveat here that the macros are being joined together to
>form the macro that will be called... we can't have it called
>__XE_RTP_PASTE_ACTION since the rename cascades from the other macro,
>called by the actions/rules setup.
>
>There is also this other user without the prefix:
>
>#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
>
>with a lot of changes the renames could probably be made to work,
>but I'm not sure the small gain of using XE_RTP_ vs XE_ prefix really
>justifies it. It won't be simpler.
>
>I will think a little more, but if you have it done, please feel free to
>send it here.


ok, after some changes I think I could both simplify it a little bit by
removing one indirection and make it use the XE_RTP_ prefix.

	$ cat a.c
	#include <xe_rtp.h>

	XE_RTP_PASTE_FOREACH(TEST_, COMMA, (FOO, BAR))
	XE_RTP_PASTE_FOREACH(TEST2_, COMMA, (FOO))
	XE_RTP_PASTE_FOREACH(TEST3_, BITWISE_OR, (FOO, BAR))
	$ gcc -I <...> -D__KERNEL__ -I../drivers/gpu/drm/xe -E -P a.c
	...
	XE_RTP_TEST_FOO , XE_RTP_TEST_BAR
	XE_RTP_TEST2_FOO
	XE_RTP_TEST3_FOO | XE_RTP_TEST3_BAR

Also, the end result for xe_wa.i compared to the previous output is the
same:

	$ git stash
	$ make O=build64   drivers/gpu/drm/xe/xe_wa.i
	$ cp drivers/gpu/drm/xe/xe_wa.i{,.old}
	$ git stash pop
	$ make O=build64   drivers/gpu/drm/xe/xe_wa.i
	$ git diff --no-index drivers/gpu/drm/xe/xe_wa.i{.old,}
	diff --git a/build64/drivers/gpu/drm/xe/xe_wa.i.old b/build64/drivers/gpu/drm/xe/xe_wa.i
	index 5f08d005c8f2..d2908d6b1993 100644
	--- a/build64/drivers/gpu/drm/xe/xe_wa.i.old
	+++ b/build64/drivers/gpu/drm/xe/xe_wa.i
	@@ -64681,16 +64681,16 @@ struct xe_rtp_entry {
	 struct xe_hw_engine;
	 struct xe_gt;
	 struct xe_reg_sr;
	-# 391 "../drivers/gpu/drm/xe/xe_rtp.h"
	+# 404 "../drivers/gpu/drm/xe/xe_rtp.h"
	 void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
	       struct xe_gt *gt, struct xe_hw_engine *hwe);
	-# 403 "../drivers/gpu/drm/xe/xe_rtp.h"
	+# 416 "../drivers/gpu/drm/xe/xe_rtp.h"
	 bool xe_rtp_match_even_instance(const struct xe_gt *gt,
	     const struct xe_hw_engine *hwe);
	-# 421 "../drivers/gpu/drm/xe/xe_rtp.h"
	+# 434 "../drivers/gpu/drm/xe/xe_rtp.h"
	 bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
		const struct xe_hw_engine *hwe);
	-# 432 "../drivers/gpu/drm/xe/xe_rtp.h"
	+# 445 "../drivers/gpu/drm/xe/xe_rtp.h"
	 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
	       const struct xe_hw_engine *hwe);
	 # 21 "../drivers/gpu/drm/xe/xe_wa.c" 2


This is the diff to the new implementation I will include in next
version:


--------8<-------------
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 85b107967eeb..be3481d16825 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -26,33 +26,47 @@ struct xe_reg_sr;
  #define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
  #define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
  
-#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
-#define __XE_CONCAT(a, b) a ## b
-
  #define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
  #define __XE_FIRST(x_,...) x_
  #define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
  #define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
  
-#define __XE_PASTE_SEP_COMMA		,
-#define __XE_PASTE_SEP_BITWISE_OR		|
-#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
-#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
-#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
-
  #define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
  #define _XE_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
  
+#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
+#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
+
+#define __XE_RTP_PASTE_SEP_COMMA		,
+#define __XE_RTP_PASTE_SEP_BITWISE_OR		|
+
  /*
- * Helper macros for concatenating prefix - do not use them directly outside
- * this header
+ * XE_RTP_PASTE_FOREACH - Paste XE_RTP_<@prefix_> on each element of the tuple
+ * @args, with the end result separated by @sep_. @sep must be one of the
+ * previously declared macros __XE_RTP_PASTE_SEP_*
+ *
+ * Examples:
+ *
+ * 1) XE_RTP_PASTE_FOREACH(TEST_, COMMA, (FOO, BAR))
+ *    expands to:
+ *
+ *	XE_RTP_TEST_FOO , XE_RTP_TEST_BAR
+ *
+ * 2) XE_RTP_PASTE_FOREACH(TEST2_, COMMA, (FOO))
+ *    expands to:
+ *
+ *	XE_RTP_TEST2_FOO
+ *
+ * 2) XE_RTP_PASTE_FOREACH(TEST3, BITWISE_OR, (FOO, BAR))
+ *    expands to:
+ *
+ *	XE_RTP_TEST3_FOO | XE_RTP_TEST3_BAR
   */
-#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
-#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
-#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
-#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
+#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
  
  /*
   * Macros to encode rules to match against platform, IP version, stepping, etc.
@@ -311,7 +325,7 @@ struct xe_reg_sr;
   *	};
   */
  #define XE_RTP_ENTRY_FLAG(...)							\
-	.flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ENTRY_FLAG_, BITWISE_OR, (__VA_ARGS__)))
+	.flags = (XE_RTP_PASTE_FOREACH(ENTRY_FLAG_, BITWISE_OR, (__VA_ARGS__)))
  
  /**
   * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
@@ -334,7 +348,7 @@ struct xe_reg_sr;
   *	};
   */
  #define XE_RTP_ACTION_FLAG(...)							\
-	.flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_FLAG_, BITWISE_OR, (__VA_ARGS__)))
+	.flags = (XE_RTP_PASTE_FOREACH(ACTION_FLAG_, BITWISE_OR, (__VA_ARGS__)))
  
  /**
   * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
@@ -359,7 +373,7 @@ struct xe_reg_sr;
  #define XE_RTP_RULES(...)							\
  	.n_rules = _XE_COUNT_ARGS(__VA_ARGS__),					\
  	.rules = (const struct xe_rtp_rule[]) {					\
-		__XE_PASTE(__XE_PASTE_XE_RTP_RULE_, COMMA, (__VA_ARGS__))	\
+		XE_RTP_PASTE_FOREACH(RULE_, COMMA, (__VA_ARGS__))	\
  	}
  
  /**
@@ -385,7 +399,7 @@ struct xe_reg_sr;
  #define XE_RTP_ACTIONS(...)							\
  	.n_actions = _XE_COUNT_ARGS(__VA_ARGS__),				\
  	.actions = (const struct xe_rtp_action[]) {				\
-		__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_, COMMA, (__VA_ARGS__))	\
+		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
  	}
  
  void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
