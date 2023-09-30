Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B29BE77354
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 05:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D03E89E33;
	Sat, 30 Sep 2023 05:21:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9E10E1BA
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Sep 2023 05:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696051315; x=1727587315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0YC+Fghkg0tfaqJ8xLcbQwAEEEHkXuWLZ9kGuigi3kQ=;
 b=I9DvAhlHwFm3gI4PNZZNkaqn01F9fN/NI4NViG834b19SF98xMlIS+P3
 pJZFYrwQcYJ1W1kJv13NrAc0c9J1c1e7y2ch9xi8Sy6KnCR12ZUsEES7f
 g31DFD9onEQJk8PiD72HAuUFlLDLzjkDKLfQveeGhMLLkx5JEmHIryshj
 pHSFKi8AW/9qNbygWtsikswlz2ex+L3Aa+A85YPL+E6hbAcczw9smKMDv
 S6y77bK0CIC+W5Bpq/17+Jg6s8pgltYVIYi5genh6w+ePTrS2krys0Ijm
 9jHB6qjLHTHdawxHvsxotT8piNreI8jZ6iaViPQkQQXW0NpvOKbVadspm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="382332670"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="382332670"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 22:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893655562"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="893655562"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 22:20:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:21:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:21:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 22:21:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 22:21:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5Ai3ZRDXgflAfwtSLFWcfFxO9JmUZaPOul5UvfysRVnJSDz9dvGEH+g7Ems9Be1hgan7Da/4zMP9RRpOiiUJuRlZ7GKfQGJ9wMlXVu1HecBLm/ct/e34ZC3jb/VZmcbdAR7DUrRC1TGBxLCNPwhyOJ2VEINjjbdqjoJQrD2cuA6FXBp6oaccgNdIf0/MtgbWPatQy4B0gAu32osP7b5L9xqoFursiF22VCspxUHQCbxmC+BjiSGJv0woo2f5etUD4PGYo8rjLV0u5b7kfqnOCeOriig3dW6PBkLkDpyq+D/dTt4VGSmdxa9TIp5MZLB6WfJSZxI4Zq2SQsqpEWjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+c/pYODzDG4gM0oWoD1N0zI/AyO8NBxOLjT6d6tMF7c=;
 b=S4gFr6vTtyFMwC4D1d3jgZOrhQV9gjsd4YcM989G2hwRWbesOBEY7jwBns2aWBHKLPFbYMdLbG1Wz+H8lvwm7va/m+Qk9m69iufbeM8qoF7g/eO7AeNHmxMpouYtyIoAG4ncH5o/FmNeizhcIquGIr0UCte2zn0g41+6Tobkue9jrd/L8zN2d2y6NW7c05Wa8Bkl7dM2KZsga+0PzghJqh6sjMrCVU1eQZqK5iYhpS6ojzgWRZq843zcftbB4XPfc/Wj1alIcxupILYewG9NiCzmePtq4QBLykQlyiuf5FfCmOCyHc6TfzK32xpcNe188roe/fGkxvhG44Ll8u/43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Sat, 30 Sep
 2023 05:21:43 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Sat, 30 Sep 2023
 05:21:43 +0000
Date: Fri, 29 Sep 2023 22:21:40 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Message-ID: <ZRewZJsTcFKR6qop@nvishwa1-DESK>
References: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: BYAPR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:74::28) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: e21696d0-220b-4f97-c95f-08dbc17521f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z429SG3lq8qn4Brn+8OYpNymuxvc+CU0is1n3X+4ZfgLwhu9WEkuIms2dWZEXhVo2KUZZaIsGgilihVgUJOe/2dlspG+OafnNBrn992XcbGJU2+JIY21Rb9PRQNUgd0KvDruvHSVZK8GBpJlnO4opiR6xpmVGl6894AKJlEoSPlTvuD8j1JsVDOMnqNPu0w1q2y4JGN9+xtCxs6ceEtpnF1bYA4Uvs7oNvBGeC2Vxm8+TKNx2yfT3KGoZf+qRVm4yWpFhft0EqxQX6D8SjWqLIaZdMD0lrLuqCA8j7Q2hsKIMk8dJbGrbXDxWLHSnUAu5kepbF51iNTZUwHsxbgGl5z+yTtylUSS78WIMVkrW1Tm99wb6jGIeohXzpZmwb2vIlDH+lRsxsIFHEAPZtLnEibun44MQSXcI+zX9h6YWRDoRWQCAO+xsVlkiR+h3thjVjP+oAqWRyCrJGONPssj9YlR7SeHLDtHp/X5YYszjf2kYB7RfNmKmHelLZTONWE1mxGMG3n2ofIQAESm1CZdaidxlaR1ecZGm942XhJjvTmhPY1a+6xCyzNRNA80xX3/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(44832011)(5660300002)(2906002)(4744005)(316002)(66556008)(66476007)(66946007)(8676002)(4326008)(8936002)(41300700001)(6636002)(86362001)(33716001)(82960400001)(478600001)(6506007)(83380400001)(26005)(9686003)(6862004)(38100700002)(6512007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FtuaF+2iDq4ji/AsUqgK9xSnlAVoOa5IMy62q3XUH+V7xGqr+ZmDSgiqqsEj?=
 =?us-ascii?Q?+8PkA9s11po8iyPALpLZZ6bXzad4mzo1047jaTKU54+UrI8GmAbqM9+BN94g?=
 =?us-ascii?Q?HWLW9/Bw4YhRrbAE5sAwCKDFb0bxySiFuW8LDeyDy4nf9e3HK+WW0nYa/AHJ?=
 =?us-ascii?Q?yPKi2v0Som+deDq0CPHDb+uXNk6DzkWvLaY4qY2Jr3qVZaloqdo+fOw0eQNz?=
 =?us-ascii?Q?ZABlIIq4u5VT75nhib4lTpNo4tzW9L4h1LGsW2HyZlvLvECgzQZNwLy15u6a?=
 =?us-ascii?Q?p4fH5N1y7SZYlPhIWPv1qpuzdmwpSOLkiwXHOUg45mVaID7CmqYMUPggkVR2?=
 =?us-ascii?Q?Y3si8KBSwB0DkFuXdyuuZBBZZTOJXyuHHm6od/SEBnxhdEDGVEN7QbuWI8Ee?=
 =?us-ascii?Q?sy4FR+ZwX/L3+v3oEx3HFBuKM0Rr2syPRJpTsq8EQLZWh9d7uV0TTcIBvuGf?=
 =?us-ascii?Q?SzsAVDgKvWT3wHvw+xFGVRgZldnfAUr/rVknRP6qRj/I7+mnI4F2ql325vQQ?=
 =?us-ascii?Q?iOPxZYqRi95gArfWjoMZEfhoBCBfhhXMd0VA/yTqEqI/grwEBZSlK5UUPQSJ?=
 =?us-ascii?Q?ylrDKq1EH+LOHYWyOgY1Txpe7wl0bQV0U+x0JC3rDe/Nt6V+oLwuAfxBjqYY?=
 =?us-ascii?Q?JeulYnDCWvVboK7SflovZjhY331rjhOaY2Q3+gKbX5Hi11wZMo2DWn7qh/xe?=
 =?us-ascii?Q?0BXz+MPrlq3PBd0QnJqilpEKK5JufvNrjuadjhZ+iNQrN3F1YSOig02e2oHJ?=
 =?us-ascii?Q?fuAx8NNdO+GXApd4cmoNm7NKJubr/NoFpGJVVwsFutlojEpHmtQOd9kKd4ss?=
 =?us-ascii?Q?yvKqrDgxyyKdsmfs3zFgyxMVAxMG0tdKQWFyXIbuN189mpsZzh1u+7PgUk01?=
 =?us-ascii?Q?kspdr/ekdYnzopPGgVr9Wj8AUqy8F9QY4lo9IEWqRJmAhX5BT0/SnunDoeaC?=
 =?us-ascii?Q?seZ1rGiT4E/AY8USv8H4gi8QbXJtACZWV02BRVK+Y+lb7AjxhMNEk81c3H2B?=
 =?us-ascii?Q?/29MEyGOwlpb1q/P3kpwQM+ooLxbcyTpccfJUqCRoC2GB8QtMQDNSNcqnr3x?=
 =?us-ascii?Q?RtcOKD25LbD75IMB8lFSdBgl1pWCQLWGE7wg/6RYrBLN1FCS6PES3MFNJQ9o?=
 =?us-ascii?Q?Epq21EJXytk6PVlpihksQhTvDEspAkTQgUg/U/zuS6ipMzQMk/PNU2HbJoQ6?=
 =?us-ascii?Q?xqWSRcu5L67alQ9g45urhey01KpPr5e5etJY9Nje6hQnruOgosWNDeRkFzUt?=
 =?us-ascii?Q?UbolS3x3dQxj3+ZQSzbAsKEpaE5qY3UUjO3aj0+vPYXEgNBvireDnT4APfxH?=
 =?us-ascii?Q?vLe6gy6wCV1wEfvx5K0GRy9rs7JWFaFD8FVqXB63g+0iu5/PU+9J22sPNzO0?=
 =?us-ascii?Q?KMA6ElyAt9f7k40bxQ/f4m4rV04UtsgU35S7Tqc8hEVB4E89X/11FilbaWnO?=
 =?us-ascii?Q?kqdtSMHzXX1ILIKxmzxkhDVV3SzVQXuOBetl+KIVwGeQ1LY4gswr06BziP0D?=
 =?us-ascii?Q?iix6x92Kv2b4TcDpAVfFFbyV3Ov4r2lIX6ggTQxQpWbyZqUNgKUgCrUe3UiM?=
 =?us-ascii?Q?zeVCRcXbtfaP+lebHf+agddhCfmVhYrGOoDJlvp9P7O80yk4EqDVKutLQAvq?=
 =?us-ascii?Q?SaFcf+uhDrgLU0fNhe/jacs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e21696d0-220b-4f97-c95f-08dbc17521f1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 05:21:43.1976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1GDUAuNcMODODnj/HmjmsqByo3uI7vKRQ/OLTw+4O8av6W93VxqP/HzqQCwyNLki3mgR+g9rqECx8F/HaauH1WI94Rd0VmurCnCVBHB5aWLyq6OOmZnjoZaU0ebrSES
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/vm: print the correct 'keep' when
 printing gpuva ops
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

On Fri, Sep 29, 2023 at 10:31:02AM -0700, Paulo Zanoni wrote:
>Unions are cool, until they aren't.
>
>Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 57ffac324564..e72380cc832e 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2351,7 +2351,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
> 		vma = gpuva_to_vma(op->remap.unmap->va);
> 		vm_dbg(&xe->drm, "REMAP:UNMAP: addr=0x%016llx, range=0x%016llx, keep=%d",
> 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma),
>-		       op->unmap.keep ? 1 : 0);
>+		       op->remap.unmap->keep ? 1 : 0);

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

> 		if (op->remap.prev)
> 			vm_dbg(&xe->drm,
> 			       "REMAP:PREV: addr=0x%016llx, range=0x%016llx",
>-- 
>2.39.2
>
