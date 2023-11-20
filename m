Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A573C2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 19:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3549110E0F4;
	Mon, 20 Nov 2023 19:44:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E571410E0F4
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700509438; x=1732045438;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6rHTRWjPsrA+hOIVBAm5zazw0qVel0CwUs6lQhwqrN0=;
 b=lbQM8H2oSTA8wT4u24e3YBcmgnx2Oacvft1waIA+GYhedYjjOFhPm/NZ
 g12mREWQ51NML/S4JVOJxhpiZlyO88ywfZNY22qCFWjnKNXk+nv7EbPkO
 dlxLXLfpMT2yfwSrPj9H6sAiqebHQXr8IoUQ9bQuCKMcPm7loZkLh8fqd
 5BebrabYNOWvJQuazdog6VgeGuGwjiNcfJ8FGP5HEWmiB1CHC/yfh7ppu
 UxKKdg51jg+cMCu+dLY+cH7dghofAjgy7l3Mvy/1EfGS6hSoxdDTO2QmG
 x2Kw4xeFCSB8XoNbcVykEbPc5Jp/CVyWZ2YCLM1w7y9HYE8tRZ/onx5Y4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394536040"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="394536040"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 11:43:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013682029"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="1013682029"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 11:43:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:43:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 11:43:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 11:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjFPUgKsso9/+2/ciwg2F1Dz4BNVnGPaGUp6BDxZhGeaCydZ6CXALPgF9mgnhc10ArPeHoe418IKfAa5BDBWFujEFY4AgCgiDJp/wHTzV3a88IwjA9Vh6JNn25COQvjm3m+xesSSF3jLcvJrARClUPKOQIOc4Yd6pNIFKh+MXUWUIfI6LdUJyc73k3Kjebm1wekGvdrQYli0dRFwu0//lx6QGkaT4NC1x0RmI7XNWkeomASeciZsavyQ2SLqZXcjg/XVQYq2K0moEukaEVGpkv+aq7gPm1LtOXsq0f6J4yQdt4caFAUihUSqhR8sWZYF+u4ZlkTHtWEVWt8b8gpFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIttrndLwDaZSvpq6zWowKQHrdU+hr1bqEXPSt47z7Y=;
 b=ZiVinPFAEQKkKociRYQ6DhMvzElihp9Nr4y3+wjqABShQA0aL3l6qi/DqXwsAj2FCxPhGzj2Oln8v09klOqnB6RnA41Kr5VgMQEVA1CxvddiyDO/Lkolliz8oaOLyJ9i6+EHjz/LsQsmLX1Osf2XnpBO6HreJfiOQFlUw1v6tNZcs5Gd+k06+nKG05egzhG8pJF36guYTzn0GrltEr53fyqo3TuZ+sEq+adE9pG8ZOUrQX6V+JcutPbLmYrqxGp81qBzTOEBP1B3g6m8eaTawqU0gQ7462NkJbAJrKLiQ4kRkFsz7PF6eq7r+MKw538qptdgkTgd/z4dmhRW8FUQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 19:43:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 19:43:55 +0000
Date: Mon, 20 Nov 2023 13:43:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <n6tdai3b6bq7yaxt5kpo3leu7n6irei5wi2wzxyjwrbqng2gmm@fdcp5kndprug>
References: <20231120185712.80150-1-jose.souza@intel.com>
 <20231120185712.80150-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120185712.80150-2-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c21b22e-80c6-43e5-8d94-08dbea0107d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOaj1nEXxgPDhPFPDB5aCNlMRgJLaExplYTDli2d/AAkQStrju7gTSshfmNzZBivVnOyOBS8wAEiUlC9E2CoeP4yxO9Meb0jJWtLgd1rFt/0v1GQ/zrnXTdPQowrSD40Rst6jWGABBxjEItnD9uq8BFgR25DcFxmBbOhZ4WoHqwHg8tv+dP7YWXdbG09rx0elbKbrtJbmcpn3hc9+xlziTM9O012IiC4XOl9iTlo/Yl2ls8Y7rZt8dL2wPrx703NyQTEeUsovHKKfmUlfJwPovWzJUWBbAQApoV3VTzbs2QheFp58NbWnXmHCDd2YrefTDgJIaa8MNbxmKxGWcJU1hZm6mdTTyC7QZB2OMLiPddj/z3RvGcFbW6RL673e7IdeqQXP2dDvsn1BiOz8AZO/fiVtoYIJq/lPPtp53pufroB+3FueE2YVRNljGLJ+vetRjOuktoO1FXo/StsolytzMEH+z8O4iIt4Pb5hGIAGBd9dDrg5K9cuIZ+pWCg+JYvH1mtWWnQyauaYJEQB2Nh1EE1UKHvWrr6gG3Iwy9EzAozxWM8Knj5LeVXa2Bs81gc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(366004)(136003)(39860400002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6636002)(66476007)(316002)(2906002)(5660300002)(41300700001)(8676002)(6862004)(8936002)(478600001)(66946007)(4326008)(38100700002)(82960400001)(33716001)(66556008)(6486002)(83380400001)(26005)(9686003)(6506007)(86362001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/gAQspNsERsPDzZHZaDPHVaC/0I1iJ9gLtbm3LLhlHbBqL6f5i+uIezPSS?=
 =?iso-8859-1?Q?Fm9TYSs+fSx2OzasjcOMMHth5diuQy7ajrA6yG8oTbh+GPiwjPBJ4XILEA?=
 =?iso-8859-1?Q?SPrPXca87oZEPWVOGtA5WwJLZmj4UHhXU2N9k/Y/dGTCaHUDdEesjVYFDh?=
 =?iso-8859-1?Q?YhP4Q/cZpu+Big+vFf2QCN2slIUFqC+6mA2nwV7094kUikJBBCCTqvoiQg?=
 =?iso-8859-1?Q?ReYSBm28qOb1pliUNlJUO44XdTNsy7VPoh5Q8GazuVRvm9NJCE46rImK1B?=
 =?iso-8859-1?Q?KVNu/qEIbCIbAPV2BVPAh631nMENfFqSB+m6oKmo4zPkkJEUmHb/MhsrNG?=
 =?iso-8859-1?Q?39ha6kuFwU2EXA9e4EaQnkqouyRc3ZeMHOqn8ovyt9F/x2nEvo7nKVRXCn?=
 =?iso-8859-1?Q?utdFS+mUzzSrSOPGgaumtMaHC43nEgYFbylKLBTW9ZD+ZKchDoUZdMgP+v?=
 =?iso-8859-1?Q?zkcbvGDfqq2ka0SH19IM++bS86qhvUp2Bk8rxlR8DyeBfLbT6N3xX7zoNs?=
 =?iso-8859-1?Q?j3tlmgsVnJ919Tlizp0J9oxnQRdvGP2+UxP8FbFbXTt40x2QBZnpNIe5ti?=
 =?iso-8859-1?Q?QP7/L7+K2p71Ca1/iIqcEUgeiUVZoiYo6fdQFMFvVX9hSl9bvTjXjPI7Ei?=
 =?iso-8859-1?Q?y/dxFKtJyESqCt96C0k7Kua1+hwHZtLc0m+M8ElnofZafriTdvpseHSqdZ?=
 =?iso-8859-1?Q?s6o5J4//ysUi64rR3ueDPxUNsLUfCDZZURpaIJb10UjvUTqObslgaL6zFC?=
 =?iso-8859-1?Q?J1CVOMS8aEC/Xn6K0c728ky5uCBXI+Uf8wKgvHY0R4NbCSJFoPM7bixtSx?=
 =?iso-8859-1?Q?VrfAw/KBG47sfmB30VScr/6LH82h4AN657sjzBvnijRAMRzDxOrokKimjj?=
 =?iso-8859-1?Q?SQbAu+uOqypnMyYDTxfFejbHdXqfh5v6YVrf/j63Lxg6+7Rn+jXKUSwab8?=
 =?iso-8859-1?Q?3QtC/vJfYqbsRv2Ax19amAVYlP87zrX2Xs3eeCsTszezjixrhESPxq2wgr?=
 =?iso-8859-1?Q?1Q+TLT9GACCQ4ozqX6208LTC59sB0Lq4asuDOyh3pZSt116ettZlkrbaxR?=
 =?iso-8859-1?Q?l4SE9WxoLQYwmRMXiQGhYD067WSuNA3AfjKCf6AMwH4FWz415mNyhZYtqI?=
 =?iso-8859-1?Q?z6DTyLW30LV4zdTnflZnfW9KXwdFCG1IoKhVLMZ02Dr8unHZmYMoZye29p?=
 =?iso-8859-1?Q?PY0+atuOkEx482s6RTIDIvP2QoXp28HolJ14SZYTI+epm4kq6c3vxxYEDe?=
 =?iso-8859-1?Q?EfM3mRp4sW/rRNhcIqV9JQ6/F6KTDI5ZtBSVUnCiZyj13u+ce7N78oaeTE?=
 =?iso-8859-1?Q?j1JqETqapbEId/Lptif0e6TVVm8YFisRyM12e50mmONNuXsMG5eoWnIubE?=
 =?iso-8859-1?Q?6kB5+5/01TxbYDg5y8AEPvzHFrk9uqHdKfDwfgOi1SYI6OdNfN9dkXdgPD?=
 =?iso-8859-1?Q?ea04BTAOGsou8Ln3OCXYMvWtjYeq/ssbsRNQk1SF75wga0UmSc3xT4ebYL?=
 =?iso-8859-1?Q?Pz19LjuNryVD6zSZWJh9t6xmS7knfszAMqvwsSjh/ZD6tRxC4GbJn6zde5?=
 =?iso-8859-1?Q?Y8VdNKUfqa/AJpWqcMCvHUZEbWjKzPPsYc87ekuPDj9yUsaG9mqndMlwg0?=
 =?iso-8859-1?Q?7ixaxdbuSozECHW2XccPssRuhyKbQJmmbKR4+f3V/96YbUIDWo36LD7Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c21b22e-80c6-43e5-8d94-08dbea0107d4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 19:43:55.1824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svS5v71tcafqbu5B+ZaFCxL2ohQ1ZcPax41AvH7qysS0IPkDDKCoeVxtvH+6HjNzE6YSuoXToefGNJddX5SgUmKHbzy+sN2ONa/6lu1viJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add missing RPL and ADL
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

On Mon, Nov 20, 2023 at 10:57:12AM -0800, Jose Souza wrote:
>Those are ids present in i915 but missing in Xe.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/drm/xe_pciids.h | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 058a68de3bb57..269622c7ddd0d 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -67,6 +67,7 @@
> 	MACRO__(0x4682, ## __VA_ARGS__),	\
> 	MACRO__(0x4688, ## __VA_ARGS__),	\
> 	MACRO__(0x468A, ## __VA_ARGS__),	\
>+	MACRO__(0x468B, ## __VA_ARGS__),	\
> 	MACRO__(0x4690, ## __VA_ARGS__),	\
> 	MACRO__(0x4692, ## __VA_ARGS__),	\
> 	MACRO__(0x4693, ## __VA_ARGS__)
>@@ -113,14 +114,18 @@
> #define XE_RPLU_IDS(MACRO__, ...)		\
> 	MACRO__(0xA721, ## __VA_ARGS__),	\
> 	MACRO__(0xA7A1, ## __VA_ARGS__),	\
>-	MACRO__(0xA7A9, ## __VA_ARGS__)
>+	MACRO__(0xA7A9, ## __VA_ARGS__),	\
>+	MACRO__(0xA7AC, ## __VA_ARGS__),	\
>+	MACRO__(0xA7AD, ## __VA_ARGS__)
>
> /* RPL-P */
> #define XE_RPLP_IDS(MACRO__, ...)		\
> 	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
> 	MACRO__(0xA720, ## __VA_ARGS__),	\
> 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
>-	MACRO__(0xA7A8, ## __VA_ARGS__)
>+	MACRO__(0xA7A8, ## __VA_ARGS__),	\
>+	MACRO__(0xA7AA, ## __VA_ARGS__),	\
>+	MACRO__(0xA7AB, ## __VA_ARGS__)
>
> /* DG2 */
> #define XE_DG2_G10_IDS(MACRO__, ...)		\
>-- 
>2.42.1
>
