Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B7CEB64DD
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 06:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543EC10E012;
	Mon,  7 Aug 2023 06:58:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB1610E012
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 06:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691391512; x=1722927512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cFit1BUOYIouqfCBDtQfEjmUQcsCG7mMOiQEmYcxNeM=;
 b=iyGV56i30k2T1fgGhw+Ps0jhmtkbewVoeCKPnx0BwUIsBAbJv4uITUad
 6Sf4JKeqrUOX6Uiqlt03EKCctyIlYyWeY4VQDWDfTso2fzPKYRT64yYGu
 innjIG6de5bI+Znq3WIsmS+/lfFG5pXALH7J1mdkBawMSvhO5ieyWVYG7
 vainkSfhQ/KRN1yglszFfALd0txr4m6LbmtIRknHWlSp+hVuQ/Uvl/QwL
 jtv+3CNaxTK7p6gdRCQMIpg3kHW+8o1RoiDS8MohIc8+RMr6VmXXK6RpB
 4/ewVnXUZtdsmYfP46+WH8G6NPiTGkQbwtzX/1szdJ8fpItIhpdLqLPUC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="355407719"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="355407719"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2023 23:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="707742880"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="707742880"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 06 Aug 2023 23:58:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 23:58:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 23:58:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 6 Aug 2023 23:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAfFaW+9uAImqqGjAJHZncp72EuOsiNJ1HWbVdMzddHwPIEh4Z5xBfa5C+UaOWK/7tleQXX58mXmUU6k/LFBh8O6OUGfWFDWuVy1UlsmGVXMEeaQPa9RSMzHLT30lj4+KR6+DY+We/dv4jX4dYnLw1TMNIwmO1SPt4vL3Sk5DFA0NaArGKArfSvis4Kvz6qHofUtJUirsClB2FUoD4ok4eUJ93/40LZvRdxV6yODEf2ee8CBVJdP9lnbei0mKR02D0zWXg9K0f1o90By4U7oyVfmXTC3nNtR3A8hRtiXorUbYC2PLR9sEE2F3FuETn5JyTbSw413XpKodssf39Q2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2mMcC1/nHQC+f3b4OtA5Km6iXiz3SaCnjLLU385LlY=;
 b=NP6QL09F9UBA20MPVyWba6ySb7IQoQa39KVpz6UT3c9Ahb39fMRsJ19XvCrqvWMK8QAfTeVM/9wNim1GFw29gle7drXKN3fd3Hb4LzWW+JPAo2TbwMKEAhMeBpgDArrCrbn91LGKf3NileDkm5rTOG2Vcf+xhANXn+JQUQuLEpASYg1dh+pSaKSgDvimwCkNLMnN8/z/nH8Y3ard9kYgzP+8UjFOmgFqVUQ6Rsa6yMFGTTm2Ptq7Axyb4GxJWTRd678fAcILqhoR2D2L23oyfvKH5Rex4yl0G9VpDSY6N2TbfRL4LgHfc/QgOL0nGW9z9xv6xNq/U75KMwxC/cMcEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 06:58:27 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%5]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 06:58:27 +0000
Date: Sun, 6 Aug 2023 23:58:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZNCWEKJhaA6t9mp+@nvishwa1-DESK>
References: <20230804231709.1065087-1-lucas.demarchi@intel.com>
 <20230804231709.1065087-3-lucas.demarchi@intel.com>
 <ZNBeKVWdWbjvaStC@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZNBeKVWdWbjvaStC@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dce11d-e514-41de-83ae-08db9713b387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TeEWwEj4WnlxCGruY4PE336JyeigOCQtyWBBFvc8ZCpm6xDq6S+myUQOw/VEbIjxxiAABr0hXAjCXb5Wq7FwQmpVEsKuYtPUuxUzGP8SaO9F/DgH1LusVUjlxXLvBJuM3yHkgnKnlSYJuTRzTXLUGQ30tL91f+DdNA+uAgl22RuD0b/4Bp2mf+uyV2RC2T5Tb5tlGYS1UJBErHdP5j3tAlUhE4CgIK/d4+f3KWyvcaIF4ho/JUjsg068mqpFWr/YNV4NfM5CxigG/VN/wakBnQYjma8TiRQ/b3q3+BP6FlaaOzeI7wplPfLaL69ddqgiUBBRalGcCCRmTf49QZ1c4Vtg4BLzIRfvWM1iiHTf3YLCS/nTnyS9i5nUe9zEOk6Wosf3UvzakbpdKUtLLju9jnvDgKBA7jbEXJ7RWXpMOSbhxkerwnf901x2QgEHK8JdzhrBpfB1BOIhlDutEcedTlJ41O/bB/60YloblEIfncDBylaKImf6rE57zmaqKYV4O8J2o5JpngHiRGNZ6iq13KdkBtDpOHBdzdP444Rgix0Gv5QLl7XznLXM+ouHGhg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(346002)(396003)(136003)(39860400002)(1800799003)(186006)(451199021)(15650500001)(41300700001)(26005)(2906002)(5660300002)(44832011)(83380400001)(8676002)(8936002)(6862004)(478600001)(86362001)(316002)(82960400001)(6506007)(38100700002)(6486002)(33716001)(66476007)(66556008)(6666004)(66946007)(6636002)(9686003)(6512007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOzm+yLV5vJa10FZOIQ1IVariUCBo+rq5HAdtoxFOwBpLTBeMP7FLqxwUQo5?=
 =?us-ascii?Q?avkayqFFcosx0ry+fo9wObJx4rE7R/eudEaCVuJyYxPsbOlR5bDiiZ8XdOHZ?=
 =?us-ascii?Q?sLACjcRRvGQ2ze8f//pi4geqwYHNKyTLewAKQbvfNwBGNLz/y95bKokhEUov?=
 =?us-ascii?Q?Bmf99CStQRPQgPPzNy225fURF/1CEM9GoKtZLDOpaVGA7fxKVozu7VoowCAk?=
 =?us-ascii?Q?rhJfFnkoNoL7POSWbBpVXB5XpbaUUl364TW8VBixrbISYqrUc9+N8UY3IMhL?=
 =?us-ascii?Q?SaU5SRzu8DEms0w/K3eDptPVhvT6VJj9mMalbADVwzED/i9a8sLrUd8kCVkN?=
 =?us-ascii?Q?5XWEJED5QLiDwuqA2KIutUwpT6MZHUlxO0w2/zp7CjBZKZU2zVrDNXmEkOQT?=
 =?us-ascii?Q?E2VLkQ1gJ3J+6pWFl7gQzh8Ldck158txp/36YCUByUmv761REiAWiFP6PuEF?=
 =?us-ascii?Q?vPMwvCSv5m18VD0TZBttki7Es0Znracp/vgK791UgJjbqd7u4dZqtcUfkiRZ?=
 =?us-ascii?Q?w1my716tN1qE62OG1PnxdfGZw9cxABVkqkAaZKNdUtn5Uqp0l3OZ/83LRrv/?=
 =?us-ascii?Q?2Q+IqPI4+zsBwuSz6rmjmMwjakMgHs9X8rJv2NyWm3QMAWZDg+IrFkNeizEg?=
 =?us-ascii?Q?CG+vb+xnQYXmBDnoa9cDi8h9bUmKEjUweSkLZYCu+1EE/YUQMnGPUrDYYHNF?=
 =?us-ascii?Q?G2v1fWyhJnxEYCcJKaHnN1BTCZip4P8C7Iv6VOGhmVt9X+eV4LScqT4q4sh/?=
 =?us-ascii?Q?cNedVslCQ6RU2j9WhyCef/QoTsN3/OUrZ+KLDb1J4OHroOJo/oQtezglfQwF?=
 =?us-ascii?Q?uEB/POb8KGYMqDP7UsYrt3TCilrD/NTsFaA7CNANdpGcFamQgR7VfrfLo8qa?=
 =?us-ascii?Q?SRQ9C84UGklSSaTg2wBsmDaLC39tSEwBu2UHHMhYj3uWEbySrp96kD8Myh9g?=
 =?us-ascii?Q?guAOtKgDnNnn9P9mBo7zQpg4Df+ASIT0Ajx4AebAEIOT3k5dyFwfV+sEwQ5U?=
 =?us-ascii?Q?09bumjZbPlzbCNhfqlCWCDWL3ETQlW+2IuyhwYivS/xN3xduXda5YSUxC7x+?=
 =?us-ascii?Q?MC8Z8gwQ61F3vEO+9IrThc0ulLWmcKI1EN4D2VPfS7fTr2EtmUakiOIXOshp?=
 =?us-ascii?Q?eAcAihS1OzZGUuR/QlWmBGTqyhwyrWD3EddPanB38OvEbmvsvdxcGmJi/g9/?=
 =?us-ascii?Q?6TumawId39txPvSndwz/2rOnyRBpEUOB5zmZN4eNYsPHXZPRGnBMZM+OD/Kj?=
 =?us-ascii?Q?v3LcgIX9CHvIueX4Nuoq7qNgSRgv+C9/6Hg+LJcO4Q48XUL8wRH/tLFTaNUr?=
 =?us-ascii?Q?4WVLqT/cxKFVVYQKf9immAh2qkeV3Y2Y9R/RI4BVJNBqVKCA1D2rTiqDvLi9?=
 =?us-ascii?Q?QM+VSEMX/4Fdgz9QNxASr5Z2f8WBHLq8yo5nDh3Hs2PqKxEfGyZkhufiVdnb?=
 =?us-ascii?Q?o1UQv/k5Dr+7BpY7LYAs3/wT6t5SQPNfG1bXNhOt5aApQge3MvFC1zac42NM?=
 =?us-ascii?Q?pqlt9VUVOWo0BdNdMSgmpcyMSja1BvEMQikNmlzvCnipWdENR9u53v/PZhcQ?=
 =?us-ascii?Q?b0TnjNeeptM4pd4rTDyuP1tc0ljeE+xeC60PymXmEKULNIBsr3m5rEvmBbOP?=
 =?us-ascii?Q?vajhdg+0un7KaApSfKooMYY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dce11d-e514-41de-83ae-08db9713b387
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 06:58:27.6444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdPdBtguiM2C8zGyXtlYkQ+Z8vf02Wj3X1WWXIbOujaNUxnT8Z87G5t8N7CqoxC/bPpd4vEdh1IlAOMw/GhF3EyoY1ykaCW9+ARSVkGdPf8YHm3Ea8z0miYRoDN/aVi1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Update ARL-S DevIDs to the
 latest BSpec
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

On Sun, Aug 06, 2023 at 07:59:53PM -0700, Niranjana Vishwanathapura wrote:
>On Fri, Aug 04, 2023 at 04:17:09PM -0700, Lucas De Marchi wrote:
>>BSpec changed with regard the DevIDs for ARL-S. Update the define
>>accordingly.
>>
>>Bspec: 55420
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>include/drm/xe_pciids.h | 3 +--
>>1 file changed, 1 insertion(+), 2 deletions(-)
>>
>>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>>index 1263838617d3..43afd973e153 100644
>>--- a/include/drm/xe_pciids.h
>>+++ b/include/drm/xe_pciids.h
>>@@ -199,8 +199,7 @@
>>	MACRO__(0x7DE0, ## __VA_ARGS__)
>>
>>#define XE_ARL_IDS(MACRO__, ...)		\
>>-	MACRO__(0x7D66, ## __VA_ARGS__),	\
>>-	MACRO__(0x7D76, ## __VA_ARGS__)
>>+	MACRO__(0x7D67, ## __VA_ARGS__)
>
>Looks like there are few other ARL ids as well?
>

Seems this is the only one now.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>Niranjana
>
>>
>>#define XE_MTL_IDS(MACRO__, ...)		\
>>	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
>>-- 
>>2.40.1
>>
