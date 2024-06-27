Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6F3C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AB110E29C;
	Thu, 27 Jun 2024 20:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWTImxuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C328810E29C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 20:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719519026; x=1751055026;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O74EGHrPwOJc2oukDS1xtvijwBXzE0eLuN46dLVRLlY=;
 b=OWTImxuZYmNqsYVYQaiO3+y2Xa4TTOV1bTwe6Ta5DPSMGf2XVXyg7MEW
 +1TaACTFmvBcn49R8pX7UY79FTJ0fFfGI+AendIJN6e0erGygTkFCHQNu
 YQNFOmfO2j+NfBJgWr3sMG/62o0+I5kBbeN3lVFpyhDJO7sTRF09uEtBL
 bP+5NO5Yk1aS+jasESx4rIJ1uvpsXFIWDe8hsCJI5akdRU8GTMu1CVCxw
 1kJG0pcBBLpiv1zGiX5ELLXsdWG871SiSdseRpVBNP58ckfXqi9e97Fil
 WJvrmIAd6uV6IxaWMImHndciKT2Qw3zTT/VewPj1NaakEHaHuyidkOdtv w==;
X-CSE-ConnectionGUID: ut44ImQ0Rfe+lIyNiIVrgA==
X-CSE-MsgGUID: qHRfSfDSS2ukthWpDsylqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16559821"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="16559821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:10:25 -0700
X-CSE-ConnectionGUID: F82ufl30S1WovIbdbaOygg==
X-CSE-MsgGUID: p4zOQQ1+QiipTyVA6fun+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44485114"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 13:10:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:10:25 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:10:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 13:10:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 13:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQcNDL+8AhKl+8glSHBqR4+IYUDme5vUaBIJvBhFIUNbGgtHKjYXZM/cXr/lHECiJbjVA/R4BQBGU3IJLHJvD0BuvmxRRTNFzCTm+PQmYUQNi1eU8kNVvmLYzCqcdD7LGu8t1sPI9k04b8L7lH5mpUfDHV1PXsvnpOQkaR/kKU2kMphT+zqfQ6lQf0PbBcwylBSGvdIiF7gr8aE3CPERQkZbAG7oH3npjkKcPi0R8P3WVSVWYI8YKy4ffoABzCn+fjrUngK7s97Yjb4bstrQ2uNHfbEmlnDfCqdwdTt0vWIDQPyzkNYKvLqrwbdJERwzP7DBXt1UE+f2l4Y8V+DlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/a33H4KRsu4aE/j74VIsHZiHKkbYlfx0tQwPBVYdj48=;
 b=jpN2sy37v+f5zlbqc7qVQiWT5AtNK7cQ6nRsvzYJ08Fy/kK4feRDwI82nNnjwAEafznJzvxazXnrhVbSkXsCja2pSiDK/CFkG9wbQG9y/rhRGMzSEpf3BapCE26l7EILtsPJf4j+VGzpv8JHj/kJ8s5fUW4+OiURcqnjNjL2UAh6boZ3epKsbV2yLvrFjR2dQtS0/Lzzt7BsfTjzpFthxdyg3Yvx2I72zNLFEv8cI+Eu6dzltKKGCMcuOoGbdwKHLmY4u57+LWZf+JC41JTVOWtKmopcv0Jn/jvPGjwMaGQLj60M9qZCltL7F99d1fZQpavUX1VUfTzggAMtEP3PeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 20:10:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 20:10:22 +0000
Date: Thu, 27 Jun 2024 15:10:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
Message-ID: <my23dc5vq6jdr7p2nc4t3erbuujdgdqoscdkq5hdsw7ekoyuz6@x3yt67g6anrv>
References: <20240625153842.41070-1-umesh.nerlige.ramappa@intel.com>
 <20240625221354.GX2906448@mdroper-desk1.amr.corp.intel.com>
 <f8efa132-d3f1-4234-8169-94239294c54e@intel.com>
 <ZnxJMrxGuZ2KYzEA@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnxJMrxGuZ2KYzEA@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:303:8f::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d478cb0-61a7-4515-f392-08dc96e52ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jyKvntOCiGY23Zk5iLJa7IdtuL+NXTsXlQ0EfTBz0D3Hft3FOELUeEpbfhWz?=
 =?us-ascii?Q?OKGUkWcu058fRwaRzOd/e4CvdjwO6v24lYRRpJT1SPSsWUtc8KHP8ETRcAqh?=
 =?us-ascii?Q?Ft3Jt6/zvSgxQe/LB52qFsl+GhJrI2aYJef1ddbuoNzJK3aCWfinMC+2yedE?=
 =?us-ascii?Q?RO747e6J8mgvf7S8J1kjOdtDOfaPvpfjzfTXNFwLyggXd0wIV0F3QynUszRp?=
 =?us-ascii?Q?Eg4GwRNZHVfCCmKzyDIvEzgSja3oMvmS/AWNYeiQD38c8Zi1SMK6ynt4ryWV?=
 =?us-ascii?Q?bF5xrhjiiqhftiT6WTrplMDzXd6ryQydSgzEPBHx6LWoastev2qFD+CumfFM?=
 =?us-ascii?Q?MRoh2ZIGKnkt6Luz7VSuhf7EVsnly2ANukpS263ZqLQiKasuuJl2Yf/ucCPQ?=
 =?us-ascii?Q?Mh/39FwCy2s6SDhlB8z0td2Y7kXNzMQtsCRllw2J8L26Dlu/SIy6ddxQy21U?=
 =?us-ascii?Q?ClVdP6K3KZIOe09l5uMETYZTOq91Qh+trSsZ6sVB52X//6JZhFb4pbxOB6Hc?=
 =?us-ascii?Q?NDIhlPJYrOogeRBHxReksXtc+WhCSMIn5N2Ux2Qq4/bzxb1YllkatTwQsvts?=
 =?us-ascii?Q?2e2kJ8uz5Y3W1/f6ZqqFfJxVCdhQpSufdM/r+Uah6DHmqohR4FQTRKwGYiBd?=
 =?us-ascii?Q?HKKAKXWGtCBpLsdq/68CBMXFdApR+VSIPrciptSyCPrxG/f7uA96VvAvVegK?=
 =?us-ascii?Q?0QUtLv2kss+yHU6cXJio1pWJyhV/cRhaE8TCVCJPiK8+/C1pbtmWlQBnl5tw?=
 =?us-ascii?Q?S6H8t/DkUw8+vGMaMGIb6EEk8KNT21assdiafLrwwdEr0P0+6THWnRf8coSS?=
 =?us-ascii?Q?+vPXUWs1IYgTFOo5Qmsn5ndSVWsd/bELgaVFMPemcQAtpf8eUa7BQElJx3HZ?=
 =?us-ascii?Q?Y8n9Zn452BKbeF1lOiBIQMZl2UtuBBUIN9VpdiczMFvniqn01tULtDYvovzi?=
 =?us-ascii?Q?dDlF1rZ74jpsyAs3Dg90YwgW/KW+UtFcvbs1TRAU+nQ5k14XqU0rub6Zjmjp?=
 =?us-ascii?Q?wCmwIKa9O0nhgOgfrwkPRiSvhX1o1RO77VjJw5tvVnldr5G4+AZ8Azl673qv?=
 =?us-ascii?Q?53y9CDC0g4scAraNXCBFR7Mc2MjdJgh5yktKJtqNZAJHvyrAPd2xB2qJbPil?=
 =?us-ascii?Q?nfq6oYByTiUAZdol+utUT7fgrDTES0saEQraZo16bhDuxJclv8RoytmlMqH8?=
 =?us-ascii?Q?Ya3Y4okAPQCHLIkx4RSuuKL8IIObA1AELdQkA+hcSVoewnePmAT4r4Apd8t9?=
 =?us-ascii?Q?ylzETOsJj3e/9ucYs3KXRXPgcqAW3kGu/EjhB65J/3UWSU+O1ZqS37fW6CcH?=
 =?us-ascii?Q?KWhyluyZVfXE4bts+uDkdtHkdasqOiMFZM1jxslL8DZKZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zN5ga+pxMsT/wk7m45Pud0b5BeToNS2PwfKxUYLPQz5/XqW9ZRdORek0Yp3f?=
 =?us-ascii?Q?KLgm4R+glZgpuQEBEUqxoidWweiDnbqTwFB6ycfzGwhJ1pzM5X8EDuyV615s?=
 =?us-ascii?Q?R1jaPnJg1vOAF+2/4YkpHoVAii2tjZ7fPaWMsgwqNMOzCxh62n+rXL6uuymV?=
 =?us-ascii?Q?AjA4TMbkTHJODebT6RR5+e6mwZoj0ec0Lw+3uEQIX3RKlqw4uvleM4w+7nj4?=
 =?us-ascii?Q?PJrxqU7Zz3baRrLfPX7tvmoNZeXs0eiPlNMZWjpFIsYqCXvXsKwCa/nw5QbE?=
 =?us-ascii?Q?LXeMeKofoPHw/roipEFHCtoYeSFWatZtsBbaS7Wp04j1WJ3HdMLxaK2wdYgp?=
 =?us-ascii?Q?GhBUSEdWn/2k4TyhFHg0GvQbdQCw/09yN3H6J6xvkZy2HeTdkMAoXLjjPrES?=
 =?us-ascii?Q?poDuSC/vUvz1HPdVm6sjHvHnFHwk9o1Io2kil0B8BngSZg7eFkZ/kJOqB+U7?=
 =?us-ascii?Q?YkM3+GjWs8W7ZqgW5R9vBq++uZSasLCDy9KPrLqZc91QESzouTT0YqFyDkbZ?=
 =?us-ascii?Q?CuSkPF5qnWurIAYYWRvOmuR5Gz51D0MluXntIiODngF4g8Uk+oo5uLfKvU+3?=
 =?us-ascii?Q?SsrGQdkYHPCr0A9vCXLgALdQvtuHahJ80u5pIybJ68NIfa/s9EZrkoeck+1C?=
 =?us-ascii?Q?LBNNfF/TTv2dBRV38dWFXuLFSIfIgW8o61DG/WysD511aLol134m5tZiUJJ+?=
 =?us-ascii?Q?gMPr1sMBOj6PYHsvZokLsItkIDXWzRO8cBaZG3mX0qruzaHkbTkAjvSg/pPI?=
 =?us-ascii?Q?IpAstF2dUFyy9as5feZyyOLhuihRhdVDTnN46jvr9LnbzuX3Nnnwmi6oVz8c?=
 =?us-ascii?Q?uWcVwJtjlML/AnhdfeSJ0hp3yd49MDqMANH/YMJ2nampwbyq9DrYMb45kiBo?=
 =?us-ascii?Q?O6jeCeKgJC80BbnWJUpxGvlBYcsY3SHoeh9RrwrKEVXQuTbutFSrqrMe9Qdd?=
 =?us-ascii?Q?7VdvJhMcrshQNYts5NfWLJ/LBxLAZdHAIq6qCGJJ+CQSCDGZn95tEq4jeYOD?=
 =?us-ascii?Q?NNbvw0uffHcLaNlI1+VjSNoibdzDuy+UOF/ED/5vcNLIrfjVPade3zMygCuu?=
 =?us-ascii?Q?a6v4Er4raDLjqYx6EeYTxOcRuT6hRbL9IRk4hbCLTtKXwiI2ZJHdjDjU/eX4?=
 =?us-ascii?Q?IbwP0rt/EREjVb1Ns8fbESNz+LpwzFdoDOHzEr72bWhCcNSWIn6tKv79h2vR?=
 =?us-ascii?Q?neK1DFinVjWEqOo+EdiIbw+uHXcQfGA9cKe8w4FZEs0UrvmMoPh4qsuX3c5E?=
 =?us-ascii?Q?8B7aHCmiKdO40Q6ziZfil6kweJ8Xz2E4v8vl4qF76NVN2VE3R0HIdWcC/TyY?=
 =?us-ascii?Q?7yL2ceEueiz8bA2EJSVmNMboDQoHprUZMhpXhFm5DwmqxrbYkL2qRTLXBbDS?=
 =?us-ascii?Q?EBRfoeam1CtRhypHGTVkWFBkKRUv0Ys2XYZ9jJDWQPO2DjHwIu1Kg6ApXpsz?=
 =?us-ascii?Q?FUKlHRpcQyL79h/sZWfIw9FPmO2XPXDAGOJl6WmdY0VF09kAoeHBIikKO4vD?=
 =?us-ascii?Q?q5u4W3XoO7YGZ0fvEn2X+Pm9pNqzjoY56PN/dYlP+/eyfA9X8pSSPJwKNVMz?=
 =?us-ascii?Q?s5kLX2E2z7xiSpU+21Cd+v0Okp+yEDxeV4nLlP3Ry6LTJhl7gmdpD7eIHl9d?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d478cb0-61a7-4515-f392-08dc96e52ca5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 20:10:22.2702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1uCmQmlY9jy8ZZdLlB+rQ4HDmeJGlMfHyOQLRGg+1wv8fCO4YHgTNFC/S5qJues/ag/O7sk+IR1ewc1scbM0eE0u0zsyJ4SC3gEikxS4Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
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

On Wed, Jun 26, 2024 at 10:00:34AM GMT, Umesh Nerlige Ramappa wrote:
>On Wed, Jun 26, 2024 at 09:55:39AM +0200, Michal Wajdeczko wrote:
>>
>>
>>On 26.06.2024 00:13, Matt Roper wrote:
>>>On Tue, Jun 25, 2024 at 11:38:42PM +0800, Umesh Nerlige Ramappa wrote:
>>>>Per client engine utilization uses RING_TIMESTAMP to return drm-total-cycles to
>>>>the user. Current code uses XE_FW_GT to read this register on the first
>>>>available engine in a GT. When testing on DG2, it is observed that this value is
>>>>0 when running test on some engines. To resolve that, get the hwe domain
>>>>specific FW for reading the engine timestamp.
>>>>
>>>>v2:
>>>>- update commit message
>>>>- use domain specific FW (Matt)
>>>>
>>>>Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/xe_drm_client.c | 7 +++++--
>>>> drivers/gpu/drm/xe/xe_hw_engine.c  | 5 +++++
>>>> drivers/gpu/drm/xe/xe_hw_engine.h  | 1 +
>>>> 3 files changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>>>index 4a19b771e3a0..886965e81465 100644
>>>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>>@@ -260,13 +260,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>>>
>>>> 	/* Get the total GPU cycles */
>>>> 	for_each_gt(gt, xe, gt_id) {
>>>>+		enum xe_force_wake_domains fw;
>>>>+
>>>> 		hwe = xe_gt_any_hw_engine(gt);
>>>> 		if (!hwe)
>>>> 			continue;
>>>>
>>>>-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>+		fw = xe_hw_engine_to_fw_domain(hwe);
>>>>+		xe_force_wake_get(gt_to_fw(gt), fw);
>>>> 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>>-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>+		xe_force_wake_put(gt_to_fw(gt), fw);
>>>> 		break;
>>>> 	}
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>index 78b50d3a6501..97f43ba3a00f 100644
>>>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>@@ -1130,3 +1130,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>>>> {
>>>> 	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
>>>> }
>>>>+
>>>>+enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
>>>>+{
>>>>+	return hwe ? engine_infos[hwe->engine_id].domain : 0;
>>>
>>>Not sure if we really need the ternary operator here since it wouldn't
>>>really make sense to call this function with a NULL hwe.  But it doesn't
>>>hurt anything either, so
>>
>>except that now function returns value 0 which is not a valid enumerator
>>from enum xe_force_wake_domains, so I would suggest to assume that hwe
>>must be always != NULL and remove this trouble maker ternary operator
>
>Sure, I will drop the check.

with that,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and thanks for the fix.

Lucas De Marchi
