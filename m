Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44F6C3DA7F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 12:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733F410E969;
	Fri, 26 Jul 2024 12:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSGyeku4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6972610E8B6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721997457; x=1753533457;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Eu40cIXRlyKVYDXEwg6EwDHqFMEHOJQkpfDOcq+3zko=;
 b=iSGyeku4CuGzsaZ1xQ0Vev8NQHFYTFImVjqKRt/81nNlA5gLMARIEi6O
 axOaLlXdL+Whar4kUAQeYguEy7f8sxpjfCv7BtYpez2RvetFBo/XK+t7F
 VSZP+zVv5cST5lLJ5z+tJWtuBllCl1D/pzFqdXqXNsGgNhN4XGylhw0SP
 P1S8ziPvoTh9yyfxyTOAc/6Fa7qabfTL/cbkVfYQRZEQWLH8ZKAZa7eFL
 P9+dWbmPhGZE1cw8k8s3sWkbz/JpEyOo8O6ebo6SbF6+zYfr5qu0HrwQL
 p5fzHXLW0+U4SGSKFgN88Bt8pEyj8TXVrbuFNE6MeDiORbUVXb83wdQ5R w==;
X-CSE-ConnectionGUID: Vc1d3ZF1T428WI47yAjhGQ==
X-CSE-MsgGUID: kN5A4xdvTAeIgTYGXth1mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19659956"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19659956"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 05:37:37 -0700
X-CSE-ConnectionGUID: YrcunMJSRxmDyB4S4s0QTw==
X-CSE-MsgGUID: XXJaAYqVTa2wpnTvdJxA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="58084338"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 05:37:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 05:37:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 05:37:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 05:37:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 05:37:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EziGCJuUFQpaKIMLb01iRwmjvjUekwDlZI6TP0O7rKNYmznmmQQlqmHWmWinYiQpqr1g8ekFrhd8hcCoFXMYpufkiBEOyJTspA7tj4WcHlK/xZzCO2V5OnJX7dHZhJ0doNO1IMYEJScflYdN2vWjayY3WymbHz40Ta2CNoFqB9KEXCSj/sT17jV9w+busccw3y7JfaqnP4fmTJBgofOGv1o2qTZrbr3jH5ZT7Y7bNqa4zw+WAXW5V9CJY8sdVhHDou135vOjWyet5kSzzqXeQMXrS8GSs0eyRiH8OLOpRQ68gac/O6nXGuFY2sfc7WyOUCypl3w+PQGoetufGZzxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcUI3QG8Z7PRNi+rDRoOzP0DOcIPJCLO2eigi2bmqKs=;
 b=Fy/vDYd+XY5wpCEnV8+PWpesSAih/WUlD8f9PJm13UvcnBpLuIN0JnroyYb6I//j8xO+DJBSJuzQ8WJydzIA7268GMjlbIevkroYoXh1OyPjZLsnuFpXNL/Em6q1bLTfKvZ6ZG6lc11MUUL86tm9X56dZyMWh411p4iwO20HBU7a2SfkVgKRTE+M5n7xqyf5FR7mwl3kqPXP7vxqcRQPPVrhdBKXb7CUT6pOaF/Dne/rqwSPLewGuAn0LpxccvAlI/UzvZItExWqjzNV0My+6j97A+xeEGk0abAQtA4bfZW/nP+KjVUIUCSP7FPO4Uwgin1ZWLxVxuwda9kL/J9R8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 26 Jul
 2024 12:37:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 12:37:32 +0000
Date: Fri, 26 Jul 2024 12:36:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVA==?= =?utf-8?Q?=3A?= failure for drm/xe:
 Take ref to VM in delayed snapshot
Message-ID: <ZqOYWvU3HnXX8c/B@DUT025-TGLU.fm.intel.com>
References: <20240725232414.1958243-1-matthew.brost@intel.com>
 <172195507613.384426.14292273587651231613@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172195507613.384426.14292273587651231613@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2ecaf4-63e8-4cc0-c035-08dcad6fb85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gbyUdrRPEJW6FWmbHsmcqcZmZeWewp+Zy7htqlLJumMFdMQGWExSMkwG+aSb?=
 =?us-ascii?Q?p1zkKOkBaDkpF2irwjwLTTsO4sGOD9q2R0S20GqsnJNCyeb1pAl8SUcuxUbr?=
 =?us-ascii?Q?8Ezi9ltBIhLSY4IVS8sqcG1sPyW5epxosBq0p9aZ/8Z8FaoCaLr7xrGQ0h7J?=
 =?us-ascii?Q?oIdfx1C7s3uxoFNfjULX+ixNlAF2IlUMobsjkvFRpQepZfo9+AWTdbNIjnJo?=
 =?us-ascii?Q?fOEZZlxEto1G+U0NghXDunC1IRkg9ME793V+QPg6+pbXz14tW2XzqmjBwKd0?=
 =?us-ascii?Q?cu86Pt/0Zua+NfhjddrMH1rZ2R+OPvo9kf3hIqITlSoJeauD1qyrvRiOmfQP?=
 =?us-ascii?Q?S2nJ+G1RAcvdQLt67qokOmwI5X0zFOHJbDTTPALHkTXjCwzfS/95faa0DjDU?=
 =?us-ascii?Q?+nBmpyV4tl1Y81wShdQr6l17LN/KDrPOJjaJXZYXGxRCn8zBYHkQi68sWkh/?=
 =?us-ascii?Q?ayQCJ+2iMYa7Pd2wY6c+xZJBzBLwyZr2SAQv6RM6vbFfzm1/O/5t/X+uS8xD?=
 =?us-ascii?Q?70UcXEwsV9C1mOV/4QVABUcJdnCyq/CVGzilYJ9aXzaImIbNfYioMBC0z64D?=
 =?us-ascii?Q?ig1KBE8e0t1wF8yIU2CajO5t+P9D6pvNeh/ShMWVFJ7dAX3Bpi2vznE04/ma?=
 =?us-ascii?Q?6d9gsQrNNtqZQ/UVjlSSPk0hMRgEt7swFpLPDvWTqSnWbc0A4ZIvPylzGV+8?=
 =?us-ascii?Q?TZ8fXD9I3IvAKDoqsM0Moh4e0Myu3s6ENFGPxLRd2ZTI+RCvc9X6aS2y8ZB4?=
 =?us-ascii?Q?SMiFX5BZucVA2OOiaszBD0W1kCpoFJIMb7FaRpsfudKn5CQEp6Od1KvIwtGv?=
 =?us-ascii?Q?kWLh9r2JRnvtAE9rUntZ9bZw1xMwR4K/89d1mIQ/mscGWRwTMBFe/ZI1uafs?=
 =?us-ascii?Q?oEn0SD0HbbXSwZQL8sYEThCqx/it4AhPVOb7lSu3uqVrUd/OAuWhenRCqmS6?=
 =?us-ascii?Q?E0OE56nSeCpvrR4SYUNwkGKirhOuXzfJr3uxO9kFAXC03YlAb8GcUeLJHeST?=
 =?us-ascii?Q?Jm0+49MxSu4B8Ch9FslQgHrkJmf+FYW/uHMdNyI+PmCIRG3lWs6I27P1UGs/?=
 =?us-ascii?Q?3EO23QgAoxsDNifRus38L7/hYlBMsZQCUsUtszZ2jsQXBxJChB41iZozTO7F?=
 =?us-ascii?Q?WXlJZdcg8fkdoW6QTKzpkk7+gRzlO50PSUfETfVT/wZrC+Kgt+SUnr8Yd8+E?=
 =?us-ascii?Q?Asvc582ZrMMLFcCET67QZBcW7eEB6B8TdZB4/CXYkddKHfd1KKwj1CdjmSo/?=
 =?us-ascii?Q?EzCtMfm3PWdnSHrXlnWHA6YOfDtgRLUxUC3KieJKkuWcbDR8cYskWrKqNf7Q?=
 =?us-ascii?Q?TaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I5htWGe2vvjj8v4THXEMewPyOgISirVbvtHptbV6MO9dJA+eOkBxuBbCBsCx?=
 =?us-ascii?Q?t/IYiRD9sEn235mx4x64D/9zzu2VP7AunPhPqdj0ipsqCCW9zh4C7lPR3pHr?=
 =?us-ascii?Q?88mdmBau2Y3KAfNAoYbYbiNXz3Wt6NmSxvCiMk6H30+YB5iMBBV22pKI4Gji?=
 =?us-ascii?Q?8z9lf8PNKuMoPKCKgln93HvSyvZn26V8HDmiw4RGKqHElzbTKwGzQ0PR5+da?=
 =?us-ascii?Q?aOWuWi2f4PEJh6CuuxWFraTf51K8sMQrKQRIn4QWjGkdiMshB7uCn1idYIDX?=
 =?us-ascii?Q?Q8PCXXNRgJm7mu8cxyzR3c1yRUHjCUGZLBXE+J/umKc/U34LW3wNb8VoceYJ?=
 =?us-ascii?Q?ivtebAGCQXfVMdKe8p/aZmWwjMlkffyU2RzgP9H9iaXVqPGdvy85M+k5IR9t?=
 =?us-ascii?Q?XvALp2xwUr5lfusf+6tPiSOB+AzB54FG2820K5ko49Crur5nbQrf/SuxUMxv?=
 =?us-ascii?Q?djDoK50riUhGphzcr4KLZKsFw71QlJdiaVWj7rZ0ABTfuCFrJqCaMhMA/N6y?=
 =?us-ascii?Q?O59tv6jVw3RawkGdgb/X8v65cYRXqvcLOaGggZrGCYVugMhHxmqlXg4ZDPiN?=
 =?us-ascii?Q?2u6gGnlvGve/J++4u2HlAtzYXIDMAuXMn1tBDpZNPS9d6mE1gcvgQpZHtpyA?=
 =?us-ascii?Q?upVTIP9nRdYH/HTKBvZM+hn9m2nVrYVQEghIm5eeGy228MNvhZeSNWxHy5md?=
 =?us-ascii?Q?SFAL8gIYGTfEsAUMRqNvUTFCCOTtQ7jyVqzaBb6VvvRjMYUhhxKulV2Yy+7I?=
 =?us-ascii?Q?SeJ4ws3pniMDZX1vIiCA0LOhNZjT434wLDv4E8ddeLMm6R42tZzoyZ2IbHrP?=
 =?us-ascii?Q?lcKB8QkKJ46YsVGf+hd9ZjhdWps81/XJBBfPC0mDekm3Np9Ngzk46Xn7fU9D?=
 =?us-ascii?Q?4XLnHdmk3HwzKJ/RJ0NxnC+kWO9/2EfrtaS9ZkCYsbGkv/6gWBjbu0JoTqDl?=
 =?us-ascii?Q?kc8yygmDbJq+S6POP/X/hM2QFaG3jJyZ6GuQsxXOW5ZuWKqpEDIjjMns7ssB?=
 =?us-ascii?Q?8T8wpvGlRiiWNaQggvzUm8AE1WD4edEHCinVyumnAyCW+Kl3jsJmqqdAZJfh?=
 =?us-ascii?Q?fNRFfmdmBZDUunzU21AiJv6ff4VNELw1c6Sg2Sq6jnVGAwVa1FpNbGi1h24h?=
 =?us-ascii?Q?PRYHkt956zZZlvDUZTPRDVkXeUj6AwjvPT37HHmzoQ1CssWyisMEatcdEbRf?=
 =?us-ascii?Q?y6bW5/iYle2bjI0OATp33GK1TAILn7YhEUxSLGdw6czyGF+fz0w5vb2yBton?=
 =?us-ascii?Q?kvH/8YUVVDpiQtpEUs3tUqn10sKvs0fTGAuD3B7FR6cnSHHC7jgy/eyGGvlN?=
 =?us-ascii?Q?G7O8qpCr6hsZdT/wB1USxqFH6O0vKzHlm6Xam7lKaC0Xnv6YhbBzXIUnFnhM?=
 =?us-ascii?Q?J05+om/ag3wfpi2zWnwN0a81uqV0vClYID7Elwdj30CZdo93PzjVh9huRCFy?=
 =?us-ascii?Q?oSfnpwT+rRM+Tpld3OZ5OEpmnkFZ/eKP4/QMyOqs1Hy0GFYdyQfoXBW09BrQ?=
 =?us-ascii?Q?l6YHc4f/cFkPXKRpNUiukBzd2J4zsZdKnBdak9xY3UDvGGWiy2+jrlvaZS5M?=
 =?us-ascii?Q?mINJypAJse5MkML+2n79oBZbd7sBuUBIJf+omCOCHl9SNmxKqEPA5A56+wm0?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2ecaf4-63e8-4cc0-c035-08dcad6fb85e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 12:37:32.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knHGS94MLN0TmZYg4MWHwkjyWXtolpsMds2NpxUCa91ksSlt8p/Kl/Gx/bkEC0mM6QGSD97ZJph9wKQdWk3Vlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
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

On Fri, Jul 26, 2024 at 12:51:16AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  drm/xe: Take ref to VM in delayed snapshot
>    URL:     [1]https://patchwork.freedesktop.org/series/136541/
>    State:   failure
>    Details:
>    [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/index.html
> 
>  CI Bug Log - changes from xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2_BAT
>                              -> xe-pw-136541v1_BAT
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with xe-pw-136541v1_BAT absolutely need
>    to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-136541v1_BAT, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (7 -> 7)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    xe-pw-136541v1_BAT:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_debugfs@gt:
>           + bat-lnl-1: [3]PASS -> [4]ABORT

CI doesn't like this as is, this is needed but need to rethink. Let me look into this.

Matt

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
>      * igt@xe_debugfs@gt:
>           + {bat-lnl-2}: [5]PASS -> [6]ABORT
> 
> Known issues
> 
>    Here are the changes found in xe-pw-136541v1_BAT that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_frontbuffer_tracking@basic:
>           + bat-adlp-7: [7]PASS -> [8]DMESG-WARN ([9]Intel XE#324)
> 
>     Possible fixes
> 
>      * igt@xe_evict@evict-small-external:
>           + {bat-bmg-1}: [10]DMESG-WARN -> [11]PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * Linux: xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2 ->
>        xe-pw-136541v1
> 
>    IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2:
>    1c38b092d18ce973d9ec31a4ab097fbc344ab8f2
>    xe-pw-136541v1: 136541v1
> 
> References
> 
>    1. https://patchwork.freedesktop.org/series/136541/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-lnl-1/igt@xe_debugfs@gt.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-lnl-1/igt@xe_debugfs@gt.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-lnl-2/igt@xe_debugfs@gt.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-lnl-2/igt@xe_debugfs@gt.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    9. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-bmg-1/igt@xe_evict@evict-small-external.html
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-bmg-1/igt@xe_evict@evict-small-external.html
