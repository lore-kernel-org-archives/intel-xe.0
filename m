Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA13C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 19:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69C110E194;
	Wed,  5 Apr 2023 19:06:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3970D10E194
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 19:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680721566; x=1712257566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sazyxD60d/e0CtNpUYcvJ7/2lLfkPjA/pOxiwb9I9m8=;
 b=c6ODMt9gXlgpjYYipN92cLny9zAFeiESmpGQv0kN+cNIWAtIRzXhO6Dq
 5G8Gdac/TsS+l1mWcYaCloLsxkmxCV24V0sJAW3j3jDNyZa1WDssOoxxG
 1+Duc4/pFG038usg0mPRtW0qixGftPvF8Ul/Ufff7m0w9pFWs8m4NMeSl
 7GD1joSxrK8wXTRZAXnbDbkFiPY7M2p7EHNk41fVadHp7fKsko4QYy/YM
 cXQf5RJI7yIK98iAvHkqY50vP0sCzbB/+3iB3maohAjPcM4a93Kl1I9HG
 0d2zPIeba8EJQPHl3veK4lrOCEQhUhWZq1KST7Fs9us2ttL8svev458pi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370373509"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="370373509"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 12:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="1016584477"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="1016584477"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 05 Apr 2023 12:06:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 12:06:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 12:06:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 12:06:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAMJkk5yTrH7MvIn2DRGkHWHwdmCVFaNuCD68z/rsegnhV20Y6bgl+m12DBDX5uF5UZ0KJ95VRs/jsRO8Wr8/512ak8vTaxYe9bkM9EXX6WvuOLLvMPIbihhW61Kk0Dbq3BoCUGj+ApP+7aazcVGy1UNCi+SunMj2/Y7iMQy+PlPguLJQ676Zdc43KkPXFzcKmj+f0YlWFObKzRFcqBHkLRpUf0yv6vXta9iW0+MGMan6fHnDrl2tnlynCtimnx0ObIdoC8G2lsqXi6Ig3zJblyzf2yQDVP/RiB0hUb0Pxcr+FUS5pM7rYxkOtkO6+UjEmbynCt3e7cwhcAR85cLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTyxKodVtwNO103q4PYVicJ8+0S2LCvtiIIRhXyndf4=;
 b=JgZCb2vFcbr26ujTqzpNjjzPKjMg52pOz5OEOSUliUmqfiNkLI7jnP2DtQsuNOqZuKM59mozNspHrk9HVQPd45eTCA2tH6anvTrGvTVxNZycQn2Pwtl85s7BWWk8X3uHnUhe99WAeg0K3qsQyEPzTJ17k1iEz0vyUQP+BxsMdpufmsKlPVUvbagZ/kNQC54v7twn7n2V/tEoB+wvF/Gh021Jml9MvCO38gHSzyE0GFCFue4S7/5+umTUBsd9gmfjrJ4tqRzD4aSdd76eWdn9Dniq7YS19Jeo/ag1PPVD3lrw5zn+BaWluecvEm6+GN46yU7XrE7tb1TlEij8QTIkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 19:06:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 19:06:03 +0000
Date: Wed, 5 Apr 2023 12:06:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230405190600.at6nb2wsumjbdrfe@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW2PR16CA0004.namprd16.prod.outlook.com (2603:10b6:907::17)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bd2ea5-3be7-4d52-c4f8-08db3608cd1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +gAdrysZQH6dKQmMNpCl2LFjmS2wXOiS8ppWgtJfCy7+YdgGTivJ0K3aqbQxJ26vO8o37L7KWf6dZhjuUtTDDOi/QMtrpKJj/9k2HSnT3I/fvrhJg3hON/QfU3gZI9xsddGkWdROxWgWaaMNpF3mX2fTmD6nPpt7msKIF8bfjoqZBGAGt3PYAlvIyBOnzousHanRjA+iMH2+8vl2ptWDdTJrwNu8T6NX854rp1clh+akLeJ22Yjtg2Q4EKHhDz4/nZnOt7dS4ZB7GKCAz3SB1HbLSpezg7zM/WM6q3VnGVSy6ahRy0vihIhUUcH+bPe62E53V2Y1DzBwoHCbOoSdolx+9AOIB6o3rilbLbeC1reUcEgcsrGlHIvAIXv6mXGfWqsho2KoXhmskyRjqc189bgmbPIQs9YJ+oqh1CmtUz4PSVwgLwshJfmvSr8OKwqawy7yZ3IN4NkdcTE8/ZQBKBYRCujAtgvsgol796H81n8sejLMLF1aL+YXMSRG5fXu+J/WM4TiNm+FhQSGvaoY8Qy/zU0ylzOcgZBAkZK+Eb4AF5gmTEnYcUShFiPAh8Eu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199021)(4744005)(5660300002)(38100700002)(82960400001)(66946007)(66476007)(66556008)(8676002)(4326008)(6862004)(8936002)(41300700001)(2906002)(478600001)(86362001)(6636002)(316002)(186003)(36756003)(6512007)(9686003)(6506007)(1076003)(26005)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cywGu0nhENGverYUjZNPYINULe34YSr7wlx4lk2SGwGubvL/KloliLVR9mPB?=
 =?us-ascii?Q?pG49K28dyy+2Zj1VdE/9Sc3ZWODpyGpegQwYU3C+11n9mm3EVMS74gcz9Y1B?=
 =?us-ascii?Q?kzGh7G9Tg0TOBsX9kTEKSf8LsOh2Wq836Aqr3YfzTCrw/CK1N9i5c6D9itni?=
 =?us-ascii?Q?6CVP1l3lpNk2UfwXYuESMtIUeTN52F3b9yf0ytRE6iD/WvLMg0vHHSScEF6j?=
 =?us-ascii?Q?SoPEEmYI89d0cPJyDM1ArKBwRuquy+q8GaOzyP0wvUFXxg6deSH5HTleGh+w?=
 =?us-ascii?Q?OuNHH7FW899MG6wvHz3pGCu2yDkMnUFZ7bWkNHd/z6yYC1TnkfNd7+wEBWBM?=
 =?us-ascii?Q?sxxhQ+HEHkr2sQzUEfwcuRH6H7x3oUGr/QJB5829yDXLlMc2fGIwRKF5Vu7o?=
 =?us-ascii?Q?7iNHTUhmewV6EBbS7fUjTAFlIFg2p11gowr7zadw4CBHS/CUiJaEeBQ8nN32?=
 =?us-ascii?Q?U0o72NkRPoNcjUUbxRcMPqSkZUfC8Mz68WDfL0FV9buGttYaSUSr77lMRMCZ?=
 =?us-ascii?Q?jM65hpqsrqpeSgOf0GXGmYdk0niV2yyJ9VynUTL4Kc3CJne5OkX1CXBCOUot?=
 =?us-ascii?Q?lMCkxF5JM6MOo8qKcQFIzPv5v+TBFxDxDx9gcNhiIB8mYZEU4J53Tvou2paG?=
 =?us-ascii?Q?uFXM5ifebv7MHdVLaXj0we+EgS63y0M8H37qNenTQ9As5vpDdvT08ixNtzwm?=
 =?us-ascii?Q?8llfz3zqhm8g7rLcnLrkNzl+eRl6UGMeBSFR5x+Vs2CU6RJI9M9pFio40RTJ?=
 =?us-ascii?Q?o+2O7QzXp38zyMZ0zpkrmt0hNHCdcHK/+Y3cKOtfvgvQB48MrEHRh4zz9QvR?=
 =?us-ascii?Q?uv9MqpMdvB//bO3saUtaCfFHsh0fnYhM/ixtREbmVZrCX9dautxW5El2bQqs?=
 =?us-ascii?Q?iXksWlXgRcRlioyN+18f7t6LzaR/bxKAK3mPCtLvcRm+n9rexHjhtnRiTrvh?=
 =?us-ascii?Q?osJJYcyY+A7XyDSvDRcEjK+wvs5gXWILkKKUW6ka837LBkRIxY4DCVrTUgLT?=
 =?us-ascii?Q?HH5VByTnaHTq7kEucpYJ0lgl3DTdoQvFDpPqftec3gEXZ4VxXDIqD+2J4FEx?=
 =?us-ascii?Q?7xEWo7yIByuhfZRdc5u+Dt0G8XPXgR8PrPO56Nt1vB30dyst/GpKaFKTBCSX?=
 =?us-ascii?Q?4J7tV+AACkKuObKosW9JXpzRpJKPWUnQvq0n0dbHtiaJaj2oqD9bU1PskG+D?=
 =?us-ascii?Q?S+ng1fx7WCnyUVylhiSGcU2Yc5MSS6GZ840RTNX0IrsVMK/4raNLGx6bSCeC?=
 =?us-ascii?Q?nxk1LfvM2c/0gyPm377O27+J4L7fUf5hyFK/JZpSN5ZIBj4V9K8FdLijiwDY?=
 =?us-ascii?Q?sZu+kTQGTnxYVHNzbl4x3xJrkWYTAcHnUF/B9UaU2kGlNln5LMylTyuCpXIK?=
 =?us-ascii?Q?zK3btRyJi3ezHCpMpQ0aUdIFV95fU/ucDeSbqv5lSkXJH2VIJMc5dOzb1dj9?=
 =?us-ascii?Q?wEySGPjR+e+YyCXoJZhCe6tTY4gkTeuxKGqjPo/gsiDmJlk0CYe9w2Yjl3+3?=
 =?us-ascii?Q?wIiy+4u6WciLWWyum6BZD2CXQmNgyZ/HguYBs5L1IQnKMft4hNIyL36cmUql?=
 =?us-ascii?Q?/jk63A/DVpaEkvylCXzsOUIMn9Ha+rZ8DgwTfIsnK/oIZOh3Y/O5tIBkOo9J?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bd2ea5-3be7-4d52-c4f8-08db3608cd1e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 19:06:03.5183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ky3jVktj9iGL+HtF1WqN30KyIvriGJWtaaB+TrzXmfjnoQ1k196gFPAKXa7C1nsdw6SY9vzdma9EBNDs1HkX3b6hdlu6npsucDsSsAOBN/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Set require_force_probe in each
 platform's description
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

On Mon, Apr 03, 2023 at 01:16:58PM -0700, Matt Roper wrote:
>Set require_force_probe explicitly in each platform's description
>structure rather than embedding it within the FOO_FEATURES macros.  Even
>though we expect all platforms currently supported by the Xe driver to
>be under force_probe protection, this will help prepare for some other
>upcoming restructuring.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
