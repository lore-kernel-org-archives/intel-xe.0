Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366E5C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 22:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B2810E8E8;
	Thu, 25 Jul 2024 22:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxIy0DOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D5A10E8DD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721945939; x=1753481939;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ko+M3Vgjal1NUnRCjMMOhnZ3Vag5u9RTB6KBvRz7U3s=;
 b=fxIy0DOTVNmKcuBx3CbZiUCuMkwQUHlLdLhwRjMI8UeWSwDr+1oid3vM
 m4TMODRcJQ4cUUkV2gfdqXp9uNlJKG11VOPpnr5TjQuEGjAh4HGg/RMfj
 onxo4X0gDH8kQGqcDxmRhCE3NNFPOqg3Cj0/0hmHEzf4/oKY+dGYPB5dk
 izPG0aImXqX7hwMUkQOe8wgggDUPTONhtu6hYtBeLdpSwUWj2DraJgdTl
 ZEWqgPCfTXbYA8KCo+ZC1tHA7GKYnFJCZSHoATuFKpro2Oh14h0kqUzzM
 t/A7zM9zKRdtYRTfj5VOmEbUEHuiuHHF91wF7fejmKWKSz3vFk91SmkuZ w==;
X-CSE-ConnectionGUID: 9/z3ltviQUiVXyQWxEcITA==
X-CSE-MsgGUID: Obxiw8akTLW5hQJk5Fs3TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19679022"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19679022"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:18:58 -0700
X-CSE-ConnectionGUID: 7cV5xZGAQyKl/mX1eaO3bw==
X-CSE-MsgGUID: DjNy8/VxQPGCArbYiV2xPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="57866091"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 15:18:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 15:18:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 15:18:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 15:18:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 15:18:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaaS4BOI7kWRqBOPlbv3a6e2JgnLl3GMWUODNJXt7apoUjeem5o18uXGbSkcGHEfFFn+2l6qDmrPKZAH8u5Z7wJttET8xprqr4l6jiN07j+1orgnbp/06nG4mUkEDSPqIYNn2+929vLCr+A67kgrwkh0P75z5S9YIjCtzrbU3YMVkRJUYICjWEr2hiKW5DzNoP8ZwXSJkWboZ4wbdSgqrCUNWkEjbSkrbBfOYpalg7PvgLmqciWnDbzVYssdWwEv6ft0lgk2htwNQa174PsqKlPlIgYQ/2RwEWADprTAvAHGlBb6WXLyIvc4ER6p+EWq74wocDhX+yg8xMCa0UOpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qxcn9YP8qn+xWOKHy6aFKwNmb969jtTMQG9PaZOv1Is=;
 b=zM4eSwSTOSnl7qsQ2lOGy+LqSSENvGzh3QbmAey69sXmhsyTl63WB5hm3GIAueS2gMmWOSX0cNAf+F51WwJ5dX8Ft4AeYqz0wzQt0kt7udbQHMV7tKMydem0y7BYCqnbgeO94rJdTD5N96447L3bBmfIf5Lt/s37Aeqn9hmKqJYaMvwlzS8JRbwxWeawtxuaEmqWAlZNM04UB3tblefDjyFlClOC3J+j34RML6woU6ZGGDHr52VLxRbuUD30jzNAVp4hIpuH9Tn60aTM8VVfyJNJx7GJo8a5cYjPBYjz0oCUvpBi6SW7jy/X9Is4KTl8pXDrlgy1pqtqOLUHhyYgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 22:18:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 22:18:50 +0000
Date: Thu, 25 Jul 2024 17:18:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 0/5] Fix rtp when processing OOB workarounds
Message-ID: <ig6tzczx5vlgnni2num5a53w5l3opf7b7qhq6cvrojijves2uj@psdnhehuu55n>
References: <20240725220956.737987-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725220956.737987-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f01dfe-19d5-4995-9558-08dcacf7c283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fo0C2zFDocjK1WxhTnJuIEQ+HE8t8PygDDUJmiwLQLiDZW8I5ifdaAxFGR42?=
 =?us-ascii?Q?+6h9ZoTSocEQRBj7gKr3duWIyC7DKniF8D3kGBrEecMbxkwm1Cm2Db/wzF+1?=
 =?us-ascii?Q?yE5LkhjvL9+eWlMxKNpA4OmSqnqn548d72JbNLQ4KCmS8tI+n4P37SC1bq7a?=
 =?us-ascii?Q?GktIkm1fNdgSHdBV7uJGHhT7MHix05gk4dv3rn0BuIQaLliAcfFXei9z54Mb?=
 =?us-ascii?Q?I1kCDdEeSraV10JWo4ITwexNcmbhqv6doCoh6r60IVXZ8Z9ADgLv+MHd3ttI?=
 =?us-ascii?Q?NotGExY1K5LuEvIWRfLuD488lC+92pDu+JW9iX4F9FV62BdJRW2mXpN3aM54?=
 =?us-ascii?Q?uLgSvr/2rv6uG/oCNoWPXVyL9JLMZgpzd6YaeltFnl/REPlspaZyoUwQaAA6?=
 =?us-ascii?Q?aQtOmpYbNkbjW14uPu20evbVYXU9t4QVyoN6QKJ2LoJCR148z5BHhXEtzakN?=
 =?us-ascii?Q?RkT6Gm1Dcy8BHLi4xXX1frvYBxiL9E4kkEtBEvXs4YPiJ0MuIkO3u+fGLQ6x?=
 =?us-ascii?Q?dESGy6HXvJEtNk9bflFXwHT7bhtgzK0ys0WhEgzBYJkGLjRWDFlfdYe/hzNi?=
 =?us-ascii?Q?pNgdr97/y4NRivYqi49mg5XJ0SSc5cOrv5jv5AuWqmqy/3AdE4sZpq2LNkep?=
 =?us-ascii?Q?lpsasMG1etRVe3MKwDG4NZFkEiTs+yvVbKJFBeu1WeMHC4QZRNynkGEGmoLe?=
 =?us-ascii?Q?qW/3Uz6piY+FjVeerr8qjBVaGGQlsRh/rZjF7T9XYFl8k+KEFCl869bU3mB8?=
 =?us-ascii?Q?y1IejfSjnQRvNzypQp9MiL/FWtjs6tpRaPqhO+wNj3KA/RvP2eqelWtgTzM5?=
 =?us-ascii?Q?CADY/Pd3ffHei+qgLM7AcPXmcEsPyA99gbBLBsYHflzBbOJDo5G0BcBoXL0R?=
 =?us-ascii?Q?RkglVMDpiLBPeoiMoy6Lb/fL4Hl8IaVQBkmIxz9D7z/+oGfUPWtcvehZ8GwF?=
 =?us-ascii?Q?oVxzh2quntjKLL57zOmQlWHkcvFVCy+xRKxVz0Zvx/iqH6/dlQ8H/j0tR3m+?=
 =?us-ascii?Q?wAJ/bS8dAcGifwXzryjtGFe11REwlXiFrt8EX1IgBkPHdisnVG8qlyObUMQe?=
 =?us-ascii?Q?cl76eNxlyF/ZdYBqEaiDIL1+uHec0plkf3W5ttG7AAiEnK/BdkCoeH9KVXK1?=
 =?us-ascii?Q?nv+9pDwGaEeRFdsG5tPAWyqaUB8M6gDojoVcf2VFc+ftXOUF17pWyOluOvzd?=
 =?us-ascii?Q?FvvkD/eTxxJHV4CxmBOS7A56kEltXkta6FHbtMrNAqgiMRsrgQC2qZ0r6VMi?=
 =?us-ascii?Q?Y2I+wOYOiiVbU36Wx8E1d170DiS7ErbU9GbvTgupjUthRXmfEp1By34IcxN8?=
 =?us-ascii?Q?5qG47NdW4EwppZ/jT+rbUoshPIHL4y1X+IL9G6VMEFSJsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynugz2vHrg4bKVjkOq0yalPLS+BstUY5+Rv/QAqlipmvGn7tvoOP5oCkyw1g?=
 =?us-ascii?Q?bywHi1Ao16iJpJnPCM1EdS039bSOfyVXI5USAt0MYCeFL1+RtlfgDoWqf874?=
 =?us-ascii?Q?b+gQQMNWkkVVcg+e3W1hAmkf8zA2dneggNq1Ie6rBxw0fJvHfEvAW8i0jdof?=
 =?us-ascii?Q?3oU9Wz7m7sP6ouaUf0obTgN6ch3Re7e998dfnHCdZ7uoKPPki3Yx+fWeXmoo?=
 =?us-ascii?Q?UI7OcvqZNeWx1HK4J6+he02MVtNeEEu5++YX+sZ78PjZz/XZgmixwt65byLB?=
 =?us-ascii?Q?rx07C4TWNE58RUj4hYGH8I2+Mld17ydZ4srri9pQuwMHmZ3rH87jwQgVi6EF?=
 =?us-ascii?Q?Oz+zLDM9Y9JG/x1cRacs4Q+tm3/e9vZl+Ov2zd9yRA/Peko3Wn/VKITELqiI?=
 =?us-ascii?Q?ijoNXJsFeGXrYu7sSzp4uiJMfrVm1UiLf8fGDojgwYbHn0Zz1jmRWNRM/sSg?=
 =?us-ascii?Q?6RI8+W5rTaDiJK0YrIvNO26rWdtWAxkLLOhyDu1SPLABm3HP8+EFOivZezan?=
 =?us-ascii?Q?YoVHvkvkNbYfwi2PxZWTEXdqpYvl9t34rhTXk7Hyx4q52IefbVAtp/wSWCzU?=
 =?us-ascii?Q?10+r2OjKVMn169jbgtHLq4iEehOdYumkPt+xzh3tcDlGGj+ImJA7TUeDA7iH?=
 =?us-ascii?Q?wsCn6XsM+X3ePZr6oqluXIDHTHA6O5OWK1/G3gIVLzgFHORUyIzCm5IzEzlU?=
 =?us-ascii?Q?DqNF3jG8FRWGXhbY8mqpeoCLY7F0zNNHnmX0WsyRWIDAKNaBRHG43gw2W7Sv?=
 =?us-ascii?Q?gmEU3ysBv8bbPWg8GE9g/JPvIa3TT4sM8V45tLg8zSLEahdZv8cWVi80UBtR?=
 =?us-ascii?Q?oUe6jbJrRSxvUgusjRkgJdxRzNrCSCmKht2ScMCMq7n9C/PR436/u2ssflTq?=
 =?us-ascii?Q?JZnE1VQjf6Pn4BsZWZTLFv0QiIhZnLZPC2Oz8Fsa870NQ0o4mB7lgNQT9IfD?=
 =?us-ascii?Q?KyN7p1bSlLSTZuGXywz3mQshh36GjavJ2RnmACO5J8I0a4KSX+0RJNSKZt9K?=
 =?us-ascii?Q?Q6duRVXzU420GrgGMkN52UwDfyZDh7PJHAbZMO2eXT4ktCVfBNNIQMR/x90Q?=
 =?us-ascii?Q?GKIGbq6ckNmeCFhgKHojwwMOUK0zEpPcTnnNa+hycvcoVxb+2dA3ytJkHcI9?=
 =?us-ascii?Q?Wu7u4YrTJ7jSrehXUOSC2joqHzgayu5X2eZ3cYdrOMac0A4NGGzo71ZFKAxS?=
 =?us-ascii?Q?HoUBySlYo/r4KZ2/CRHS54NdPP0r3EOdsGWNllpx2laloxfWwuHo0bW7lEK3?=
 =?us-ascii?Q?CNrJgzszO7O/xLWkgCkGuN7OjMK+xydM1JQWrkFMuckIGOPPEiL0U6ZZjiD9?=
 =?us-ascii?Q?Ku5hC7Fw4lHnUti4wY60Z9M+lVovcGFot5hPu3SKV1ZAX20/gUYhUjHAd4Fn?=
 =?us-ascii?Q?LwpjBqVQoAGkg6oFDHVgGMHCKt6WL4ppJgj0ADcY+vdjP9wt6OuwDHt8344M?=
 =?us-ascii?Q?K0vrDvIqPX6DhzQAPjvG82MsYRoH7Q6egpq+jVlanq+XmlS+lQel2TVUzRqg?=
 =?us-ascii?Q?cBI9n5nz4Ymzvuiq16UJmpNjiCJhgl6HSbeOoANiHBmR+lE1UfV3StGOd4sy?=
 =?us-ascii?Q?ZdiEhPOWvgIgHQREfoFHotMzId60SVbgTFVVUeLlWAG+E1k7V/TO3Zgj5wKK?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f01dfe-19d5-4995-9558-08dcacf7c283
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 22:18:50.1322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJiqDEw1tFQvtZbBFWQhO5/UEsTb2DfSuW9ttA6X+rxn13lkZMRv6KtHAATsjOI2xU5z/b+LrGEt1qs34r7IHBVNWOta+3J7bJpkxbczw3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
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

Ugh, fix Cc. At least in the cover letter.

Lucas De Marchi

On Thu, Jul 25, 2024 at 03:09:51PM GMT, Lucas De Marchi wrote:
>First patch is a quick fix for processing rtp entries that is used by
>the OOB WAs, i.e. WAs without an action associated. Thanks Gustavo for
>spotting the issue while browsing the code.
>
>Second patch refactor it a little so it's more obvious what it's doing.
>Last patch enabling kunit test to check the active entries. This still
>doesn't cover what caused this bug since it's only using
>xe_rtp_process_to_sr(), not xe_rtp_process(). We should either join both
>into a single interface or add more tests later.
>
>Lucas De Marchi (5):
>  drm/xe/rtp: Fix off-by-one when processing rules
>  drm/xe/rtp: Simplify marking active workarounds
>  drm/xe/kunit: Test WAs for BMG
>  drm/xe/kunit: Rename count to sr_entries
>  drm/xe/kunit: Test active rtp entries
>
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 53 ++++++++++++++++++--------
> drivers/gpu/drm/xe/tests/xe_wa_test.c  |  1 +
> drivers/gpu/drm/xe/xe_rtp.c            | 14 +++----
> 3 files changed, 43 insertions(+), 25 deletions(-)
>
>-- 
>2.43.0
>
