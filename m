Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314A6C6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 17:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E727310E52C;
	Thu,  2 Mar 2023 17:48:05 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2489710E52C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 17:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677779283; x=1709315283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AMWzmwGQrymTK1fZsaGBjAjcQ8ADzryplAKssW00CKs=;
 b=a5fru5u/tWxf2Odl6Q8CCHA5ELubQoCYRolj59z0VBXHlgmQ6fxZ+hyf
 gjdaSambOPe1w93NB2O0v+CysDnDjnVuwsDhb1Vj96t+4d0H/OoUPGTnY
 ht1DqF4IQCe4QlURgkXIlBv6qmgVObmltEndV92aMKNPGRsp2IjlvRGKx
 m81xHGTNeWsbdyguDEZf/CfyDxKpCcH+B2mTedJWwRX5T5oBtF6FxrN5z
 68Ayup/pFk0moq1JANt/USakN2I2KYvZ1piOLv3AG913iNwXImB6BizvD
 IQ5gTexWLec0OPBpvbe3AB6HTJtOMhnyQ5umTBLLvKnBibKrRBDKqRQfg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336314559"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="336314559"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 09:47:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849160039"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="849160039"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 02 Mar 2023 09:47:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 09:47:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 09:47:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 09:47:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Mar 2023 09:47:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzQHnhqJRMOoHHznzB1jcAJUwudkRIvea3ol7bU1KuVcr0/vPbrrQXb1QpOTl8e8g5UjGwBXJrz6QiYHfkltFCAxsVF0h/97z4hr8Hy1rBSwcZNqG50rI07iUanKjz58xBAzRGfFG27Ex/vNxMOXoZ8K2wXQITNZrzbqkKo7uCEpHkaevGATLBFRew5g8GlMkOdBexJh0n/XCog4tMQsOmSEIiWiBOf7/0BNC6foQkHodDH8ne6nlvKiETN++KQ8WEirwGzSxZynOn+gwzzHQZwpzY2E28CrAtN9kYISs0ZAe+XywsK9yIMXV/jSHQR/V1tVPxnnLc8TL3aAgYj2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lle+QmPq/bQz7tm+oFSSJ6rf+wzKGCYM9tf/XPDBMgM=;
 b=Cy4CxhuOq5ezU1rTf25clvwe89uiCE6maPYWHBuY89cdPRzZFRs/Lz/W/liaIlNfbOj3M5RKrTbL5X68yzXT+1TGTiaINVHfxaHpTT670WrKkGtufmrNLvUXLiU3DsoMDmYxq/2n3vUne7Ve+ZV2iKPAVOZekO6/9m3qyZR447Uq5HzbK2JtYRejbEFwRoHvKggbDcD8gH7CJsBM5iyUgG3R1gkswtSGkRGy6v8t0B+7OzxbtQ2RLHO5+MzJd5q/KNDLE5rv8KQRMHOezwC2JammvEEl86cPiTPAj9AV+6pnRlKegKGLW0Yrd9+kRk/NsQvzAagGz6fk09ANty3muQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 17:47:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 17:47:39 +0000
Date: Thu, 2 Mar 2023 09:47:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230302174735.nstcblrzbhuwbhox@ldmartin-desk2.lan>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <167776720634.20552.13587908549080764345@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <167776720634.20552.13587908549080764345@emeril.freedesktop.org>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1ce432-467a-4d63-2de9-08db1b463704
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SyEiBiDgfL15bbfrdlpUwFWjiX5jyQrD3lnml+mhMlBDP10vwqSOTprSmtzrI5UKefKqj4hlceIHIb46mPytlrqP6fE4UcQczdjjsn7DeEyMh4yELNMjw71lV4wGjQvXciJiKUdKAOZBz5S0wcjOmMbwsx00g1MZ8f0dotw4B5S+TiY2NH0jdQ7Z2i2sFLRFO+9mLOaONTJd6RDzDpW3ri1jd3aCDFo4kpZVYL+4xTO/S/SypCFVnLmm51dCnPWFegh1Zdd6Huh3aLJf8Kutw4LAq6IBnEse/kt7H+Np2A0+501GJLMGuATPr8kpFG6DJyAv8rbyi4T7vPvYGVg5+EeD6oC8GEDoCSHIZRhz9EE4RcmWqznBExVnOYJ0JT+hIk7nGJWnP9B9f41BLCsfBqexOfMSq2sjNZwkzyEoDnK1BxkQXI7b+/bB/fLL4pAEfVzzWzEicoVaygN2t41H5FAYfHxIrjuIRyq9nDAb4/6x0qF8+YzKQMd5aqZKmteEyjZe3x0wLWXIV4t18oB4uyxzL7q0a2wksa11IZpQd2pM9NvOBTxMO2QC7ujlvL4Pddm0arsJRqe70KEW4QgdRraPl75013DkL0MGBt/J5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199018)(86362001)(36756003)(9686003)(6916009)(186003)(66476007)(66556008)(66946007)(8936002)(41300700001)(4326008)(6512007)(966005)(6486002)(316002)(478600001)(6506007)(26005)(107886003)(1076003)(5660300002)(6666004)(38100700002)(82960400001)(3716004)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V63tC0q3+1JTM62ldKmOd9vQ84bNBInNX5XjCpjH8CnKIVDiFgfcYvqSG6pp?=
 =?us-ascii?Q?5F0gIPfyoWoOexslOi3DxFQkGCcATwATe6/kqIzq5Trwtk0gv4KB0j/azA1W?=
 =?us-ascii?Q?ItLpIFh7x5mMwuK83SEadTkGJ+lbZxNRZo6WOiASrRUdIiCXNal3aznXPZr/?=
 =?us-ascii?Q?CkrSh3FkcvWWIig76XWhUjwjhVH5sAnVqOVLkIEGe10xySHii+S9laOcH/IH?=
 =?us-ascii?Q?Woqc/PpR6ZhHubR5enHORqtdR2q4aEnYTJy8Pe/4pn6j+pEVsoZ8ex9GttUl?=
 =?us-ascii?Q?A4Hh15HHHcqmC4YLYKHKY+H3UmYCbEaiiKKix+UcV98aXaY/2ZSC1qWkZ07B?=
 =?us-ascii?Q?qMPHrz/lqwPSgWMh+2YLAC0MhzotNkJoDFNqTXfgz8QmrpyGxHtKznYanyD9?=
 =?us-ascii?Q?vGDUhPDhBg6F4UJo7qeRV372KQ6WubFlo595S46afHE1jAgm/9QAOvvEbbVs?=
 =?us-ascii?Q?vOHq+JjVADUdc7z/M3EOEKsJAS0pu0piMlDqL0wBQYHcOOBzFygt8VOnKZJP?=
 =?us-ascii?Q?+UQY1/OgyDuezjcdWCgrGZNzpxzt5DwsVDL23vqXts0ZlU8TuEFqoSgmDYYu?=
 =?us-ascii?Q?NePYg66d9PEY0ibWJQteq3ZNK0C68AHZqo5llBhJLKEYCF7730oYd6OsyDK1?=
 =?us-ascii?Q?CSXDtd1U03Fr56wjuKR5Xw7v5j9wtapRyZjQyJAnpH0CznbkP4AAodm/1J5R?=
 =?us-ascii?Q?rFMnAFzeQC+VX0skYXgaXvqjvA5aIh0xiSxQz9lI+bFB8AwqLPetfoc7RFRz?=
 =?us-ascii?Q?dEWyAj+Nm1F2H31FP6Noz39o44kcOHS/fCENoqZQefV4GxZju7u/qsmuDwXT?=
 =?us-ascii?Q?qFZOivsHknZTwkui1VLCPOxqwQIqbza4mVXlLFzgt3mWFuKiESL6IBvtFm+Y?=
 =?us-ascii?Q?B2rE+D4PD8FuV4jkUmwP/VIECY/kf8NWoy3SpR9ZClkg2IAxHt6KtRY87i+f?=
 =?us-ascii?Q?Ui3Yot/QsZAhyyHyodbqJsRKFqbSunPzCVZxvTfh83xgRfjRL1PHlvyKR9vk?=
 =?us-ascii?Q?pDPlm4Oa07ud3A+zd/T1ZEuWv1CXh90P/3geSE7gwXejzlovn86JeAJp/KZ0?=
 =?us-ascii?Q?62UexrMdTforeb4oe/+kZt5t2lTSHtaj6FDZy++4m3DSQA25gOgtctalQosO?=
 =?us-ascii?Q?5pPsHD6eUlG5OLq6kratiFoJSCl29lDuD5ddP76iCV9KLdvZvwMgwhNKdOFG?=
 =?us-ascii?Q?2ZP2WycgA4FQKyo1knGkgFMCOmSbrW7XduspVysfaxRqIEFdNf9oH1c1/qrZ?=
 =?us-ascii?Q?us3TRDQJw5xkMmSvApGX6Wb3W3Mp+R8zymhdeCRcHe2nzh7i9a2xaSBoLAJO?=
 =?us-ascii?Q?GwTxzeTETvNZ/3fcnGE5I0uMppbkH+Cw9lfhy/wHRVWUGaKD8lmWe0Vg/XO8?=
 =?us-ascii?Q?sopBNPSRJMpUSKS7YvA1/3adKVqrU/3h4XbP+VqthhObxC4LQ75Sc5RiwXwy?=
 =?us-ascii?Q?zfUz9DPaflzHBuNTc9erDO7mw7u3FS7rC//GkJ708FOeoIV9z7BDSSgeh+mS?=
 =?us-ascii?Q?exmiYLj1QtLlsMl3vtST9qSOVo6kOd1ES1bbWcc+DtPxd/H8GJNowB5NiqLq?=
 =?us-ascii?Q?ZZW1iZTZH+OgVDtbNtys3rS/887VynTfhJxdA/aQh3ZBKmEIeZBe33xWUV+P?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1ce432-467a-4d63-2de9-08db1b463704
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 17:47:39.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RL7pF2wuqtXtrbdtQdxBzbA9wb3zr0l004mEkS/JHzGqhT64rET/QRsaKCDPRqNZ1hwch8X9r3CI88uSNBWJ7fdWnbujM6cJa1OZ/Kv8kuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B1/8=5D_drm/i915/display=3A_don=27t_u?=
 =?utf-8?q?se_relative_=2E=2E/i915_includes?=
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
Cc: Jani Nikula <jani.nikula@intel.com>, karol.krol@intel.com,
 maciej.ramotowski@intel.com, michal.czaplinski@intel.com,
 ryszard.knop@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 02:26:46PM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: series starting with [1/8] drm/i915/display: don't use relative ../i915 includes
>URL   : https://patchwork.freedesktop.org/series/114573/
>State : success

Cc'ing some more people. Some nice additions here:

1) The base commit used for applying the patch.
2) Maybe push to a repo as refs/heads/<sanitized-msg-id> and add the
link to it here, so if the developer wants to check what exactly CI was
using in the build it's just one command away?  Those refs could be
cleaned up every few months so the repo doesn't grow indefinitely

thanks
Lucas De Marchi

>
>
