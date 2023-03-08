Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA108C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B5610E747;
	Wed,  8 Mar 2023 22:46:57 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FDE10E74F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678315616; x=1709851616;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=z8H1VwwtrE3u9J9K4bds7T2RhthodzPdKz1/oPJgo1w=;
 b=SUFBRerrM33LyitBWNgpU+XFgWW7bWsrReR9jBWEEnGg8ijMslcFJtVl
 Owd+kJPsF41iJaG+vRDJOG5KCn4R1HQvHJzUMtw0oLaDZxZC1bmt1Bpox
 aYXJjpz+eUXtuAthyQpg76y/vmSaCINmV1wmXXcudjh/fN9ubyPPgqb1y
 q9daM7g9cLadZUcsvg+zS7GTDDHIzaVHYY1bn+ln3BZTRfc3DLWl3mduV
 n3qWl9oxSLer8nm+dpSx3XxE5GVv6waNtAYaOLNLRVgzgluf/WH0llmqz
 5hNZhJIA2PK20y/jOh/dh1C7w4OBm3b/hz/GdiRoKLMh+5q6N1dHqY3zu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333764683"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="333764683"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707365672"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="707365672"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 14:46:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:46:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:46:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:46:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:46:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQd906P9S5veKLoe19BZJRzEsr0pzcTMJt06OH0P2f5/A6wIi3zFcgdXYnYDvALjnPPHmqoo2Fp+6jY8bcBJgRgDGTLwV8hnWhFxsEmmtVZU82hNgnpx8/8ziTXQF0EMv2ITJuZe6aUFqUgtG1gmrvzi17Gae5UlNIJesOeWcQPpUrps0SJaIlqS1LL4UXEohygdxL81nz5Gyao1on1UEhvaH9i70WFUJCotPvdyRbLltDFVZbziOecYT2TKeMUqG4kG5y4hTvFt14WKioSCODb9p0KTpWx7Z0tu782Hq7DaLNANlHIV7XirNH7yFsz3UeOXuAXSULsnHAh3yCck3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvG5iA/BSQ4qwm5y3Vzvd29Rh+dbcTkuHRm6PEhCyT8=;
 b=S5W/iBxzjztQPd8Yex0zel9Q716xoc4lCSmkd8MDB0ZXt5gpZkjDVS45lJfn8QuohDnNUspLgu2tpko22SZKN/CkRUnJ/BejYArm5Yxl+/JIt+PSU88gH773tTQb6icx+Ydf46cCpGIyjHMuqUm+oxa3vokw9md9WPjMSOsT8SeIKNjUb0SXN7X4lrnouIfClVbfFezGiH1wyIHvphYrTsVUVkeXPHQiztc+ReB59h1Vb+sPGx+KyIXt76UMHv1dtTZWyR2bV84XUVo0wJcMlWJcGxcj9Fm2AOGSJ+ANoz9OT41C6r1CZLxuWQPEzmpkaxc/oG01R3/dKpNu6KEu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Wed, 8 Mar
 2023 22:46:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:46:51 +0000
Date: Wed, 8 Mar 2023 14:46:49 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230308224649.yemrqsvdwtw5eoou@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-18-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-18-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 5681fc25-05e1-413a-0941-08db2027020d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GvKxcxsPAFv5pDImeZWIdkiFr3PJeRRYypwc3YaVhcolKfW72K+NyZrn7v29qJbtcRDk2JY5ARvN8nKd3WKNFQTNxOzsD3dr2NU8oYqcdsrRIM4OW1W6k1/hBIbfR2oHg5H338lJbbombDT3FF70VNydVT5TX0/5aT90B/JU1fcGOzmSiTlTkEI6tqv0axptsw+0/Jqd8iqxLsZJtFNBQTjaADrLkfjeW5F1M6O6cK5PiBhc51os2XSf5xV7imO12n45D8EvH365hNU5xiPcVYvCcpcu65y3OMSdF9biEA9GTjI2gF/bQqzHJi35V7hsBhHJ6b7ALCPhUYNF4aG5xXGcx1h7OB6JPKL2jp+lXLYA88Bjy7SNtHgwUrZkOPGuKxzq4p+j9Mk6XmMfgShvyZ+VeZF1jC5eLKRqsadPJo3AiD0tFl2g2gTBrJxROJGHEv7Rp+p3xbCuWBreXDQ+TLQ8XOP6S/GUMpbKtfQejBrneUW/1pBSuao671jJy6LX9tQnSS7AkcyFZVHYcJJG9VLJAOjg/80Ork/Rkd3oLr+cznVQ7SCW7EWLfnb7XyWWeDJ45naPnJhIWjWbpPoeUs3d+6htrmSCFsJ6kX3nsZ89QhozW4tkfnt4QAjALzld0UJyYML6GhIJG8RfVvbJUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199018)(82960400001)(83380400001)(36756003)(478600001)(38100700002)(316002)(6486002)(9686003)(6512007)(186003)(26005)(1076003)(6506007)(5660300002)(4744005)(41300700001)(66476007)(8936002)(86362001)(66556008)(2906002)(6916009)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kAsZazhs8l1rKNPzDuUvL+qO/WHY8KvbnDATmLMIpyiOT+fqtwvNqPyX6Zp9?=
 =?us-ascii?Q?crElsE5YMp5pjRsq14tljs8VqJcRfDzzwjWDPiZDNnSCdezE4R2i+ijj8DA7?=
 =?us-ascii?Q?34dLzOGT/A4+c3yl1F5d5q1fiaW7IDX/MgnuhLc6ujDSDH30R+9xGg8+hIMD?=
 =?us-ascii?Q?nzk4VnJldiXJo09QAz+rBkaXFkOkAWt4PSByCFS5jHE+QBgZppiwmU7AmkFz?=
 =?us-ascii?Q?sHPLTnB8omAMMe1WfD6c/dCYfkLMuB94aXqW2epfi6oMIwcqnDTYYxeCnHNl?=
 =?us-ascii?Q?aa4y7p9dS6n9wqC13C5F18/s6qJOPc8rghdUthS1MDgEsam/X9xizigLeTp2?=
 =?us-ascii?Q?mgqXdUkLK5nMdvKIQmG49HNS67JtrZPPwNGHiOkF8+5f/y0bHL+7Ad6Lxlkr?=
 =?us-ascii?Q?eFCIAgDKMa050W9Ui9MN0e1f51mCh7XLEbDniVDtQXQIoCpyfdtY7b44Lya6?=
 =?us-ascii?Q?y1Shwnt2YbdMbT8xI0tJgo+zfiKjGWdKcpwYg5wAoFqw0FcOTvqzEDA/WdTY?=
 =?us-ascii?Q?+ODe/1g35116xnrQQDODxeBsJddRNBsOQuM3ydgwQeJ64jdUJ3rlMedgLKFq?=
 =?us-ascii?Q?moLYW6nmka915x2lKpeBQk7uJhs7GF2SGlwlbWHrOHEzb8SjxS4t6617IcTU?=
 =?us-ascii?Q?uJ1cezhLhtBOYs0HmDq42AedZTP38KXn5We/RG/BORjjvT+DhGq3x1ajnEdL?=
 =?us-ascii?Q?P7Hoapt3NEoef7CS4nfea/ikvPPfi/p1m3YFsfeJsSwE+dECPuuSFXbVpbOC?=
 =?us-ascii?Q?LMBOMligzx3C+WTlQ+m6+bdoGBQ9i/VWnsaBIuA6yp3+ciByjO10j0ubxrBu?=
 =?us-ascii?Q?cFQrK8oqlg7ONDFwpZd5pwpoqJ3iMuJ/YmlNiQZBnl6IeGZvphAfC+IgcXBS?=
 =?us-ascii?Q?m/IzC4zhE7lza9CXr2CBEYTHoN9pvcyocMjlB+nS7Cs9q9na3xeSiT0tktwr?=
 =?us-ascii?Q?fz2olwzYJTS5Gj3R+r4Q+xCDpQlL22HoPbkrp7CVDxUdEvT0BB2QU+lvMINp?=
 =?us-ascii?Q?flnzSGyh47NoDhRUKVfNXDRamYO2wJjWAVZnYdUHWlNL/+f6VPZDZGss6Pek?=
 =?us-ascii?Q?e8qKFFeLdYiQ6CGsGiOvmQ/UKOY0IhclF/P64Y4bzfuF7DjbMk7JNmtp9uO3?=
 =?us-ascii?Q?JrJkFUx0pFYIsaTpMI5MPFsSACTWaxDQWo2p8a3MypJ3P8+4v3+6YjwmFfrX?=
 =?us-ascii?Q?TwyceL0tmD3NP4LOysGDnueyQhKcGgqT5oyL55gAwPHJIjEbJqRHibpfzi7a?=
 =?us-ascii?Q?yQFNKSpXcdQfndip25x+Rcdi2XG25e6A61sa7S0tgSXVS5eZcjkvVcepDfVz?=
 =?us-ascii?Q?105a5qfFUTEsyoQiqnjIwZ5BJSKDK08W19IO2yu0v46upld73o5D4bD4Y8qt?=
 =?us-ascii?Q?B0xueOo5MELTJgWvgdrugsY+GxJK2ZtPwNqwdtL4sTKO0EkIrdNfvJV6tK5h?=
 =?us-ascii?Q?7Fd4S8mRV09gSAbHTseKLfQaR0kLhyPfE29l8nc1zenlqygwVE0hfb2NC68H?=
 =?us-ascii?Q?Wok/eqfk6uTPa3YLZYSrpSf7FZXk6a7A3GPufUfgKV8STUZjvd73EAqffwK5?=
 =?us-ascii?Q?OkJ9GSZV+HL1p32FyNl3ODzcDCY9ke2C5crWRLqX4Ou/zYyN0gIeVaCrqFNK?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5681fc25-05e1-413a-0941-08db2027020d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:46:51.4997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BNKdAUPAzGzvDWlmX93QyamSkAk/F92HMgyATQY9nSRXndCxXjU0THi4xHwtJfqWNT82ledHTCEXe8J4tlg+Db5tVqD4KLv9xEv7v/2VyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 17/19] drm/xe: Add missing DG2 engine
 workarounds
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

On Tue, Mar 07, 2023 at 01:24:44AM -0800, Lucas De Marchi wrote:
>@@ -297,16 +305,185 @@ static const struct xe_rtp_entry engine_was[] = {

...

>+	{ XE_RTP_NAME("1308578152"),
>+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),

just noticed I missed a condition here:

		       FUNC(xe_rtp_match_first_gslice_fused_off)

Lucas De Marchi
