Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76495CDE02E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 18:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A4F10EBCB;
	Thu, 26 Sep 2024 18:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuR/O2uM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A801010EBCB
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 18:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727375761; x=1758911761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4DCeBk34K4R8HzfzZv6exHzyIzZpZDaZNQytRL2xZcE=;
 b=SuR/O2uMujndQs+8AlTGooIAHL1MveTuA4SXxe5bboz9HHsRsMzZCl4l
 xNDakl7a6zG7G54n3erGBEu9hyk8+pofrDknbSAQxfOKrcFnHzZeBZjpR
 yLFhPpgeeVETWskVxb2XBZEw0tqSVOFsLqMcHo1Mf7wf2kiMqK3EydsXw
 FU9Skll9xkSrkuT51qWd4XRU076zfszsc81cTuJTigrKhA+E6RnEhA0AE
 sjrJing8egF5HSHIVg+5t8Z60sHzXh4wtFIkSaUb8kr/NxlaXcqVqAJgU
 lctWRt+DvQVzlnIoiBMf0vOl+6UnS8jLcmCaUdDVkqr987cRIbppCYkmV Q==;
X-CSE-ConnectionGUID: v0ZVe5dhRw+kDYlC2Dl+Kw==
X-CSE-MsgGUID: 8CpiPdEoS8mUWXQYs6P08Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26595345"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26595345"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:35:59 -0700
X-CSE-ConnectionGUID: DT/hDrc8QLyk2Jv14GMOnQ==
X-CSE-MsgGUID: nRAUYtYuSk+IebwI00IuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="77041713"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 11:35:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:35:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:35:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 11:35:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 11:35:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpYyjQDqixDg3luvL8HauEak+gZueQJajQVq5/9G3RbfginJy4NrPU6prKRUl38z/tnhJU072qyheSUzvI3/OSup4P+17itF9beKpIMBucpgy9QTJz+Da+k10HfiFxbcTr8eirh7H3CDUJLPxwZZblHKucCRcmAKrVfXK/Z/t0/SxxbF8MNWF0ajFqP8fz3t1QAiHVzfiAbnB4WCVj10Tw2oRid/Oa1ussMCGvZhL+q7zX2+0udpfNnZ8uWR1ogYdWJHX0IGtBYqCEOpMdiYMQmsKkyeGlhQoy8P1WltMcOt1V328Kc23OQkhXAnQNQm3nECBGbAvds/zd8hEzxDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TlCUuGLRhdtUi+BS0FH3pjie4ReFxI4S8nkjaeqrJY=;
 b=foNP+4dtA+rk+DKPOE4QcOoeTPYdD943Gpi7rC5+GiT04OI4AByj1ri3oOXYBFI8dcjBdbl1Y5MKoIF+F3Xa6SKu3nQrf//qFMc0A+5955QHpaInx6RzU/MOov0/0Ln1RRwa9U9wksnVLE6jmbqPymJ4At/7S2rWMyhopeNmyXA18AEyhjKQwbBpp1LkMOWioX7KUUtnJeLzWS48RlpE7z91zYxKg0xYLJ+rxMckN6QEMnpD00lYP8xEPeTf9fJd9rrk7x6m3VQna2EEYk6H4zhDC/Q71rdvU41zOU2SYCn1aocqfIsfGpDN0wazoqOC9oP80e2ZBRz+UMyxs+KHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Thu, 26 Sep
 2024 18:35:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 18:35:55 +0000
Date: Thu, 26 Sep 2024 14:35:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZvWph-faCIrEmfF1@intel.com>
References: <20240925155546.76630-1-francois.dugast@intel.com>
 <87jzey21i8.fsf@intel.com> <ZvVJKGc_ltNgYDsl@fdugast-desk>
 <87ed561vci.fsf@intel.com>
 <lopyt6t2hotskchmhit2dhu7oqgsw6tahogxnxvsvkmsrkgl3p@5rt6rp334qhm>
 <87bk0a1qxz.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87bk0a1qxz.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:303:dc::22) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f45e263-92f5-4e9e-58d4-08dcde5a0eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AUt8QO6S/XA5D7zSy98EF8uPKfeNa4hATh7WFA5V1mhZYVkE0/xs7Z6+Ec9b?=
 =?us-ascii?Q?f/ofWWFZKiOBHPoXDn6CuFnvUN8fjIvvr/+IAijlsce1XsdOw1zMOCHFzYUg?=
 =?us-ascii?Q?v05X0bJ3Y7WOzl806Nhy67LXW+LVFEjuoSSjECJ0f1u6aAhd9jaQlJN7mXyS?=
 =?us-ascii?Q?Fx2deC3Pqea/YgRadr0M4ZimQW6SrQ8xk3JmU9ByY/nVeaEhcIJaoHUJvBXm?=
 =?us-ascii?Q?R63SCy/ErX0mphnU6rjywo5RxS7h8hjP0Qj/Br+UW7LuYf475s/uh8tsS0sl?=
 =?us-ascii?Q?+vWntgmJi6clzd8EPa2l2QUDbKgUc+SiO7jXzItogNWz8EaptL5PYLbFBmtn?=
 =?us-ascii?Q?1RTO6Qf3Wnj78b6jNDq2CGbJAl5zhHbu+hu8ZiyxEhNPg8259yaYY/8kCfRl?=
 =?us-ascii?Q?PVDJ0SCTC3Y1RotiW+bbTBK51p8J4Qv5q44OBfxt6Tgv+EaJgjN4x+buWivE?=
 =?us-ascii?Q?8CzHqf39kPRJ0OLgjKKmWwg8i2PnehYC+NYiBIe76e7Yk2xvxxdtoZLsOtfi?=
 =?us-ascii?Q?xs/tpr05gm76FdXvZb7dJmq2SAXfGkiu0A6qJzgzEt2nAB4XUlKEJ68oXUVZ?=
 =?us-ascii?Q?0Z1YgjOANrq9lRapOMBKkrmDjZvRp7Qgd1AhOkcADIA8LxkqcrsYNpJVCDaR?=
 =?us-ascii?Q?f8pnczg4STvliAvp5R8lthWA151kAn5AnGP+Fx9z0WiqCUFabrY4JyS1msXL?=
 =?us-ascii?Q?pIXO1t0+wECcKN1ZOzmUBzKvw+CXHZWgJNXX5vYCJzXKNz1G6bCfVZiOVcXN?=
 =?us-ascii?Q?y7Wb9+ddu/XvAOuNa7EiRDmIf/NOx4tTaeatm99ihBB/bZ5gkiHsqW1B5EG1?=
 =?us-ascii?Q?oMz1Nbi8EkrWsU93FM5HUXlR5TGHc7OiZ+W0RvynJq6iu4KZ5KGf9pPXeY8b?=
 =?us-ascii?Q?GAE3IYK8BNVlqp+kmhUT4/5S1Y5vt5xPWV3pKue+zTM1Amr5kRUG127d+IfX?=
 =?us-ascii?Q?QJOe7Y+LKG/lL+q5Ft8BojGThwZ7meghSYi5ecqPtUJjw/AqddDp4v6b+GHO?=
 =?us-ascii?Q?h6FFHWehHdOQufNylLFu9BeJnkLCLGkv0hpoTQh/BUqIPN/d45hNje4U6hr8?=
 =?us-ascii?Q?7ALHTOMhD3d8Upcnac9n9BAxYG1kB4gvrt/yQ29io5sX02c67ZPA3G8xU1ld?=
 =?us-ascii?Q?hdVnCGW30PE5ShpduMY5DUT1GO8QaEEX59Mtfz2DZWuqclmx/hb1HRHFPGfI?=
 =?us-ascii?Q?J7m5ekaWCiL+U7MWmZ/S70Nv8BcBtqq6WejTJOjbotjVdLJ8qaJS4htVfA2x?=
 =?us-ascii?Q?/UYL4o7xQl4r1kE7tOz28/+W8Iksu9MzobArhEU71KDOz73A2TsE9dwl2spI?=
 =?us-ascii?Q?IB4WhN8EyhI1siRc+3+5KvYmVGPFZo/xOOpC9UKuhxzDB8nXEEcF1UNyOjSG?=
 =?us-ascii?Q?GPG+5R0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gjqv6k6vPweGE54v7gGNkWmdnV/wZEnLzAMyk7GfwZBeXsShINY90dIL0k8H?=
 =?us-ascii?Q?WYLrovRsGX5GdCWOYUVaoB7Jy/F9aETVplG0oFzwrLoTH2kzWjk1Kjxl+GvK?=
 =?us-ascii?Q?pct7lrwxyYLJuHDisfp+pHE21PRKXUu2SqcH2JfcmMyTx0yoMepx05p6JgGi?=
 =?us-ascii?Q?wxCgzv18hTRZkZ1zI0mfFlfsE5yn/HNiMK9cWyER58H49nWbR4w4nq6DguR7?=
 =?us-ascii?Q?VgxyXfb81SKX55UUKWlj/W9UvlpECtzGwbcRlZHAHlYdGNxRwBno0s8SWl7L?=
 =?us-ascii?Q?aZVKbtMrzm9HcDeku7sm8lRX37m0zRsPi16VtmiR5bU6cOTbMbo/9EN59uCf?=
 =?us-ascii?Q?llqCF45yOMJUnzBz7ppKoX67+5SUQ0xLI462ZFL1T4v9+PXYUYMiTuB3gpRU?=
 =?us-ascii?Q?+9H0Wk1IKfM+UY2m/HbT7OMBI3nRpiJ+fn632AyoQPEAcm+dRtLzm674dJaq?=
 =?us-ascii?Q?XFK9F+Zdz/9CUw4I72tSl05b04409ty9VmAt89FYUVorJwEhZ/l7PYhHtzIV?=
 =?us-ascii?Q?tRJYk1Z9Q5vc8gubT2VYweQhH5N4w09taUWG3X/j+N3cUTp+hsrpjeaTarO1?=
 =?us-ascii?Q?Nn908wZQmpUpLVgKLt8flPJBkF1eWY8yqhSvcpGuRr+jNdZt7CsjnykPI2e5?=
 =?us-ascii?Q?p9E8ug4vceJKrFjmJGKtJvugVzqCQln5bGNx+JCU6d70yCjXfkB2/La7o0AK?=
 =?us-ascii?Q?wSAMWhWj+xndbKh16+JaHaTjXu8hATGz0jDLsk3QEpz8NJzLmN45bJt7URWT?=
 =?us-ascii?Q?2QFKYex4XvT366G0ZPoaegf7GU5R7seA9su6rhUq50wNd7kwsvTzNdTsUh7e?=
 =?us-ascii?Q?75qpAnCvBRvqZoiqkQgYbUNwiNNzL4G5GJY64MM0MC+faMVGelGfODU8Mwxm?=
 =?us-ascii?Q?IBgTKf8B4K+UN3rcNTBR68+DndHcK5/222eb2M2wGy2W0VE/6cNDR0YDf/nl?=
 =?us-ascii?Q?Jg5Qx5ExAz+V4IKngdOYyyNnGLNIcrfeWr+MAvN/Npm6sAM5R4GbapYOoEWd?=
 =?us-ascii?Q?XcwaeIQtTHHptH8kGCgSeJIamlxAFAw4C/wpyU+MXDWc6FEZh7cMt4kssaM0?=
 =?us-ascii?Q?7zsF3/6+krxQa1i0pr7qRYRYCoqT/biUf0KDcmhg9k+BplPXZIJ3+AmR/C2a?=
 =?us-ascii?Q?Z4T93CmqT7D1at8dxoW0ODesdmk/YcGVyor51fySZ4RZN7zIn7X/otDfZvev?=
 =?us-ascii?Q?qHznYItZE/fx+IFMjAduyzLFjAYNjsxxYaunMs5NR8SS6u68owQyeIzlh0Ao?=
 =?us-ascii?Q?S5IjFnvbdi2eY8+FoN5KLQjExDUxxjKqvTd/iDz7T8OO1vvBlvxRo4N0r5w1?=
 =?us-ascii?Q?QuM6fhkxQpMRG1OMTvMXnLGbkd7mKAhDJIcKWVXOVy65zetuVlgJLvwtOzTg?=
 =?us-ascii?Q?TXtGlDT6G96kwNw/VKjUXiOOCHI/WA/bif5O0iZ28pRD7Tv36cIsiHbHLScy?=
 =?us-ascii?Q?FRz1RryaWprz1anh0mSNJh/JvAR/7YF6L3SizTKJmNtvpLDkKXPHh2MLzFmZ?=
 =?us-ascii?Q?Dc8Fj8cIFiYfyMYwdK1ChvTUyjvomOcadna/j+P4g87TQPx71/aRAO1qOLJY?=
 =?us-ascii?Q?3XvskBt9gX9zn/7ckiApRwrAyXSlcLjTybB7FtRfxHDAIIfEMOOKNtBjUm3P?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f45e263-92f5-4e9e-58d4-08dcde5a0eaa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 18:35:55.9057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6kKN1m9bUGlAzquFg86eP4c1lF3P+JzNeFCh1XRA9Qbd2CW4JyNF75PxId6uXKdVgw74IWdPqdMrYmE4oYnIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
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

On Thu, Sep 26, 2024 at 04:32:08PM +0300, Jani Nikula wrote:
> On Thu, 26 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Thu, Sep 26, 2024 at 02:57:01PM GMT, Jani Nikula wrote:
> >>On Thu, 26 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
> >>> On Thu, Sep 26, 2024 at 12:43:59PM +0300, Jani Nikula wrote:
> >>>> On Wed, 25 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
> >>>> > +/*
> >>>> > + * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
> >>>> > + * runtime and use a provided return value, in order to test errors paths in the
> >>>> > + * callers. The requirements for the error injectable functions are not strictly
> >>>> > + * fullfilled but this is acceptable because the caller only propagates the error
> >>>> > + * up the stack without cleanup of resources potentially allocated here.
> >>>> > + */
> >>>>
> >>>> I'm curious on the details of "The requirements for the error injectable
> >>>> functions are not strictly fullfilled". It's repeated many times, but
> >>>> not explained. Maybe I'd like the info spoon fed to me instead of having
> >>>> to figure it out for myself. ;)
> >>>
> >>> Understandable! I will make it more explicit in the next revision. Any
> >>> suggestion to avoid the duplication?
> >>
> >>All I can think of is adding a single, more thorough explanation comment
> >>about the approach to error injection somewhere suitable (*), and then
> >>have short comments referencing that.
> >>
> >>	/* See xxx for details on error injection. */
> >
> > https://docs.kernel.org/fault-injection/fault-injection.html#requirements-for-the-error-injectable-functions
> >
> > so... like this?
> >
> > 	/*
> > 	 * See "Requirements for the Error Injectable Functions" in
> > 	 * Documentation/fault-injection/fault-injection.rst
> > 	 */
> 
> All I wanted to know was what "not strictly fullfilled" means in "The
> requirements for the error injectable functions are not strictly
> fullfilled". What parts are we violating? What's the impact?

Yes, I believe that each of the new inject functions should have
individual comments explaining why exactly that case violates the
overal rule.

> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
