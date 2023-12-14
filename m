Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04178C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 21:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689F510E9C5;
	Thu, 14 Dec 2023 21:55:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB6D10E28B
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 21:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702590911; x=1734126911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SI8dsqtF+K79Qrzd8DKINfglT4OKzeW6ZILD3+OotmQ=;
 b=F+z/72ygv6I1kXvuozp09xqgjL+flV6oZHIaX6O7Nc38/vsXP6aitM/h
 Y//yPHRT+FzQpKeJp9SH4QstN+f09tIZYcSC3iWwjvTBL1SVC3hm4jngi
 m2l6eSl2xYluVmnInYhE+0TFi48EuDHItlCkulnKAM9k8O/jxTJS6uuVw
 1ZbLA38mY0/hMF+l0JVbOkVdzUZ9dTnzk+/HQcXrXyAynT9tpgm85Cug9
 o8F7+TH3RITWam1sTcws8hsmjthQlnlp5/slE4z/IUx468h8d0B4ksgN1
 rgVlwk2bqMcWjykgnh4LOZ2Y6tpcYt7vUBZORacs5WNaJLMOjNcI5XW7J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374698844"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="374698844"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:55:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840433021"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="840433021"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 13:55:11 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 13:55:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 13:55:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 13:55:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2BuxzqmBMEpNzyW2rvvs5PL0I5ZPAnL0lxcDcwkhxszVLWvztYtSSiY9tMgwK4Sv4CE6lyq9HOQWz7BzFsbXyTIjihdNA3EJVCoBW9ouw/ppV1vQgG8qyoW+OYaOZHlWwLrTeTj695/dVuS4cetfPmHTerO9+AOdn7EweV3x9BfvPQ5o2RU6t7iXroJj7vd8KGj+6aXYhoOnR8bGLjL+i6i0IeHc8L/w19g5tGS0GAtuSTCd06SUOQbW3lQecwph5tgjl0jwBmqIcGeLyzAmL18vTrc+NEdvrpd0Pj4t3dE7sZHfozuE1nSEijA8+KpVsF2ZYM2XxRuaW/NKq2joA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI8dsqtF+K79Qrzd8DKINfglT4OKzeW6ZILD3+OotmQ=;
 b=d4hcIkve123aVgxqfBBWFz7GaPsKW3NWxCUw2p/vMWd00Gsxhq3t0poIiQdA/xoSyNKh9RHPQEF1HqMSGnBFp7nMMX9XoMmauTmAXMHSGPTmoW77f5EBYQ4DN3n8UBLegCSu5Ov+vf2xcEwsHTBrF17D6cZ2gjUfzF+M9uDMrZe+eYCXLVWBQ2JRvj7k7T4iINlok/DrpdCdieKnXMfch03rfB4eFwKRKkZm4yuDG8cEe1zKFXr3Ec7pFqI1RSN6cajLFgk2NA+Nw4RX3PocZ7Db1M151BQr6HxencMbadDwosI+37fA3uTnfq15CK6cU4mnO+349CeXR1rQt7Mfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7100.namprd11.prod.outlook.com (2603:10b6:510:20f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 21:55:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 21:55:08 +0000
Date: Thu, 14 Dec 2023 15:55:04 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/8] drm/xe: Drop "_REG" suffix from CSFE_CHICKEN1
Message-ID: <iizzy4atgiyahi7m6mfvnf5weoph56siy2ceyoaz6bqkruaduz@xy5xgillwwty>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214184659.2249559-11-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:332::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc558ca-11c7-411d-51ff-08dbfcef5673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hUav+y1+Yq3JB+g0mWf2f5ID1+lDnCKfz3fFJVwUuD3PFVCVbniosWjuW1Di3Xh1yTXk1YkAAyc88Gy1EKGabAVxJzo0tUnadFffpPXtH3hdXFbzy7B7YT+7mLtGUXHCHyQfD4S8sf8t97HOhCHOC1EoIeHlzam6G5neBpUxen5N0nki/LCUvUkAfEl98BTd1wsNLk9aD8qFY7acLOpB5jYZnd72YHSBs57ezsNEnJpge3jFnZb+idJcN/T+JdAUGe2KQK5G4Rv9GisI4yVLFJkiyt4nBJUjVwk/IhA/QmtlB1u3OEJSO3yAlQ+hL72LYEjGOhukf3qtpU6L+y875MO1mnZOaD4wIzzIieT1DYbmdyDTD3ERA3jjxd/pnW07NTfzDmypYARuQ5cjYXLXObWGzIauVVnT8RL//rwvV1YZK3SCQQBrsISlEa8E9cyDqX53BOzwTyTjNzmyT6S96huSqt06GdeOX5VFf6Kp2vGNwyjNGqA6tzxSc8n5aX08hMXgStu11qVBe+gWMD+4jtGFeCLZl5yw1iJAfOGjA0hwIjN7bPK/Ho00OziwhaVC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(4326008)(6862004)(66946007)(6636002)(66556008)(316002)(66476007)(41300700001)(6666004)(9686003)(5660300002)(6506007)(6486002)(6512007)(478600001)(8676002)(8936002)(26005)(2906002)(4744005)(82960400001)(86362001)(38100700002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mRcvHLmwofmqR4jUHZ6FbZQtWjM8Sf7PZKsVsiQukWcPMlhinQqxOzghcSSk?=
 =?us-ascii?Q?SnTPDB3/9Anzir6wOk5HVjdd94amAU5ILV0MBPCwFmmU34BoDpxo+veMw2bE?=
 =?us-ascii?Q?kreepJ0ejhAMtsh+NHFek/jIHpQgn2zMpPWqvuXJqbsNxRM5DPubCfLWCkIH?=
 =?us-ascii?Q?zQ+DQEL5+/2i9e3ysswa4w1DjA8ZBcyax3R0Bui2RC1mUf2l12JKzGrVMiuf?=
 =?us-ascii?Q?6WZJR6jVL5SSgQIe9+dG70oo34iMf3d4bdATDAcPnKst/jRnkVoFfrKPIAml?=
 =?us-ascii?Q?rY2l31lPaGhHtkAAtIMmKE8PcrrDW0vAr/ZjZLvlF2a5AbNFfYVKXb3DzSLD?=
 =?us-ascii?Q?d4ndRVAHGx2SOqWCpiNfIHXV+YwdfAZaCNQQJ0KtOWzdB29uZS9qjSt5f5U0?=
 =?us-ascii?Q?2AraHj5Jk6NpePUeBQmBt1p0wj2FaSwfums9AFgUoGqkEvvDvaVVG5Yt5rPA?=
 =?us-ascii?Q?8YRmdzIttA4abmf35XWR/jRvs8sw6Ap1ziKDMDbZIln2UFYWGCJSQMMpIlY6?=
 =?us-ascii?Q?Oym0lRzze7N94/i7DVYGDEsFGB9v6lmVr+GiVzx3h38iJZbuPXTYi0fJDCu6?=
 =?us-ascii?Q?mpaB7zXqwDDHoThxZT+u+wHsF/qscIlKN7HCLGncKImQ1LPAd4nVCZONn4g0?=
 =?us-ascii?Q?l1yShFClfUPNU+oseBSnvGAIJjJYXvV5hkNpDGSONVCbsG7kmtutFPkuW0hn?=
 =?us-ascii?Q?dA4bhAcCWSwujjTro85CgZpFY/xF/ljrB0jolkXnK5ynlq+jqu2mwC1M0yuW?=
 =?us-ascii?Q?xXhM6d8pk8rJWz1C6dLk/QcR45CQFAbWsT01wsXo06/AT+347gItES9GDx5C?=
 =?us-ascii?Q?0hqjsXv1jaqeevL5Cel9ZlFiyL+yV2C2WyHqo0GO7RPrF5S7k7j/eAnxkMsI?=
 =?us-ascii?Q?hk2QlNtBpAA7oI1Ls5+vZr1G0JhKUNefyhE2IozN4CwAy/lPTPKeVRgr5K9g?=
 =?us-ascii?Q?hLS/8vZDk3VYA+Qf8u0tsqwj3SY3pIZYVu7w2voWJl5TSMpebGH+lfUA1NAl?=
 =?us-ascii?Q?GnVIEU+kC5lUgu1UrjG5HKnR0q2wEpjFznFJwJLafwLzC+N0moOj/lax+G0l?=
 =?us-ascii?Q?LkWAqbafgjoaaF5bmoXPKT0P1/jgJxeBBNcNxWHSM7xWW8tZFNFDbuArpG+s?=
 =?us-ascii?Q?IKeRAulmgHyx+mPWXQks9SiHK589E3XECfW2kMZyIZO8PK5lEECQCFyt5qxm?=
 =?us-ascii?Q?/+ZG3kO0BqCYgPqdB4l8e0SlkuiqK0W5PKsR9nG7Z6IeXw7CBpNGkLn+AfKz?=
 =?us-ascii?Q?797CDxjTgbJ6rEGnTYA5lnHtcGjG3DGctrTRvzMxuliKBUdpxZXKJ7GEddr/?=
 =?us-ascii?Q?FajdgpYvbSYzH7VoTyTZNIBgGvxEfVaMZkN1WlRMWNeEwlPzWMz6sWwhtndh?=
 =?us-ascii?Q?/XR6PlheVJ/L8BzYVI00fbW6DSc8KbKCLHlWO30Ha042dA89K2VqTbCgy7mq?=
 =?us-ascii?Q?lc1VEr0i6rItS6kSYFSXBimdrIqQ0uGft8tX8kK9DEACjzP52gbALW1nJ8u0?=
 =?us-ascii?Q?7kXqITrLX47h17GZe4KCdv/ikwAfBkRnNEEKCnEbhoIxrGeWaLzIsrplilRo?=
 =?us-ascii?Q?USUmAJRdQT/nyofgRXIvik8jtHryy21louCoO6SjNQz2b59kqiQAwkLDFvNU?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc558ca-11c7-411d-51ff-08dbfcef5673
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 21:55:08.1947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgCjqWm9D+VlRNDHuGXcJugqH2dOsXbmPsgNMe+Q8KauOYhxC1Ssc5ZoFvsOLlJhCE2vI2ohPxb/RNBj1OGMj1CuW+0ZGLNjep7CBPisNRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7100
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 10:47:01AM -0800, Matt Roper wrote:
>We don't use this suffix on any other registers, and it isn't part of
>the register's official name either, so drop it for consistency.
>
>While at it, move the register definition slightly so that it isn't
>separating RING_CMD_CCTL's definition from its registers.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
