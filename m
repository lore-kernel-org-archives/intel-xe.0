Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770C6C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 06:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F90210E5D3;
	Tue,  4 Apr 2023 06:15:16 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F6310E5D3
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 06:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680588914; x=1712124914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CWN0Fel/hD0sQaNGveMOqUpzR02iRt/IZK5JwWH7l0I=;
 b=PeQW6g+29aQAFow5KIGana6zSNP+Zj2h3OOf95GMDiWZedbgg769QvMJ
 DNFxh6W013Qo3ntJTuDjkAyOTNxLOR+PsjnnghV+Qg3TxjNsGpYxLuq89
 8RzMUy9wZA71RoZCuDMvPXmsKDGdbz9plsQCgKazhlTznqIfUOIqZUDnu
 rdcK7iLagx5f/6capos4SjznfeI3GfDJRvmrCtwFzHmrEncsrrNjXnZi0
 tHLkopw1TxhtdKfjmSmrQpzIp9Vm+cFJOhFIzK92aK3Z14qXDU2riJe/D
 w7/oNteJtompDkbM8JNUvoMhCWYz8xD7X98cumi6DNiTeS1MTeUdjd5ok Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="342123482"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="342123482"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 23:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="1016000493"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="1016000493"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2023 23:15:13 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 23:15:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 23:15:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 23:15:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwajQlnZQWfm7tTWISnyqBuQHtFObLfzoNRch7o/MWfTSSXLMUM5jSC8hSD7BBxgF3QVdbbJJ4s4tejhoRyh/WdqKfl85cslGlnYgqBHRpxJcM1gkXeCjC59s0hdM8MOc8lfGztjZSkfCwQAROlrVl1iTdYo556620Zv4UghAf1hiDMQ5Ma7ovovMix8ThIz8MH5+2NG6Z1K+gDR64vHZyYFCtyLNYhYBIUJwWik0XNv+YxHTSRvLW0CwVWbBi5DDEbOAf6y24OCePUSShjq00XDCixeiFOntp3Xpdkb7jYOjYHyL1XqgKlG1it4F4HF45PdtJ33PXHg9mFB0pr4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct+aasDPCrp9BZ/4kDyTOIjciI61D/n51ffiwwAa1LQ=;
 b=U64gbzjQD8zp2b9SgVEd1BvsxquL0JaUbyVgJfOBOTcBzZ+RKc0yDFz3b9+vQFebnffGp0HMdgrzZ9v4Kbj3Y/gQ3ti9WhmKpbGZP+1pFYI5Tuf7RdmIa2rzFa0EhHU0FtD7glI6QoxLtlW3IDuP4zQIicEph/SytrbRK9OYuoYf4jlZiRU6haJTGiXPsIieq2NoHc0kJte6XceeoU3qtkprZc5HtiN/vNy71d7Vb13kogh/62dftfUu4giTh+Hpm0JnewNWEu3AbMnEy4nGYqquFSBSj5Cvurw4+9vEPNxXVfxGB47lX4CJwkI7Heo1H2S0dKCPx7KDieLGMLmRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Tue, 4 Apr
 2023 06:15:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 06:15:11 +0000
Date: Mon, 3 Apr 2023 23:15:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230404061508.2wsisftvm7zqi37l@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
 <20230401002106.588656-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230401002106.588656-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: a8102784-ad06-4c7a-4133-08db34d3f1f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XG0PuULWjN+eNQW2c0KTAIum+Hd0bj5h6hQavLfBFh/dqXIbWe+L/lEWOPq5aKw8uJEtdsWbporzjvc7Fc8T+MpAeMu1n2qvlh/B5qFgIu7h5nf7Ktv6mv6R0mgt4DNMLT2O+E52uN8+pUUt2rpPX84C+XVsHgviuStd0PluFsyK8ZT/TDDlf5jWdL0M/uYHV7yr7+slvJ0I6Fpl/+feGz+TKYdGlD6EkS00helmRixTWKXtjl7eiXsSoT0sIY6xx/418EYg70feCidhfVeRAoYGZi5NyFUJGuGCKo3bavy7117R8m4t+chZwTV1VwbnNT6Zw+ApWR8cKaUdBMoLSXTA8ZUeRKS1DaXKIqNVsavtiFXmDnNr8/39UhPe+whk2VdhrZ6MZfwl6y07jKDxfhHd2mbMS/E1P/pPt5jSO132gUjZE0pjVoj7bBbYOdmOgYwUeYTnEvQ9/Qxe378co+ECekGdlJAUcxW+PHKEhS4Aa6bCcCB0tQKy/jUkFglLxqpXuDJoZYFjH6jH6m1/WuguCd1sioYyu2lY/4G85fRMrJ7gmfO0QyFW5kA9tsI7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199021)(5660300002)(6666004)(6486002)(4326008)(8676002)(4744005)(66946007)(36756003)(66476007)(66556008)(316002)(82960400001)(2906002)(86362001)(8936002)(41300700001)(38100700002)(6862004)(478600001)(6636002)(6506007)(6512007)(9686003)(1076003)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fyLy8oCKUcqFgQaPmwnck5CbAogZ7IJeiFev9Hz7/gfGTLBsQH+kTfoRVhyH?=
 =?us-ascii?Q?AgLSxlHDdiY25+lKHEJpDu4/3sjSwHzjDCgeHzmuTvrJPJnqnG7KY57muHqj?=
 =?us-ascii?Q?+8+uH/3sPZE9N8ZqC613Xn6Rfytfi2QlfDLkjbUyPzyguDbZtKfby60bxOaV?=
 =?us-ascii?Q?evm5WVycNG5X9s4ssbYZtRzx05na+1VxDPaztFfzqAkreY/Y41LWKywqQfX1?=
 =?us-ascii?Q?Wghekuib9Wph69Jri8kSg9OaI9uVwyk/vfNLrtpg1nFnzZCFlacuPbP8tZyq?=
 =?us-ascii?Q?kfmDSxq1Fu4D9L1ra3rYILInNqRcOJFmyHtG1A4VMFdQCSYAPpMWEAd8pEF8?=
 =?us-ascii?Q?FzU395KsiMWR55IFXhWcsDU22PUlDd4UueQqn9U4vhFOjJhWciP8omkrnZB4?=
 =?us-ascii?Q?cpmS2zSVcfukSaKSzTvSkhiZgQflblZYU5WBKmy9EJuZ3UMMGrRsjkLfyP3Y?=
 =?us-ascii?Q?A2VIVdDe0AtoaUYnsDOpGlAgTmcQ1B/Z46pwsw9+HZm/o9e78TD7wEXL5Arl?=
 =?us-ascii?Q?7CUlvffBaLzYTvZfPDVeW1CYundHOsNZojwO/by/+AqttA5Na5sd+kCTJFRz?=
 =?us-ascii?Q?fEEBytdi78libNBX9O/JAHPDuvH5/x+1589PYeBouvpRmD7yDylvAJ8mmjb6?=
 =?us-ascii?Q?AXKk9pjW/Vr5uayLBZ57sMWI+cXTAb4b0esP/JO0n6zoZ3pFVK5nFIyU1Sph?=
 =?us-ascii?Q?4g7EHh/R7R3KGeULQL/RDPEfVCMoahF7fDj7Mde1GMPKlLCUMxMQDuzs74aw?=
 =?us-ascii?Q?RnT6EmPsiQAeonri1RF+dYOkg2MEN8SAzcdn2IWA/TiiLieAXYYoXDhLZC97?=
 =?us-ascii?Q?eKvvbETVWgS8yqwlxFmGsn81Do6RALjAp3hk8xhbnysBFmDBpF6RhfqdN1iD?=
 =?us-ascii?Q?sZsN3cnMeCgq4h37PIqjAVt2bsmIWAtHCY2mwPi1hYjV/pzqKSlc7l6aZHJg?=
 =?us-ascii?Q?uwjDS15rwHjB87sD4wcok+AkxpLuu9mQK9QuGBm82z7ottslCwGG5pwaX8Jv?=
 =?us-ascii?Q?aPM2kwL0knTMLCAEDMo4k8v1sCuCcY0sg/2iNmf0rfTOEXQeTluwTtCAvZD0?=
 =?us-ascii?Q?kZ8fGYJCY6ftdg9Wl+uYRzIiN4mDrrS50JFwHE56WC1Kqo/shPlIZ+6dTxOl?=
 =?us-ascii?Q?Y8aGU2c+9vXlFFqMbl7eZgaE9xO4MZP7fHygDf7E5fCzSTwvJx7Y/hXnsV7p?=
 =?us-ascii?Q?M3doSGJtFoej2xYgbMz1MVQZVu1U9W9c0hUuvThBkMoN918pTYXsYrJW4P+i?=
 =?us-ascii?Q?Vv55coRdQpcQiT4XyB1Dsfch7WBu1H4W+P9iUt3UYV6vllUc/MxK6Jziz0uI?=
 =?us-ascii?Q?oTxB/GwUj4OjteRKNT3uxpWi0e7mnDmON1mlhB7xXMdV0Dy65E5lv74/gsCC?=
 =?us-ascii?Q?DrMb973NW5r48Ywh1jQUCjmf94RE0Bi400pHoXtZxd06x0FDI+gG30ftDVB/?=
 =?us-ascii?Q?bvv+CrpZZl6mliLPncv570qf9BZdyCIBeQWtgId8C6OPn3NYRrTxGUuPMK/8?=
 =?us-ascii?Q?5jvs2Yw4wPj0kYBXUdgDneRkAOLSiOQM58g64Pr5oHi0qDPOA6Mb77vOPjCj?=
 =?us-ascii?Q?iVQmYPdcaBRSyMXCfNuUM7a5kXIRE9mlZS5Xinp9p3zmwb1i5QedQ8pYRJoJ?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8102784-ad06-4c7a-4133-08db34d3f1f5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:15:10.7984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOVuhbbB6rg46gy4U+7egl6aJwS6QIYcPD2UOqzu2rtV36JtHmwLXSC7mIjUbIofOmXb0IJYjCn0k36sOUrWpiX922j44cJ6IVQaC4mgXTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/8] drm/xe/irq: Drop unnecessary GEN11_
 and GEN12_ register prefixes
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

On Fri, Mar 31, 2023 at 05:21:02PM -0700, Matt Roper wrote:
>Any interrupt registers that were introduced by platforms i915
>considered to be "gen11" or "gen12" are present on all platforms that
>the Xe driver supports; drop the unnecessary prefixes.
>
>While working in the area, also convert a few open-coded bit
>manipulations over to REG_BIT and REG_FIELD_GET notation.
>
>v2:
> - Add missing renames in xe_display.c.  (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
