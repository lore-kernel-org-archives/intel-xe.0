Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B65C27C77
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 15:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA0510E678;
	Tue, 11 Jun 2024 15:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5hOrDwY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215E110E0D8
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718118577; x=1749654577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=seafHmRfsdK9C7OcC8zPnbOHp4tKiEV/SeHYFeo02os=;
 b=J5hOrDwYCmE+5fPO7Nac10x+t4kzZm3Oi1R+lLzPcXikPX6DM5uJDmJe
 oLopXWAzGS8GKo1zg2/IUFQqLLbgbMZIMoRfauCd/if82J3W9cJHFIZUr
 1BXOqsyEms/r/sGWczBsZITCG89L3+q66ELjsLPbgBZhQxo4iYaQkn9J+
 Chmb4th06vetRBpxZMSldmWmaW96CYKP1pBm12dHseVcejdabcilVL9tT
 CMUGhilFSXYX73oSN7cCGWKd8xwLTRyqmuP9WPTF8bhSG33eB2nTFG+aK
 jhnYw4S0aZItKbN83S7/Zo9Rophn3SGRaUeO9s8YiJpjOpUKsS1R8z1zR Q==;
X-CSE-ConnectionGUID: 4vp8PVXBTwKjMyqAMuj2UQ==
X-CSE-MsgGUID: Gv6tNBrgSOa5MMKHjF8tQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26252545"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="26252545"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:09:33 -0700
X-CSE-ConnectionGUID: xZb7IQe5QteriFrLmis/Mg==
X-CSE-MsgGUID: niK0Lc5qTd6Saz5tmVxbEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40068180"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 08:09:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 08:09:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 08:09:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 08:09:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 08:09:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvbefdAIFxCkx3kYHTttYa0RByGE+ERCPKE4lQugprPkg/+9iTSsCWAsuS1t+dGgQNfXlT58cWtsEXuTSDfySS0tLQ6t+fV3jCF53CJSweNwOJiLmCtLGjto3VW5KF29MLGfq4UHq/9PauS21UlIFCeKsbySFr0jv4ckwm+TDJvOw0jom/JlqlGEdIFa7bXi9sW2JTHjEe9KA5STHU8qim4C40Jcb2hChonjzIWgfkMnHSqnqFRkqiznllmz0Ks6bmvD983Kc+MwjeT5cOnHNLAStMkgyfCgVlnqK7QvZtD4D+tp5/1JnmfkMbzPUK5kn8rXvpu7beJbvWszMPGZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11PpnsocVSeQE6Qz2KLcQWlNM4KxWrf7Y9Gol2KXZLY=;
 b=BsOg6jc/9NQCGXh71cOUTVzbhR9Yjrv3ZPXqKbv9huD2w+aUnhCkoICF1T4Fy6ERvEhkuoqTEGXihxEgmPQt3dcMVkeFMzX9N+M6MZO+MBWhVKv0kxaM35lLyuT41IOf7zcG4+GXBoX4AP40yRVKwy1cAvG4tlf9YHu6uxdOlWCltL0JN+xJ7JiKhjl5CjuD74Ql8xCTsqxQvzxckulrz7GaFtKB8ajkyh/9XJlxpyM6VqDv61iGZBAbtG8btOylNtPT0x6g2764WAiAoK1Oia1OHJKQuSCY0DtmeuDyJaJbOUiw8IdfeSfATSDaOdIognnTr9mDxYAKS7ocKrTpYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.36; Tue, 11 Jun 2024 15:09:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 15:09:27 +0000
Date: Tue, 11 Jun 2024 10:09:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add kernel-doc for HXG Fast Request
Message-ID: <fqnvnnee7eytwa26gkz4znew6ijenvwa3bq3536o5gdbpy7z2j@ycm4zvdljnlp>
References: <20240610120411.1768-1-michal.wajdeczko@intel.com>
 <20240610120411.1768-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240610120411.1768-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b499b29-5663-4b2f-3ac1-08dc8a287c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+vVHyUHlwgjEH3dvuMkmBD6s9UlUELSg+qQk7mdK0lGV+MMDh6SXZoasGHGw?=
 =?us-ascii?Q?X+/bi967pfaVIciVIsNSMP1YlQTql3moM7noXlBJNAK4n//UzYwJId8yXcLO?=
 =?us-ascii?Q?7VJzIdae7zaA2223mE8ECFepoCniyLRkuPWkAg4iif0vmWm+rEeePoFcg2S9?=
 =?us-ascii?Q?56tqX62XzdKoi2OR0i2IySPp2MyQ07gjCPWZHecgPfG3VDPxj7JD2FCcxain?=
 =?us-ascii?Q?SXSrLmfAj3iZpeDNJPS8OCOCa1+gWfy5LruODN8tAeAw/q6imHT5hsOoDJPR?=
 =?us-ascii?Q?asQRbZw4gC7MJGiiJL1+8BClXo5RppzNFepWBDUoc01DS4/fN4lE2q19CWoM?=
 =?us-ascii?Q?wyvyEAk5q22ppqf7d+AzG0bhD97v3vEGacnMkyrhj79iATk9GkpLE6R5ZOYK?=
 =?us-ascii?Q?0+1evutXvbx3/INcnlQdRdmmT83P5d8eotY50zCknMYECcYghCtZjgY1HYLL?=
 =?us-ascii?Q?TZypezXPQ8tAb7c2gUWIL3SutM6tKKNACMKb+Q31HFG1jgWyixQcFyT1tmjO?=
 =?us-ascii?Q?BgUvVuFewzHruBc5DkMk7uVEJIagnaww47dRi7gpL3YFL5LBZ3pA7tS+0r3k?=
 =?us-ascii?Q?ifP5fgLDx+cVEU/rLdDBzaCib8t1W9ZDK/QPl+owrNZ3eFsJyS1FujiHuIB2?=
 =?us-ascii?Q?LsvgjqGI6HfEVtKk+Z7aNVfh7JYQcazoUo4uy0YmJ151/bqUoWqU5nkpypge?=
 =?us-ascii?Q?vpJiCEBleTpkc1vgcTk0XWQ0xV+kM+OOAbfzWSkUjbxrAHM8P/7dCPpLAaeg?=
 =?us-ascii?Q?DkH588hHxsrpbzY5OaTrib8S0DffEqpQG8IgqCvAbhoadpstoyEVS+O5LPoP?=
 =?us-ascii?Q?5uqKiNZ6HCCK1VQqNXdQvQTc4cFmT4+IGKRs3eF1habqgRpHzhMHkZ4JBRBP?=
 =?us-ascii?Q?gF9D+5ijVt7kPVkpmglMtVy4VKwE8m1PyOrt7PjMTZXJjLuPqEyQlgkhM9+9?=
 =?us-ascii?Q?ub7opebE8VGFqXKSGjGKw1JDO2zcovDWoip/M9zi8VE+zq5khc2hfdmAc/Gr?=
 =?us-ascii?Q?H8S2rtKPXVcEnGYRujt+O1memsuC8GkC9NlBpLYxhkT1SHcmWB3Sjgw5jtAI?=
 =?us-ascii?Q?aMYqrPW9Rvg08k6tmHFH4WNqOAycA6KBx2WjJXs3uL8a838+L7Z2BjItjGqM?=
 =?us-ascii?Q?jR7rcd79UkmY4mtfWOmGJginceUJTK/IdED9uM8VMg8byBfAlEeK4tOMQKTS?=
 =?us-ascii?Q?uBKZfQ6eLYae7WjlapbB42KJv4c1DYWCHtKXxuFIFR1AA4ZqSNOLzwhApKZP?=
 =?us-ascii?Q?xURoIsqG/vOeFo6+MnE1109/+Hj07xQN3shuEuuZ6zZEOQ7Ie4/w5zl9FOXv?=
 =?us-ascii?Q?dcSy2+h3DjaHO2glv8FFkgB3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ac43rd+LlgXFlQhb7xGbD3cjTAuvZNzMCxUiclxBtPgVmIxtnwiBS3b9HpbC?=
 =?us-ascii?Q?N6i3x7PtcblJdF3l6k7KC0MZVByY/lRcSguYVD4DeVYJ8Ea5uGYDvMN3Gkqz?=
 =?us-ascii?Q?vcIzGIHlSrP8TN48byuZHXkyDsXJwctk9f1JACIpm2q7x/C7jksiOz4WZgwn?=
 =?us-ascii?Q?iwLQaEgjIOLyxMzb++csNgLG94iFXRA+7jmkjjGuosAxYM5DgZC4ZmIJWh8U?=
 =?us-ascii?Q?N7NJy2XPAyGHzQqIXXuplfSk45YvVylobItZwoIuhOWx+nJ94yDItdwdJINn?=
 =?us-ascii?Q?KenSHUitSw9yxXsezznIJYsAtlmoTGawPAG/14ji6ZBxP4U2VXTD52/lpuEG?=
 =?us-ascii?Q?f5fu5oGduxg7P+YGBtvIhEvRIsFkmTwBtCwl7EOfAu2xy+luJ+78I3JBooCc?=
 =?us-ascii?Q?ObLjU5h7VgkpJphSm8Ioldzc0PznRbW8P4khjVAbQNHcoL+7EDBRGGzHWvAg?=
 =?us-ascii?Q?SG9ujNYNT/ipR7nCAyjVmRTMtuyjeOxXmYROVkTTeRpqPaCGkxH9X0rzNGwM?=
 =?us-ascii?Q?ScOMobeccMqKH4hSH/ztNKMy7DFWVcsiuxge0GnY6dtX4PV/DYv8Ligl86vD?=
 =?us-ascii?Q?Pe7qgYBCy2Wc2FdU7sqpsDFffOtbUlOSSW9kblfOj0FwyD1t3L6bCfrb3XKS?=
 =?us-ascii?Q?8cLSboNUz4E/8Fb1CRP/oOrGn4iTJZr3S48kR3MN4zn3vSAJbsVuPcQvpcW2?=
 =?us-ascii?Q?WCmhzE7lnLe1LYixVXqdZOjcuEyvdosaOgahix7jSAz0eKhFGOGsBaQFNueU?=
 =?us-ascii?Q?qC8gquPVwdtLIRXQbC2gCgbnOGvpKbZODQXbFyO0/mU6LIL9gz+HyXpfXHgw?=
 =?us-ascii?Q?R3DWbUHtU/h7aRdXtpvZRdlcSgkRrXco7l8BQvvtRW1u8K1OS+lEbN7MyZVN?=
 =?us-ascii?Q?sCT1Xu2oGGItYno0hYRJC+usCTByFwi5zhVUyZQYeR4QWLZnC8+YIw/hx2k9?=
 =?us-ascii?Q?udRytjUVUtCblloidELFmFRpzIraDG1FiSS7is4J9nDZIJQqAhubspI0n0wX?=
 =?us-ascii?Q?FaWSHx+Dk138QXNUuyhjFzyr4dU+Ld6V737GVmV9m1nTtWpf6DgAkCQHPB3x?=
 =?us-ascii?Q?F3jYtlD0s6QQThwnJ8/2dAEXsiz9cvS/A6GLYH5QZ3pmKkWONe05E2J9q8jM?=
 =?us-ascii?Q?cETbqV4j7tCUL4UV0tCk4jgec39iK8aB5cIhkRLdk9m6CdlpO8KqyqhnEciU?=
 =?us-ascii?Q?etOVA7wlA/FFcTllH1Jrf3GeyXOp5sReuSiju2+O3io5imJVBGGT3yaLx2Wn?=
 =?us-ascii?Q?AVvw+Mio5JwGYdhf3ygoJpQ1RUhHoVs9FLsyp7i3lLJc21L9mbSlo2WPZEt1?=
 =?us-ascii?Q?os0nh5rPFPOuXMHuINff6pfi7c9K/kP8eTca2MvGwi2GDxVPTOmMHf64yt3W?=
 =?us-ascii?Q?m/IbonIPeWCzCdMvGN3HRl8LIun++yKyUtHfulM8QndHojdqcoEN6row8NvE?=
 =?us-ascii?Q?I9i1lc3+pabpUMG4Uy2GRz64WyeuqTa9MvxzUfRysFq+5KliskxIhKL2jFQQ?=
 =?us-ascii?Q?cMQDLyVKeEv2DjIIyXUOnqG4VKA5N8KfEgd725x7Pl2hO3tRpd4u/czQ8n6i?=
 =?us-ascii?Q?A5a0/NSXbXosiTI/cbFlQLmljFo0zCra8WHrFpBj9hJM385Vx+lUzUo7hcFG?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b499b29-5663-4b2f-3ac1-08dc8a287c66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 15:09:27.3069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6O41S4J+q5CbyOHCLfqqru59HlQUVjDLD5Et34Tcy0Zmx6OU53Glejlzo8DMr/vhp2DTS/FZGU6l/hlfaeIDu6aVJqJ4G3Q8IwMGrSo8+ZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
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

On Mon, Jun 10, 2024 at 02:04:11PM GMT, Michal Wajdeczko wrote:
>We have kernel-doc for all HXG message types but Fast Request.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/abi/guc_messages_abi.h | 28 +++++++++++++++++++++++
> 1 file changed, 28 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>index e32142e3fe41..f6ed4dfd215c 100644
>--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>@@ -91,6 +91,34 @@
> #define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffffu << 0)
> #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
>
>+/**
>+ * DOC: HXG Fast Request
>+ *
>+ * The `HXG Request`_ message should be used to initiate asynchronous activity

I think you meant HXG Fast Request here.

Lucas De Marchi

>+ * for which confirmation or return data is not expected.
>+ *
>+ * If confirmation is required then `HXG Request`_ shall be used instead.
>+ *
>+ * The recipient of this message may only use `HXG Failure`_ message if it was
>+ * unable to accept this request (like invalid data).
>+ *
>+ * Format of `HXG Fast Request`_ message is same as `HXG Request`_ except @TYPE.
>+ *
>+ *  +---+-------+--------------------------------------------------------------+
>+ *  |   | Bits  | Description                                                  |
>+ *  +===+=======+==============================================================+
>+ *  | 0 |    31 | ORIGIN - see `HXG Message`_                                  |
>+ *  |   +-------+--------------------------------------------------------------+
>+ *  |   | 30:28 | TYPE = `GUC_HXG_TYPE_FAST_REQUEST`_                          |
>+ *  |   +-------+--------------------------------------------------------------+
>+ *  |   | 27:16 | DATA0 - see `HXG Request`_                                   |
>+ *  |   +-------+--------------------------------------------------------------+
>+ *  |   |  15:0 | ACTION - see `HXG Request`_                                  |
>+ *  +---+-------+--------------------------------------------------------------+
>+ *  |...|       | DATAn - see `HXG Request`_                                   |
>+ *  +---+-------+--------------------------------------------------------------+
>+ */
>+
> /**
>  * DOC: HXG Event
>  *
>-- 
>2.43.0
>
