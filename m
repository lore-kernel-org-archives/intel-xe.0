Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A660EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 17:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050A110E8B7;
	Tue, 10 Sep 2024 17:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqOF3tWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E50210E8B7
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 17:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725989975; x=1757525975;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wLiESa4BUgqA3ZfW2iSQuvbZE82QdcJxQV/ZuOweQzc=;
 b=kqOF3tWwbFR+fHZfn8ifu4rI0K2A5hvgLG7gB0HQzUnbqHRgxMjLUJrW
 YeimhQ6Fu9fd8T7RavCWogM0yOhrHZOjFw5+tm17pkM7sQaWLPHqO1BB0
 m901Xivf32KDi5B+4uP5xb8CotrweRDtqMT9X+PdeNMx7DjFjqR1gj2cs
 v27DzCxpAoJSvEEiOoyXQ2NRPeLmUYhKrQd3ILQBcqec94/bafy4lz+I1
 hKzqwBuF9kzVd/8af9LhF2lKEc6lA2FGhUkCDnzv6GBeh22Up2qlRBV5p
 QLs6nD5SbyKWCYjISSXnwE/mjNL7WGz4MMl8GK/Wa4BXPsI+qPWbPA7OY Q==;
X-CSE-ConnectionGUID: UBG2xbc1RS20H7hxK0P2Mg==
X-CSE-MsgGUID: UVMKx5jKQFeElQgHIZOtEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24298905"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24298905"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 10:39:17 -0700
X-CSE-ConnectionGUID: pxI32/A+QL+M77ZdDbzUTw==
X-CSE-MsgGUID: wBJHAqRXSL6P5/STn4IjPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="90381147"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 10:39:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 10:39:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 10:39:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 10:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnTk8/aqkM07mNy86hBrIFigiXI9ZVGU1kc+MvRxawXQqzQCCoaskzYJY64lo6g7QYID98tmI4ue54Q7YQt+b33HIkEj3tRkLeHIFwysh994co5RkWz4nNh6kk/HghZyy1NDx2b6OBcatALuTOdq6hrsGNuuOXps92pNJkL6AKvGqaiR6AaSeazAYBg7nsBSRlEJQotoOYv2ANJAWdWUZg5hyt1UG8AXuNxJLw6Bol9bU9vuDTLQbM2fRPftDo1y+foALd2TMRLeMeE6SHAg5nORv2mQvLyMy6LwU4au/s4SZpHvC/9OTKRqdhWq4HtlWns2yyVwOtpdTgUpn9xflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2h35cmT4po6O/KfSpDGKIkKbimteCDAfAEm8gRscxy0=;
 b=Kx4zyta9C4lJZmi08dbl8xoo6xSy518IzcegqsSV55XtuVkUc3h/qj5vyfgb47W81Sgn2g6qsdjtzpbW/l5/bxHOcewdHxwH/Z6MTAYkQX2WlDe0+3uSuyjNrZIXBwMvbXCFqOWlp4WFj9QA/Fd4Q2I7Hv0NGS/as8bA61PFCKfAJIkBgezKWd0qGWAHnCqQt20LnwbMPzRVO7JGwrUWTfulWw0Lm7Q4/qdrcrAQzWLmCHeQZntlrVPvX0gcglGOe1QJa+6nbaYLCtQGw732aTbbYNrR5efEeIV9PcEqg9nW30WyRch96ljo58axGQHuxDC//JvR0QWIdWEW4jwbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 17:39:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 17:39:11 +0000
Date: Tue, 10 Sep 2024 13:39:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [RFC 7/9] drm/xe/gt_tlb_invalidation_ggtt: Call
 xe_force_wake_put if xe_force_wake_get succeds
Message-ID: <ZuCEO9o3aqy4fdU0@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-8-himal.prasad.ghimiray@intel.com>
 <ZtoIk-OUD7qkBvKn@intel.com>
 <9605f23a-ce16-468d-a7b3-2ea3d9be2f21@intel.com>
 <Ztst1yxHrJyHQMl6@intel.com>
 <43116f22-0495-44ec-9895-aad9dcd5165d@intel.com>
 <122fbba9-8174-4c91-8085-5f5cc940db17@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <122fbba9-8174-4c91-8085-5f5cc940db17@intel.com>
X-ClientProxiedBy: MW4PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:303:b5::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bae6c40-f16d-4554-944c-08dcd1bf7af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wKa6oiE+5QFlxQh0vuYFQbV3emjmyyb688gvTHk28dGWsMtEqroLq9ItKN?=
 =?iso-8859-1?Q?ia5RH5j7vRihLOe4tcBi9A1ObqAHibSOOcbxxan8S2BiXbvEXTK6/ujrhM?=
 =?iso-8859-1?Q?tmz4tkd2uKdylR0BDto9Umode5xhFRO6p7BZlTNxtgUHA3Ty5IDhCfzKVC?=
 =?iso-8859-1?Q?ypmseBT4niB/B9OpASv5yRi9kTkl9WzJUZjPobEQBcY18EDe6CBW6IkYbw?=
 =?iso-8859-1?Q?T0nds1YkjBOD8UOsfASv77/NYl04Q/3mybuNZ/AAfbbcNxkcv6o3un81fi?=
 =?iso-8859-1?Q?5cd0anVpGT/pial6Kc0I8EyGXhihhY+t9d03CwwtVxnnOMeFlLck91X+xC?=
 =?iso-8859-1?Q?Qnqwj932PfBCHlcHi1XaXebL5gGtI5tPXZtEfPpnypT/pHV2ytyKj9/9Eq?=
 =?iso-8859-1?Q?yUVLprRqDQuxttO3I5vUQOPFlDLm6CGMDxsaQO7lABPlLGKu0bOJqwJsu+?=
 =?iso-8859-1?Q?C+XUMcUWQSm4CCmraXHvN0ccxjWifi5wLLWyc+Fu1qnAQwvcRk/6lzEaBp?=
 =?iso-8859-1?Q?ncKzCDb8cChN1YFCbPzPXBMH3Z+CkT/u7NV1JelmXDZsIcq+TAxFqiHsMx?=
 =?iso-8859-1?Q?iNLBFjlkJU+hBYWwH3E+ziHQ6CxoJw9s+Fcv27ZOxszIK30iyjdnvsdPo+?=
 =?iso-8859-1?Q?JRHPzMyXoS5amrHD2wN0Go/1LH/myLmqrE4JZcQ/hMqp5/RYfI8fcmiwW/?=
 =?iso-8859-1?Q?yheVrSJs679+gkCwcM/VjkCjNPCwYrULwnsfYEevRp3vkfJ10WAUp9ATCO?=
 =?iso-8859-1?Q?rZz6Vzl4bib4SnTY+Oez+Bz8JITbkADrFaUadHBRkHR9shkVLfir/NAk3x?=
 =?iso-8859-1?Q?IjRDyoETSDsdW8n8IFFaIOjUtN2p0xw6IRNdosdmhh5emViunKQdsrobiG?=
 =?iso-8859-1?Q?k9gzJ8ATs6fuXNtF2y0qN5sx5FgpsJv4P+qLLz8DBSsJhsuljBAbViY8UG?=
 =?iso-8859-1?Q?dj0kAFU8G6vteQBAboyqjapPveK2GKFKMMzxsyoQkTcd29PokQXVy8WmaX?=
 =?iso-8859-1?Q?mQx+wD8Bvt+uP3N0ynuzRu+l1wiSaWKrHxrZ0wytiq/bAJXJ8Fm/n5g+CH?=
 =?iso-8859-1?Q?+xTzY+BOq6rL4Lm8N0zhkqLlDcSHqM5mMg6lGzR/Elt1+6k1w3gX146hEK?=
 =?iso-8859-1?Q?tgXJiavuRH0ug4Ia1n8SOR181p8+NxgMh62l/hab/mkyAmEFKgDEw/IPos?=
 =?iso-8859-1?Q?QmlXv4yMmUjIumlKtnHJdNftD2LoXFMFADMkRTIfppaQ8T3d5vLrqfCMwk?=
 =?iso-8859-1?Q?U0E2FQjkO95abiY8CBDMb08RdELBEnTXmi7oE5czLvQXhr0y3lrK9gC7+I?=
 =?iso-8859-1?Q?Cwolbs0GC7BYt+Y1GvlNq3A9wqaFDt4BVAKp//4Zk/SKnNERNWOVc30gBh?=
 =?iso-8859-1?Q?sdNRYi4AkdKzbkBotkefLqsqzMqUIFsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z4IAFKyq2VsyVTrFL6pOzHRHBiDg5ENinbhaTsojJQyJvSbyIONId/aeUP?=
 =?iso-8859-1?Q?2Wj9ZPGidr+dcCsBdw/ZzGfOSu9+jjv6zcn3h7p7pjdQNkDuToRvK6IBEk?=
 =?iso-8859-1?Q?A+zeNT8OaKRBb76qpsOPlMYKzjT5BScO1R+mih5XI9sBPx2YrUC/qXDA2r?=
 =?iso-8859-1?Q?zzzzXdOl0lYsb1slLaedQpIBmNVlpqyQv0jEyRGlEp/wzIO8f9MwkWNzFg?=
 =?iso-8859-1?Q?gr+kk52I0MWQigCIibex7C9rAuexeka0Vm16Am9FxSVc1Mol4iR578LWSS?=
 =?iso-8859-1?Q?KjmAY1wIBYFC3tOTLW7ZTn4fiYzn7dlaXd2ej4J4MCM0R8PZnVD6tTjL2v?=
 =?iso-8859-1?Q?lRTbgCnYEbg68lWKRe820rSzm1fGXvDeq+9BtSP/G2Z2jSiKne3ulmc6hE?=
 =?iso-8859-1?Q?QylLmVkTokYeDLQOUnBKi8aa/HcIXgxeaC10tK9+qr5x1gs+hM42uRknH7?=
 =?iso-8859-1?Q?peCPOQrD6WQW7Mt0sFhbG7v986KDS6Yk7FwnKcEvmRHRaWq9fn2fpU2EQi?=
 =?iso-8859-1?Q?yfbgXCHHOoou8xftDsmkM65qX22HqnP3bvqf42R44aBl2KQB3gFMMOub2Z?=
 =?iso-8859-1?Q?25NpD/DyZ4yjELB2xrc46TejI6NLbnbFkTNFHuwxWZboxSgpgxXoYIkU7m?=
 =?iso-8859-1?Q?IoU1/YehExfAGhkDs1QBFfnaBswezAo9q5xzAEmWD49te1MSzZUgMUqSqM?=
 =?iso-8859-1?Q?V4VUFSOwTkKiauqm5YpV+WhcRu4jvix7AZrFMuNh50lVDxToBYW23BzTdv?=
 =?iso-8859-1?Q?GhesSt0j5f0QxltHLDJZHGnAcdNMwV1ROJadUeXcCzPGGl7+5TlIgB+WD/?=
 =?iso-8859-1?Q?lthW1yRg2NDsMeLzJe+mHYJskFRjkxOT8nByaWpYTwd2c1kS1aEHMCSgiG?=
 =?iso-8859-1?Q?Liphy6/XKIfw8xNfZiAW3IXaN0vVUKrRQohaEM/IzCW5uz6daXBlDetwuv?=
 =?iso-8859-1?Q?rk39MU8khri3GF+eKiU9bfl85aY1hwUqb2JiJLzVIYn1HD8A/8yFp9tP2F?=
 =?iso-8859-1?Q?RKgjR+QFypEUYWDb+FPRVo6Ubtawn3+vhZqBXz+I50nFtUYNmRZNeQBcCp?=
 =?iso-8859-1?Q?yzfhZoj8ZD1mL7UVivyAKKbdv6lnTOC8ZFfQ6iG8H5aSJBMM49rlDlwraZ?=
 =?iso-8859-1?Q?HPdIOMnZbKj6tpsFmC7g2fsXTaUftqDjTJnHLsy1kcxhyGhoI++rF3ojn2?=
 =?iso-8859-1?Q?T9f9u7kMSOJ62Nbb2nM7Kxohwr5tJa4vXzG/tIlCXs3dr9Bj2/GiMD3NO6?=
 =?iso-8859-1?Q?aaod3FEMjwpMow2m8Gb75dMwz4jkY1wVam90pRNVjZ9ZxJSnvt9uNc+GdE?=
 =?iso-8859-1?Q?KsqiKNoDyL4ruT1hCi/gmsQuhEPL0B2Z8e3xXbY0+DyeP0P98ShxyGOx95?=
 =?iso-8859-1?Q?utEU9a3XiPhMml2r5fhmRd5Gw9s5tUTZayp5jLSUVYBMXWXplr47gQ7Y5E?=
 =?iso-8859-1?Q?GYqjvLsrBPPgEuj4iRk55Rtj25qo6BSR+zSWlQl/D+iFz8nc0s6h5sSGb/?=
 =?iso-8859-1?Q?1WY1R0fhGq+YJ3XHCBOvHZR7h4cjtQPJzZUmPZTKPTxZzegvPSpqraA6/e?=
 =?iso-8859-1?Q?QJ5MhH2RiCt3ZgSbdooK635TDUhkuq7MhhZaF7vZMvOIyZA4IaELwzZAl9?=
 =?iso-8859-1?Q?ol4T3S+Jobu78AemYX/F44j2TeeLHp85ybh7ItC2G35nfatuctLYoGUA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bae6c40-f16d-4554-944c-08dcd1bf7af4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 17:39:11.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuztxUTzHy33KRZkexFBME+QUhtO0V+bTFkxzGx8tI7jA5b1/QyjqsP7JJPvBr45sJRZtSf1Dadm+uR7jIw4uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
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

On Tue, Sep 10, 2024 at 08:07:01PM +0530, Nilawar, Badal wrote:
> 
> 
> On 09-09-2024 14:59, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 06-09-2024 21:59, Rodrigo Vivi wrote:
> > > On Fri, Sep 06, 2024 at 01:21:41AM +0530, Ghimiray, Himal Prasad wrote:
> > > > 
> > > > 
> > > > On 06-09-2024 01:07, Rodrigo Vivi wrote:
> > > > > On Fri, Aug 30, 2024 at 10:53:24AM +0530, Himal Prasad Ghimiray wrote:
> > > > > > A failure in xe_force_wake_get() no longer increments the domain's
> > > > > > refcount, so xe_force_wake_put() should not be called in such cases
> > > > > > 
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 ++++++---
> > > > > >    1 file changed, 6 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > index cca9cf536f76..3f86ab704c4f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > @@ -259,11 +259,11 @@ static int
> > > > > > xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
> > > > > >    int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > > > > >    {
> > > > > >        struct xe_device *xe = gt_to_xe(gt);
> > > > > > +    int ret;
> > > > > >        if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
> > > > > >            gt->uc.guc.submission_state.enabled) {
> > > > > >            struct xe_gt_tlb_invalidation_fence fence;
> > > > > > -        int ret;
> > > > > >            xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > > > > >            ret = xe_gt_tlb_invalidation_guc(gt, &fence);
> > > > > > @@ -277,7 +277,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > > > > >            if (IS_SRIOV_VF(xe))
> > > > > >                return 0;
> > > > > > -        xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> > > > > > +        ret =  xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > > > > +        xe_gt_WARN_ON(gt, ret);
> > > > > > +
> > > > > >            if (xe->info.platform == XE_PVC ||
> > > > > > GRAPHICS_VER(xe) >= 20) {
> > > > > >                xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> > > > > >                        PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> > > > > > @@ -287,7 +289,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > > > > >                xe_mmio_write32(gt, GUC_TLB_INV_CR,
> > > > > >                        GUC_TLB_INV_CR_INVALIDATE);
> > > > > >            }
> > > > > > -        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > > > > > +        if (!ret)
> > > > > > +            xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > > > > 
> > > > > looking all these cases now I honestly prefer the other way around.
> > > > > 
> > > > > If we called the get, we call the put.
> > > > > get always increase the reference and put does the clean-up.
> > > > > 
> > > > > fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > > > 
> > > > > xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > > > 
> > > > > so, the fw_ref is a mask of the woken up cases which require
> > > > > the ref drop and sleep call.
> > > > 
> > > > Hi Rodrigo,
> > > > 
> > > > Thanks for the input. AFAIU using this approach creates issue in the
> > > > subsequent force_wake_get/put in callee function. Which I have tried to
> > > > explain in cover letter.
> > > > 
> > > > [1] subsequent forcewake call by callee function assumes domains are
> > > > already awake, which might not be true. This shows perfectly balanced
> > > > xe_force_wake_get/_put can also cause problem.
> > > > 
> > > > [1] func_a() {
> > > >     XE_WARN(xe_force_wake_get()) <---> fails but increments refcount
> > > > 
> > > >     func_b();
> > > > 
> > > >     XE_WARN(xe_force_wake_put());<---> decrements refcounts
> > > >   }
> > > > 
> > > >      func_b() {
> > > >     if(xe_force_wake_get()) <---> succeeds due to refcount of caller
> > > >         return;
> > > > 
> > > >     does mmio_operations(); <---> Domain might not be awake
> > > > 
> > > >     xe_force_wake_put(); <---> decrement refcount
> > > >   }
> > > 
> > > Well, to be honest, this is what bugs me in this whole series.
> > > 
> > > If func_a failed, why would function b succeed? It that's the
> > > case should we include more redundancy and retries so the
> > > func_a would succeed like the func_b is expected in your
> > > scenario?
> > 
> > 
> > Hi Rodrigo,
> > 
> > This is current behavior, which patch [1] resolves. I misunderstood your
> > comment as dropping of that patch and simply balancing all _gets with
> > respective _puts.
> > 
> > 
> > > 
> > > But other then that, I'm afraid that you didn't fully understand
> > > my idea. Sorry for not being clear.
> > > 
> > > My thought is, you do what you are doing in this series.
> > > If the get doesn't succeed you drop the ref count and call the
> > > disable.
> > 
> > 
> > OK. IMO, just reducing refcount is better for failing domain and not to
> > disable it explicitly
> > 
> > 
> > > 
> > > The return of the get is just for the domains that have succeeded.
> > > then the put returns only the ones that had succeeded.
> > > The function B will then try to wake-up whatever had failed in
> > > func_a.
> > 
> > I assumw with this, the return of xe_force_wake_get will return the
> > mask, hence the caller will need to verify whether the returned mask is
> > correct or failed.
> > 
> > 
> > > 
> > > Something like:
> > > 
> > > 
> > > func_a() {
> > >     fw_ref = xe_force_wake_get(ALL_DOMAINS) <---> fails GT-domain
> > > but return a mask with all the domains except GT.
> > > 
> > >     XE_WARN(!fw_ref);
> > 
> > 
> > XE_WARN(!fw_ref); will work for all individual domains but not  ALL_DOMAINS
> > 
> > XE_WARN(fw_ref != ALL_DOMAINS); <-- If user wants to continue -->
> > 
> > if (fw_ref != ALL_DOMAINS)  <--If user wants to return on failure -->
> >      xe_force_wake_put(fw_ref); <-- ensure to put awake domain -->
> > 
> >      return;
> > }
> > 
> > 
> > > 
> > >     func_b();
> > > 
> > >     XE_WARN(xe_force_wake_put(fw_ref));<---> decrements refcounts of
> > > the domains which were actually woken up.
> > 
> > Makes sense.
> > 
> > > }
> > > 
> > >     func_b() {
> > >          fw_ref = xe_force_wake_get(GT_DOMAIN);
> > >     if(fw_ref & GT_DOMAIN) <---> likely fail anyway since func_a has
> > > failed, but it at least tries it out because you have handled it in
> > > your series...
> > >         return;
> > > 
> > >     does mmio_operations(); <---> Domain might not be awake
> > > 
> > >     xe_force_wake_put(fw_ref); <---> decrement refcount of the
> > > domains you woked up.
> > > }
> > > 
> > > does it make sense now?
> > 
> > 
> > Yes, this is indeed a much better approach for FORCEWAKE_ALL. Thank you
> > for the suggestion. To summarize, rather than disabling the successfully
> > awakened domain in the event of a failure, we will use forcewake_put to
> > handle the disabling of them and user will decide when to call it.
> 
> This way of implementing looks ok to me. Only concern is what if the
> func_b() calls xe_force_wake_assert_held(), this will raise the assert as it
> will not find expected domain awake. This doesn't align the idea of
> continuing in case of ack failure. IMO user decide to continue even after
> set ack failure by assuming domain woken up but ack didn't arrive in  time.

yeap, and then we fix this case.
If the assert is in place is because the _get wasn't properly handled.

> 
> Regards,
> Badal
> > 
> > 
> > > 
> > > > 
> > > > BR
> > > > Himal
> > > > 
> > > > > 
> > > > > >        }
> > > > > >        return 0;
> > > > > > -- 
> > > > > > 2.34.1
> > > > > > 
