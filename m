Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC6C0015E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 02:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E235110E1AF;
	Mon,  7 Aug 2023 02:50:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9894510E1AD
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 02:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691376654; x=1722912654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UFWwL26bp+U5GmC1TG2ME0o+E7H+/xnHqw/qLLv8h4E=;
 b=TfC0SGTkcw9BEvcvxgAVFsUJ8N/LFcfs1Ve6OjRsNwLbOa9RNjNYJNZ9
 Wi1/k6zCh7LwWSOySIUKIAt+zqFgFlHnNJeIPrPhdXgkSilMhGMQIm3YA
 lctQSg2ESZ7UEbkweDtG54QeHPSHOete5seVx2a48MXTIcuZcugeKz3qI
 c0pTk669mD74c6HuUDLYLWoTxP0KjPOLaUGoet/UPm4Bs4sIHWWCGOsig
 dT3ldjbkIpVPA843YD77GAUugtIW+2bCpwARDtrYOemEfSSxrVZQiguta
 SFnq1kh2ywlkXRn9zqDmu62dHc3Kc50RhlvF25c0rm2i5z179Tshj8Pax g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="374111686"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="374111686"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2023 19:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="854490611"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="854490611"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 06 Aug 2023 19:50:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 19:50:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 19:50:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 6 Aug 2023 19:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/403LdO2uDErICyw39Ad9mJ7DILXz3+mkunPaq4LW/MIB0hR+FrC/mRRn/GUKAvUCHv6Rl37boY72lVBEk/KmomC6FRCR/XK73EfS6hJUMjJZpM6df9l1+poHBZIHLU1vQJgF4gTFlfgeiQPBX5GOyOScSJ1d8UwiuLmuapjho05CjbaG4dxiNFM0R6SF1sq2i9dmPPOp/kc5Z/G/UwLy3YXXI0nSGKcwjUdgkt+7AGLhhz4JfKO4fy0ej9/K5/vriar0jUsCYAcTt1DGoo5alG8mZhHi1p/z8NiY6Y1KAD3sW4nUk+kb9qCTHt/yAH9gWnWcQkkayu121xbEWOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Alu66t34tozna6u7iKFoHt8+FFlCZy7bA0+Wc+1SGYE=;
 b=CcY6uFVb5CT0A2UxiGR+9v97UV0I/syHb+a5QJQZ+Yz4ievo7mQnizeOpIdYhDyv/5i7Bh2l5eNYb2Ydm7lSQrtJohSxsOReXeh3hyGM1p1XECjfTDOGF85wIUTboZWwF7kIgj53e9s2DhSLXTY8Nu8p0CnY49C4Ig/iOEc92ouRZQQaOPmb4l3sofXGUOqsg/ppFdj7+jZVd8gKwWQ68rqheaV8uQ/vZO/MbdxM31Ccg/38EWlJMRUwjVIfH6mQg1SihCwQeEbzXyVhOFnDpKe/rlwphfvQNw/Waa/3bFFzPs5acGpdqfnak5iNgoyO3WI35AObppqOhz6C/q4i8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 by SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Mon, 7 Aug
 2023 02:50:45 +0000
Received: from SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a]) by SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a%6]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 02:50:45 +0000
Date: Sun, 6 Aug 2023 19:50:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZNBcAeK5yXnksOhn@nvishwa1-DESK>
References: <20230804231709.1065087-1-lucas.demarchi@intel.com>
 <20230804231709.1065087-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230804231709.1065087-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To SN7PR11MB6945.namprd11.prod.outlook.com
 (2603:10b6:806:2a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6945:EE_|SJ2PR11MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 087c24d5-58c0-4195-d619-08db96f11886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UnYLnaIEBwLAIQVVp5tO0IUmOAwqi3IXxulX1LwVG6KGafgkSRKF8TyAi+fjQVI/QhDKfN1iSmlBMMLjm0c7sOsQPaBHe4a8Ygi0FDN4qDg1eeEgKI6jtsFbGZXxXj3TMRublTb2C2IX2/tmCYEa0pF6svOSIpgVgSGJnFEPrS5QBhyIQAXUG2hsP68VjEgZnDPH5pIBe9d11UGr/GhkQ8+28mxe1NJWjGfOXkTnwMFysbSWpBMp+5UOb2mMBGxbdFCKz5m49aXp6L9siFHstL1qIr7UA3IDyMYWMjZutsJcrVFFuVOfnFDxguPlaez09PcqQJ6RbXRMda/5ocSSl8swe6wyDB4pNCIG7RMD+tyAVvkn7ZJNJc6jusRDcdQaad/P++j7kz9syZSRBKtmgTnXrhlmxceIaqMvbWaspQkUv/B+FilB+yThIE3lbEtFZxzpblmrDLqRbkayrlvkHP7olsa+/ToPsvb4NsbytarlZSCRkSeiF0CPg2iTeHJ+izNsnFzwnu40W532QxlyW3Lw0nLa/SjTWhfFCuK9b4CWtR4PtZKPv9zbG2C7DyBG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6945.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(186006)(1800799003)(44832011)(66476007)(66556008)(66946007)(4326008)(6636002)(2906002)(82960400001)(38100700002)(6506007)(83380400001)(33716001)(6512007)(9686003)(86362001)(26005)(478600001)(6486002)(6666004)(8676002)(6862004)(8936002)(5660300002)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iEJb9HTW375yGfD0yi6CzpzLG8r4h+Ry653i/UnU2heBtoDRNjHUoDwy+9VH?=
 =?us-ascii?Q?2msa/N+kfgbPQBF5+n7dZfEXyKehm14JRNkvzi4XlfG7HYl74bYkK9o+ejYD?=
 =?us-ascii?Q?9R+W/QBKlrd+Zx8ZjeZrkjtNZ6XxF1D2WWuwNzsozdTQUBTtQvdTAnAIUQ0p?=
 =?us-ascii?Q?7wZkaVcFOMUK2AYAfHlL1Um2gz3bQgvxzUHGcZDpK71nIFfEDlQSgIOWOQPO?=
 =?us-ascii?Q?X/4EbA2f9MybiIJnRMaRzDZN8f7vv10G6N2ywzFwn9YU83YBb1oXA/T/ugYz?=
 =?us-ascii?Q?pY/6Uh5q0Q1FDGpgRtC2Rn/RzJ7Jpj63wdVHPB8b1QdWAH9tvRmzZ4oAeHif?=
 =?us-ascii?Q?p2ovZ/+AuKrNXydR9EwAcylOQ8delOGyQwFRuYJMN5QKyigET/LXYtYC5Jbx?=
 =?us-ascii?Q?mEMyPOEHXrIVUvxjo7a1saiUxsgSNXwdp5pu/kpGeq4XJW6u4Wi1WEwXfFqx?=
 =?us-ascii?Q?PumirCOT5XEoKFBrj1rw50CPYqVKRAQBUJdvzUQaGpNEMl9fCTgw1ZutbL+d?=
 =?us-ascii?Q?0S6/ylzhFTHAIkwpa822VTwGAskoVbtKekKwdj69B3/Nf2Zz85uxZTaMnIOc?=
 =?us-ascii?Q?62zQJJ98MT7pXjCdtbfg6u+aPvqDNfHnPJSpMuopWRI30ZzkWlaRUcGx+33R?=
 =?us-ascii?Q?VWfpkh3oNDJQjxAqS0R0Xz1r9rrPERPawnZRtrZvG5ewQU5a58U+wORGylNt?=
 =?us-ascii?Q?GUtHcbzTBEk0oM+tV7CVNXHnBIuyml3jRIYR2QKYXMUw4b62VTcwbYUa5a7+?=
 =?us-ascii?Q?BCYSOSmDzf4xQ0Vmpj96oyUulPUVMYCWrxVUr/qZtFmTO+WJK8wFw+APKqOP?=
 =?us-ascii?Q?6Y/Hyw889YzWpJUT+OkqntNlzUWVVQptQlRw+2HOkceA+S9RshU9sa0LQcmz?=
 =?us-ascii?Q?xqSJHb7RIvtkyzBh3X2WOCXYD00jG2qmL8MCo2FV1HjL0XOdlTqkneOrcSXI?=
 =?us-ascii?Q?xmqfwpwwp0ixRDGR2a2N0IKrZbW7MOz51gQZbiyG9OXmaf7c+nhmKA6cS+zh?=
 =?us-ascii?Q?JSnIl65YBW8PDFrKev2XWX9DBizm7VsAl7c6pVH/zg8Riy5KZFhlQuTYwQMe?=
 =?us-ascii?Q?bOrCrrDOKVcsAZxt2cTZQ54Zg3bO2BGaHQszOUE2kOx1IRlpiYvl5T8CnB4D?=
 =?us-ascii?Q?ScZi3F21lp2hO/FF0m1zWfJYWEuY3LCHhOTSmFKUpJt+aE681F6tTh/lkOOp?=
 =?us-ascii?Q?vFfJV/BA3n6gtDM7Rbndq6CoWqiYdLNDaLgR7GehBJCwJKtvGHGWlGlI18//?=
 =?us-ascii?Q?fgcBF/TrELXA/9yIHTG6w5eZ3bzGJGgng8xNtsbWJfBt2M44HriNkrscF9xn?=
 =?us-ascii?Q?S1E1vQpHWVsbWLGCcL7Qqf+8XRfx0ezcLH2TJiCdOx8EbOW4ahSv25GG9hLk?=
 =?us-ascii?Q?LED82OoAirMlc952WFkMlDTKWrBvy8n8o9RXZnVYxtU7rvzS7lm2cNL+LbCS?=
 =?us-ascii?Q?jKVGN6OkVtyGpENQLELn9lf2svpeRudMkCXMM7qeyg7pIhevLdGjEaIBWzV0?=
 =?us-ascii?Q?L9fzxsfehfWMpQ0KrjBd8HxU/qxL8L3F4cpTuk5kjdkiUa6IhtmHbVzyoh9I?=
 =?us-ascii?Q?Sf4qAdptwlTnd7OHsO8X2Lh2ppdcIKLaegcP95UulRf8PEWkvwU/Pg+owyID?=
 =?us-ascii?Q?XN8MqW2JXbZjaCcJyzZYwRg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 087c24d5-58c0-4195-d619-08db96f11886
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6945.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 02:50:44.7505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcw4DTCxA3fyR4Cio5N1IBBgdJTgBP0F20EzRRLZyKZbyb1OfYRJosjuwzYUsF1g7btGzqRszNZlul24VAmApZY0tP7dDFVWFIB43vGkB9NPuHjzznPWtpR43Oh2fTLS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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

On Fri, Aug 04, 2023 at 04:17:08PM -0700, Lucas De Marchi wrote:
>Use tab instead of spaces.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> include/drm/xe_pciids.h | 50 ++++++++++++++++++++---------------------
> 1 file changed, 25 insertions(+), 25 deletions(-)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 31bb7196aa3e..1263838617d3 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -180,32 +180,32 @@
> 	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
>
> /* MTL */
>-#define XE_MTL_M_IDS(MACRO__, ...) \
>-        MACRO__(0x7D40, ## __VA_ARGS__), \
>-        MACRO__(0x7D43, ## __VA_ARGS__), \
>-        MACRO__(0x7DC0, ## __VA_ARGS__)
>-
>-#define XE_MTL_P_IDS(MACRO__, ...) \
>-        MACRO__(0x7D45, ## __VA_ARGS__), \
>-        MACRO__(0x7D47, ## __VA_ARGS__), \
>-        MACRO__(0x7D50, ## __VA_ARGS__), \
>-        MACRO__(0x7D55, ## __VA_ARGS__), \
>-        MACRO__(0x7DC5, ## __VA_ARGS__), \
>-        MACRO__(0x7DD0, ## __VA_ARGS__), \
>-        MACRO__(0x7DD5, ## __VA_ARGS__)
>-
>-#define XE_MTL_S_IDS(MACRO__, ...) \
>-        MACRO__(0x7D60, ## __VA_ARGS__), \
>-        MACRO__(0x7DE0, ## __VA_ARGS__)
>-
>-#define XE_ARL_IDS(MACRO__, ...) \
>-        MACRO__(0x7D66, ## __VA_ARGS__), \
>-        MACRO__(0x7D76, ## __VA_ARGS__)
>+#define XE_MTL_M_IDS(MACRO__, ...)		\
>+	MACRO__(0x7D40, ## __VA_ARGS__),	\
>+	MACRO__(0x7D43, ## __VA_ARGS__),	\
>+	MACRO__(0x7DC0, ## __VA_ARGS__)
>+
>+#define XE_MTL_P_IDS(MACRO__, ...)		\
>+	MACRO__(0x7D45, ## __VA_ARGS__),	\
>+	MACRO__(0x7D47, ## __VA_ARGS__),	\
>+	MACRO__(0x7D50, ## __VA_ARGS__),	\
>+	MACRO__(0x7D55, ## __VA_ARGS__),	\
>+	MACRO__(0x7DC5, ## __VA_ARGS__),	\
>+	MACRO__(0x7DD0, ## __VA_ARGS__),	\
>+	MACRO__(0x7DD5, ## __VA_ARGS__)
>+
>+#define XE_MTL_S_IDS(MACRO__, ...)		\
>+	MACRO__(0x7D60, ## __VA_ARGS__),	\
>+	MACRO__(0x7DE0, ## __VA_ARGS__)
>+
>+#define XE_ARL_IDS(MACRO__, ...)		\
>+	MACRO__(0x7D66, ## __VA_ARGS__),	\
>+	MACRO__(0x7D76, ## __VA_ARGS__)
>
> #define XE_MTL_IDS(MACRO__, ...)		\
>-        XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__), \
>-        XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__), \
>-        XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__), \
>-        XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
>+	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
>+	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
>+	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
>+	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
>
> #endif
>-- 
>2.40.1
>
