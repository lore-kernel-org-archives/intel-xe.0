Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F044C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 19:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D048910E06E;
	Mon, 13 Nov 2023 19:52:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247810E06E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699905168; x=1731441168;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wdwzpSHdGDTGLoTO1Sb3imyiNFe6coJLwoz5S3570QQ=;
 b=PbFon1YtTwo76gSQTXC/KAS6iHK4qCSF6NV30trecB2O8UESdk3iq4/3
 t5swJPaqE2Vx7Ou74MsCVAug9mZ799bUs0yFPcVE/vuv93jcdDMClkWb5
 cywVKiLI0D+AwqjkOI7zf1DC5hCS13086Zim31NPGZScXZT/iScvhqat4
 0mlzdL6R5vE6QnfbwwYVhlTPtDgyi1Q9iCKH7x/GFxZZ+//0VK/+keKii
 ZJTENxWxUHmEVp/bWe2WZTNsj6i37tgEmNWE28YngWwLkAizCd3SiKvXH
 2wAJLPNgtQFf7XOjjYCtftkik/2TxoQukT7cFAAfZbN+sjXiz7M8aAHGR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="380895434"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="380895434"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 11:52:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5759190"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 11:52:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 11:52:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 11:52:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 11:52:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgxFgS2sht6AsExxoIecprv6mEJG8rw200wKCjbLgNcs5d8XCVgw/aj52hXSJe2U8ennlqzDzwG/Vm5EIUvokXxuYx5lfXQYv9BwpU+Fx4D+ecQw1162mu2/kSojejfKTOFoQBh1nzoE3bNDJ4upC/hGmCNoFUeCx4ALzntAjOPoKQxB5015BFIIcJwYSBTFTERctd+pHLhYKkK+ixHHgzFCyUHss9I7KI91WqqEnban5oXBLaNuqoY/91a0QYTeyA+6SWut2EmBz25xfmKfAXqp0SbdQ+Vnq26EufFgXjgS+DEoCuTGbnJbnwpVRv4kGfkemBK51aBBvawt19gm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Tpfd/CTeE3VmfxTgiZd7GJcLmebuCwIfeNG9skVlkI=;
 b=mO4DXT2xtKNz/Ztmhjkr38W/apohO43A5vMBtBr17j7En53XVgGbjIYMCQIcWVMTDL6D+s/iEg55ZKSXbF4KjyDlbWS/xZhQ1keElq/Jw/ZNhl9rwtthMdWDgfqGz+el3JXcHa9xaw/vXkhNd4NBhA2SyBa2l9UulD0L6GJouiBexgPkZ67diqlsr/YyWzIXrVBxIV+tqWD4I8E/XVqUzy0PSJz5DCvh4rVdgplGHrqEMfEc9YLq/FGrX3JTPI7R7GsTlJ3wh3z1vRSLfZ4gfvsOD1mMg0s0fKk2Lf/e1KKhxJPnbd/G24sCANY+aA2rzGS5YgzO+h/rxWdufaVo2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 19:52:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 19:52:39 +0000
Date: Mon, 13 Nov 2023 14:52:35 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZVJ+g0thqwosQbAA@intel.com>
References: <20231109174709.4360-1-bommithi.sakeena@intel.com>
 <ksztic5tu4wjapm5jkyqfbcbjoen2364iemdrtjh5y3u6jgm5t@v47f5rt6wws5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ksztic5tu4wjapm5jkyqfbcbjoen2364iemdrtjh5y3u6jgm5t@v47f5rt6wws5>
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae95631-b3dd-4c46-1dd1-08dbe482173f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bohltJ5A6QfvRcS/N2iXpw9U5Oe7xBpjFK+RDikIu8GWOsrOCJoz5ZO8TaIbCKvRKZN6VB/HCuEOPwSxKTG3oSUMMRE8fZn9zb21IOrmrvkVsRa3Kms6MQiq9hyjCFqFw9uG9VZ+MVmod7QUu/Oju3yhliCZoc6iv3wegojLYpU2l24/1nIt0zAp+ctyP32rqH/VhSechQTDKBmKbk32AuXztiSvEifELqTY5OY9h8Z/qZmPjl6icCVvMrw26KGFlEHB2u19r2taoP7tOLRx/lYuznZNVP6SEfsL0X5XNXMNiARjFj7FWLxO6c13iHCS3oeQdGktfZTUyktifIxBM2sddmTrVoBWUNMArbqhMT6rT0tLEiEFXHiT05gyrUOknGiKl064RaB8amzkC3POV1PE7qTWXjd3kNk2bnu0UpC1wB0lBN4D/VNYuXgh6CCx+Uqud6mL1SGBTT6okXrTDvBlRZW3PneAOgD/0sHq0ZoNd3cIMO6LSSN+E9RqSG7AFNJOj+YB5k7p9v3dStZlsFAfEE0pK+/IG+VWwLtFRfp/aRUeV2dO7ZJOw6yWKd0U40TKocMvc0UCN9+hwOyNFesVEQWPkzuhsoVbM807yCKNdClaOCKS/pCPyV7jNUmQGwh8byh46n4soqAU2yUbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(37006003)(66476007)(66946007)(66556008)(86362001)(36756003)(38100700002)(82960400001)(6512007)(83380400001)(6636002)(26005)(6666004)(2616005)(6506007)(2906002)(41300700001)(4744005)(316002)(478600001)(6486002)(44832011)(4326008)(5660300002)(6862004)(8936002)(8676002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E2NY02DPcrjxRrOrdtr+H9ZgFQhANgHOwnz33TnGExomXZmO/wsjgUVXcJRX?=
 =?us-ascii?Q?xqdNoIJKexYuWNLgY1+T4KxAdkB5A4puWvbkXZBI+BvLkt8OPZZb+BwhcOpU?=
 =?us-ascii?Q?dvbDv8Fv+HjsfcSk7CEnLSopoNQpkiX//hktAsxs3m9pnCtABl6vPViroALQ?=
 =?us-ascii?Q?cQ1y7dWuPHlAMYWfFjNlZg0AMqxkpRHL+txfx/62F0yhaGdHykaUa9+lgLF7?=
 =?us-ascii?Q?PYUOLvLb1xgkKu/zFm7bBBgmhexbvszM+NSV1QZqYelxjLezd/x/ydBFqFmV?=
 =?us-ascii?Q?e1toXGmjjCk/5RpgK69sOJ3m9HpMbovv2DuO95bZM5MYEml+QY3mG2SUzM8i?=
 =?us-ascii?Q?EHMYVdHd6PLKll2fSc2a7xeodpMd6hOV0uWUGkISiPkcLFWRVH59Ly3Oy2FH?=
 =?us-ascii?Q?s6CfYxVEuiUiazD3BUNXXR7E/08dvl5y7tkhBoUw3QhginZlYiKs9phA0feo?=
 =?us-ascii?Q?xodX9kgCSYaF4dOd97hRmwsIM30kNFdA32xRaZFwnGqvqjggHmtb/RTIsubA?=
 =?us-ascii?Q?/OtMxIv+bHhuk5DsjU5QbjuCPqQggCFLroYfD8ITpEcAtzWpg2ZTPa2mN57v?=
 =?us-ascii?Q?+aNN6jfuMNangWyW/6JWzTVpp7nd9FxZ9xh1dCdk0nA/kMRmkkLNK5BgKAIc?=
 =?us-ascii?Q?oGnwaSl+bKNm3Q1BF3/3Lm+23s5IBjBQ77C3zlbQFh/F9rSFCxrpu26hadhE?=
 =?us-ascii?Q?+ABZwXr+oBePM8XNRa+eHhwWmlTs2pXeYMBYSVvTknc2iTNi4CE2CxxcdOFY?=
 =?us-ascii?Q?DEmyBuG5Uabvui8sgmpU23Ujfv79hgYGhvNW1FcK2vdBYQEemIZ60eC/1tLB?=
 =?us-ascii?Q?04cOuZaU4LunGD6ArVYhZHhA0vB3N1CVRB4jm7Kptt2cT8YqobP5VPD4rT1S?=
 =?us-ascii?Q?nYlXzTBOUrLI4cyBeZl0x6gPVy9gTa6ElLp04PgBfWEEuZiOl2IVoy6Z86xz?=
 =?us-ascii?Q?AoUTFwA0cTgZN6V7rc31viuYosHl7laV7ngfagU3n2Ji56CWZsS9DhjsdZ8t?=
 =?us-ascii?Q?KsCUT8JmIBisLxK5BF05Xd0AnXOfIuBZFRHNzX+TO3sKEz1Bi31j3882Jshg?=
 =?us-ascii?Q?rFNh8Dp6fVBjy1mQQ7DXx8+3fZFHc5Llwx+RPdnNudpyav8Gkb9O5lW5NJpI?=
 =?us-ascii?Q?XvqK1Jj00Yp8hLRc46g96rxm+Pdopd9Eyhucd4NybBTZUYVCoaulHwevdJdg?=
 =?us-ascii?Q?DUHHA/2G3n1DDuwv548Q9Px3wicrlHgHbu5zjjzglGxQgOWK27gmCiDXlme7?=
 =?us-ascii?Q?kVtJ3yxUsIDwdaeWaakCTMnEkd/sfxD4jn0bTimgSkjFqZorIc/JBfdQP6OU?=
 =?us-ascii?Q?ADLZW1AiXg4Wt8J+hfoA+Ro4EhDDx+/v9GSr5pfvrsgBvCxKC9c3FPb0wXq9?=
 =?us-ascii?Q?lMxo3cemVH80rgw7nW9Ql94paZV6wYTmcBwmotcshvwjONHj5t2rgAJ+g8Lh?=
 =?us-ascii?Q?iU1XHhy/IO0um68AUPSDvwpvLaFt5pX4hrBIBqik4MpmTQDIvTqsXGCn5c9L?=
 =?us-ascii?Q?f95hmfPucK2y33CYX4QvanQxRRYcoMu8SiP9lo6kQ+wOmhczRKLh2fuB7MM5?=
 =?us-ascii?Q?KX/GGmmwmDqPM3109VnSCrYIzzUv4pcPdsiW9joM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae95631-b3dd-4c46-1dd1-08dbe482173f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 19:52:39.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kv/RHBE/szGQUoAPuAns1/LFS2NA9szm1hWH8xdGkMQiWl1Kz3H2fWR0JgWTheDlY0tj42v3SECLdX/R5O6Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
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

On Mon, Nov 13, 2023 at 08:23:34AM -0600, Lucas De Marchi wrote:
> On Thu, Nov 09, 2023 at 05:47:09PM +0000, Bommithi Sakeena wrote:
> > Encapsulate all the module parameters in one single global struct
> > variable. This also removes the extra xe_module.h from includes.
> > 
> > v2: naming consistency as suggested by Jani and Lucas
> > v3: fix checkpatch errors/warnings
> 
> checkpatch CI check is still complaining. You can reproduce it locally
> by running
> 
> 	dim checkpatch HEAD^..HEAD drm-intel
> 
> assuming you have this commit as top-most commit in your branch.

hmm... is this the --strict option?

apparently that would pass the pain ./scritpts/checkpatch...

the equivalent without dim to reproduce this would be:

./scripts/checkpatch.pl -q --emacs --strict --show-types --max-line-length=100 --ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER <patch file>

> 
> Lucas De Marchi
