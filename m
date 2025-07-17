Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D37C83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 22:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F061610E32E;
	Thu, 17 Jul 2025 22:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYxSpN35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C7310E22E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 22:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752791620; x=1784327620;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mcBvqX6RkUrsDflOTBOPAxLP9udbtDgeCQFnCNhCxb0=;
 b=kYxSpN35nd0Ma+F26Xelkxb29mvNsBP70FPhc52cGy1/okzuZaQ9TrPZ
 1GDnvyy8vT1M6W3hK9KSi64dVOsRgwBKjIA07vepgecEnN6ufSJEUQxyq
 Zv393cn1uDLZQaseJSkOIea/qy6QLipqtYnjlZYV4Ixu54ZTOHoYYb3w1
 GbsoKKol9kI+QEhUJ+bdIOGMUa1/kdIbQa/z0Ct4WqYpHLWE5xZ+tRmYd
 QUD0QspdPcauzzjNuj470LTRU77rkQ5sQ30zpKeIWmDQhknM+65gB1/yL
 TcM5u/UGd5SgCIbDxs7Qb17N27rPTZAvCfLggOD7UInP1EZ4ylO0AjqsN A==;
X-CSE-ConnectionGUID: sG5vZcyHQR+VBFYzSL0Byg==
X-CSE-MsgGUID: 2djbMi7sQTe+60TPUc//dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54963810"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="54963810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 15:33:40 -0700
X-CSE-ConnectionGUID: QlR6R/ZtSxae6cO6jyo9xA==
X-CSE-MsgGUID: hmGzCAPURTyPEfh3V0I03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="162189887"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 15:33:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 15:33:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 15:33:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 15:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JevCzrrdHqjdwcXCkCnTf3h/IXEp0KA5PCa1ATrqeLj3uGhcZtJe6vwqg0VaqR1hWsBNlFu2pV9jscxl52whjNSiKroQM36y7ZlDO7OornUpC0FKmTqlzqWTN2WtxizYNLlYDkpOYC64I/69IP6sYayJpNi79rgp3q9YxdPineICvku2arNCuUVXQfGY4Eao306pqTOtO8uW2hlC6+RZrU5zQjZeJ7fju7DaSwTYpT1uD5Z2065JpmBa5L2A56fVR3P01NjZPIf4GncbwfwOmr5P8FBuQZ493DLIbjwM3Uf4zAl8LM0y+kwUNrT0ahXdTBHn2anMBOFRGvkQAuLScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYtQZd+2k1uCfMi6/QU7YufLkSBcyQXwBZ+60yJ4tnQ=;
 b=aFy+yGMTYnT5smQfDtHHB3/q4ihn1wjGEsye62poXc5GMRrW+/6ydQZ0/9YTi6UWN5OupbaZjOry8Y0pa3df565inV3p7oX8h2kNViB8UIawEeiR0iJjM2DOJd8XKvCpvC06hT0FGtIjHkz1H9mUzc4PsEwKY5cBho1QMGtRnLxpgeXf/OnDGUYY2WHw8BLg0bDiv74Brerkf15XRWPVl8HVEtWiUK3KKOeVpteZipq74chfFckqxBk/ADVr87su7ADdM2Bz3qSJERBiIa8zPbHIzhjv0U6tudPhXgfZgaWcuidEpHKELWjRfgXh0JRqN5PFUZ4ZdJGiINOkrLX91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA4PR11MB9082.namprd11.prod.outlook.com (2603:10b6:208:56a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 17 Jul
 2025 22:33:16 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Thu, 17 Jul 2025
 22:33:16 +0000
Date: Thu, 17 Jul 2025 15:35:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 8/9] drm/xe: Use GT TLB invalidation jobs in PT layer
Message-ID: <aHl6ljEMWEuAunRa@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-9-matthew.brost@intel.com>
 <e56fd40f4ad7531fe6cf290ce7251fab521d5d1b.camel@intel.com>
 <aHll9/A6QoJEkrjU@lstrano-desk.jf.intel.com>
 <22f2274f144b606bb4b5b6747b5c1b20c2d78710.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22f2274f144b606bb4b5b6747b5c1b20c2d78710.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA4PR11MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: ca59c89a-78b3-44f0-a518-08ddc581ec7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gMANxyyel0t2qSmz4QB+sy7ahwWC4g+R6/CxBvw4mkLjP3ZKsv451iAjNz?=
 =?iso-8859-1?Q?5waZZduMBsCVh07Fm/CfZOVO9GFCqBaOQlheFH7YPiSizOmk9Cm7N3Obze?=
 =?iso-8859-1?Q?M7TLCdJ4VmEWWiGKVFbUyTX2O/xIPNTRFJ7scMDkAsEo3xtzjuRnaLluIJ?=
 =?iso-8859-1?Q?etlqqg3ogoeNhbHUILx2rF6GMYmn8EZGkgq9Eytj9Ui/U1GO8bTICLUwww?=
 =?iso-8859-1?Q?9krZgZN+zoEKza4e75dTqIH8PS9SEl9RJh1NKLC4PyRA9awM2ld/+zmOhd?=
 =?iso-8859-1?Q?x3IpRbTKb9b34KmYMMlw9wkqsgola8XtVoBjdZIUf/ydb9CFRh45pgSYTR?=
 =?iso-8859-1?Q?987OLngzDQBkaTmPsmM6ZL6f+hzKEs+Fp8K3uJzzOhII1QE0ewEXAxpsV0?=
 =?iso-8859-1?Q?qm1BzzX8kV+2iIdNseN7fJTwYcx4rAJBFEULBcCs0XouURy7MUlXi1JsSR?=
 =?iso-8859-1?Q?7ZU8SqV2/j5OVJNXhj1iAzNFqQfVOlxMyAmGMpr0nus9CcBD8YhcSW0zNG?=
 =?iso-8859-1?Q?YyngxFKautaQ9Nr4BOH62Mwne4CcxF0LevWLb88caDTJbvileT0A46y/1x?=
 =?iso-8859-1?Q?c291cOZfg9SzrUwEVESBEZAIsSuHmIkep6mXhOqF5ERCY5hPrLPBZLnqqx?=
 =?iso-8859-1?Q?sLiuU/iVZxTl6/0iI51DNUGq4qR8JnEsV18kkDVbLnmJkDRdBnTNKxMId0?=
 =?iso-8859-1?Q?Ok+tErluSijynsWUrwigqKg2S3p0d29Rqm38rE9XnYaIIYV93RXsJ25b9z?=
 =?iso-8859-1?Q?jFPolrW9GAmVFUbMIW0YdorDtBZ0I7e2ti5b1xFOAe7gMfA1xYNtGowSFi?=
 =?iso-8859-1?Q?RqASu/cA0Kpg4jt20+b/OdQDLGa+Ea2U8WCR7Gjz0EuW51wlT2HRIugGUB?=
 =?iso-8859-1?Q?gyJ1lY/UlOMggGDb8aFg0SfsB/Tz2EtMcCr7sXVrAj8llXtWqcMeH4fBmC?=
 =?iso-8859-1?Q?ASKtzfPpg/J6zxjXRqMW0mDhTBEG1clvdX1lP7aYRJKD+08/9xoOa9Ga3l?=
 =?iso-8859-1?Q?z0uVEMeI2MZWCt86OXTzkY22ewW6el7F+7wUINclKucvG95WKQwijce7En?=
 =?iso-8859-1?Q?Xk/7DZHQg0qc0j8zTKFDJMWK6IH/44x8742Df3ON2KKbiK9tCAHHDnTLzF?=
 =?iso-8859-1?Q?eB6wrfUpmluO2mB0pJs8UElBe/ungBYS0Dd9EolEskB4XaAzilhiNju7e+?=
 =?iso-8859-1?Q?POhOapuag6BF1oxnjEMw+a6JQW2zHX5EgtVgU+Fn9fd1pKxH/hkp3xzjjQ?=
 =?iso-8859-1?Q?nguMgKn+XFsrDABIrlLWYiAupDUq8/9aiPGC8kE54ii7zaA4BKQregIBv7?=
 =?iso-8859-1?Q?x7cwsbsgQ78TsAF8CMj2moccVniTtG65g1FAuDpQxvOGcRr64/d0ebZb5n?=
 =?iso-8859-1?Q?SAnwzgpQdcrZK4oInWxwGKV7l5sf1zEdkDKswxUNOh1KyoUgPRtISHIX81?=
 =?iso-8859-1?Q?SrWOTjL8AlosWS4kzcUP2V4zjjJzFDKIISdp16/ApeiUPCyhrKu+n5beqe?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q1GSAtQSrXFz6/7I/AuoUI4O1t1awx5d5G3w/nZz1W2OaqJBiqA1Dq0OLf?=
 =?iso-8859-1?Q?0BSt3ETSWM0TIxY0MtJfokkbPlY4yjbRNlIttD9PfkJnVq3lwBsK4m33DK?=
 =?iso-8859-1?Q?pCSMHzBo63H0GMI6gV+zRErxNeyD/hfs5WGGLJox76eggCpMzdlbfPWBGF?=
 =?iso-8859-1?Q?arVYhIB9U8lTkrxT3sxViCavr5AHYdf9Kcp+zllSXVRuPvmSyg8CJti93N?=
 =?iso-8859-1?Q?0eMFge8oR9DaKtkQd5/kx8i+Qbjz9/tQI6MBz02IN5H5uNxZIHORu6iT80?=
 =?iso-8859-1?Q?1xiGxP+WRPY9rzdsUsJTeguy6eiwiVie9pxNuIUKg+lh7evj+Bp5dgSxro?=
 =?iso-8859-1?Q?awnusXfspmLdtNFcy5TGzpZDBWW2qFpylyDhyRrIxtDQ0Ej1/97s421bOF?=
 =?iso-8859-1?Q?PEB+clpUIa0VNvEBOGlClEe5/gWZBiKAPYmHoV9/j5zJJ/x4zUSkgUOoi3?=
 =?iso-8859-1?Q?X6uIG/EcsuSl6I4w12POjTRS1f6sHxee7I6YOS+pQZG3WFWgV3dE+FAdQn?=
 =?iso-8859-1?Q?tblEIYCH1ahS4F4xYhrJ6E+00pjIpXJlWyFaTVDEl5DtHVG8Yve5Lb0TMe?=
 =?iso-8859-1?Q?CIBiGZS+NIvdgbvUYjkrkhp/KlXJkpsnHgvERMXGLAHVnXK/isYHKLvAvG?=
 =?iso-8859-1?Q?3xz+1QsMyRzscPUMVIcZSqwVKbPdfJW5w71R2rl1wnkDxGxOXUMfVuZfy2?=
 =?iso-8859-1?Q?n36AnRBu2jvYOpYpLgxweW270k9KMTb+233+e+rddfByZjTZpfR5HgeC/G?=
 =?iso-8859-1?Q?43/wIQ8d9KO0Pgr6qfCG61ljf7UipvAYBk35QSzXk3AmcVEex7mZF1Ay3L?=
 =?iso-8859-1?Q?iRsnbJn2EbrWZJSHc4ZfpLlRkbKwgPz7W0okPS9+OY6xFAVHUM2n8B6y9F?=
 =?iso-8859-1?Q?Dgn5ivAGMZkubmKbR7Vs7TgvaJA5Ob86mCT2Y5I9YB5gFdrZNlZrBHUpsy?=
 =?iso-8859-1?Q?GFgRiGPspJqHI96dNYagXo5UaXRAGyq6Sf5bGZ7SZeEPpaVtm9O4zzJ4Kx?=
 =?iso-8859-1?Q?2HyOjdlwYb3G1QbDPpbaTP2dokzRCnAbwnzRVsmNp0pGwu/cTNRu8phrqF?=
 =?iso-8859-1?Q?J9rSoBspe/Rm0AV7QRRAE9hhYmqx6QQW9X/svv41CQmAaMclV66pVeR7o4?=
 =?iso-8859-1?Q?5cKX9JreH6ks0F6hVLSQTwIlkM62FvsRAkamSHrSomasGp5DOARg4GzC8M?=
 =?iso-8859-1?Q?ss8cBrYmsHECZYpTdO0DI0sVLbxOD6rx9tyu82/W3Dgb62QulJdCHiYeQg?=
 =?iso-8859-1?Q?13zIiz9QYtYjMcC/e8fDbBmE/oHbUAnRVdo+RojSxgXeRYkcpGBTIrH5fv?=
 =?iso-8859-1?Q?jPUFBJdrh+oMWowMs4EQeLIJ0MRpw7TnY4xRJPGstwOdXxLxOKzQHg/aSZ?=
 =?iso-8859-1?Q?qRjpabMgE9yAsnymWu0XEJeuu67dx8zgL2dZd3Le0ZWSgIYN1KAzEGJfBG?=
 =?iso-8859-1?Q?XWK83cXvNcg45iwKmMokHhU4x1auWtIOZ5zw5xn+HRG1o7L6Qc5Wvkuk/9?=
 =?iso-8859-1?Q?ccON0lMuC2LpWlwNuekNQTpDhgwzPFUNYqTRuyaS8Z9F4rtFGG9wQwrPKI?=
 =?iso-8859-1?Q?PE5FoK1wOQZPH/aLVZNygBmo2HXmUoRNO+piMqsOu5aRgg5V25lyft3O1D?=
 =?iso-8859-1?Q?409vnGK8ig+cVJ+1d3W57qTthnr69aOt7iYVmKg74BRKHoOsvNdMP+7Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca59c89a-78b3-44f0-a518-08ddc581ec7c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 22:33:16.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZbGH04JiiAboeZATTqI3YFPuYf6OJ/YJZPfz+dulqEj+hsnQ2uwMXkoCbIoO/TDZDC6Bu2C7xg5FL9h9LgDtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9082
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

On Thu, Jul 17, 2025 at 04:26:13PM -0600, Summers, Stuart wrote:
> On Thu, 2025-07-17 at 14:07 -0700, Matthew Brost wrote:
> > On Thu, Jul 17, 2025 at 03:00:14PM -0600, Summers, Stuart wrote:
> > > On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > > > Rather than open-coding GT TLB invalidations in the PT layer, use
> > > > GT
> > > > TLB
> > > > invalidation jobs. The real benefit is that GT TLB invalidation
> > > > jobs
> > > > use
> > > > a single dma-fence context, allowing the generated fences to be
> > > > squashed
> > > > in dma-resv/DRM scheduler.
> > > > 
> > > > v2:
> > > >  - s/;;/; (checkpatch)
> > > >  - Move ijob/mjob job push after range fence install
> > > > 
> > > > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_migrate.h |   9 ++
> > > >  drivers/gpu/drm/xe/xe_pt.c      | 178 +++++++++++++-------------
> > > > ----
> > > > --
> > > >  2 files changed, 80 insertions(+), 107 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > index e9d83d320f8c..605398ea773e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > @@ -14,6 +14,7 @@ struct ttm_resource;
> > > >  
> > > >  struct xe_bo;
> > > >  struct xe_gt;
> > > > +struct xe_gt_tlb_inval_job;
> > > >  struct xe_exec_queue;
> > > >  struct xe_migrate;
> > > >  struct xe_migrate_pt_update;
> > > > @@ -89,6 +90,14 @@ struct xe_migrate_pt_update {
> > > >         struct xe_vma_ops *vops;
> > > >         /** @job: The job if a GPU page-table update. NULL
> > > > otherwise
> > > > */
> > > >         struct xe_sched_job *job;
> > > > +       /**
> > > > +        * @ijob: The GT TLB invalidation job for primary tile.
> > > > NULL
> > > > otherwise
> > > > +        */
> > > > +       struct xe_gt_tlb_inval_job *ijob;
> > > > +       /**
> > > > +        * @mjob: The GT TLB invalidation job for media tile.
> > > > NULL
> > > > otherwise
> > > > +        */
> > > > +       struct xe_gt_tlb_inval_job *mjob;
> > > >         /** @tile_id: Tile ID of the update */
> > > >         u8 tile_id;
> > > >  };
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index c8e63bd23300..67d02307779b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -13,7 +13,7 @@
> > > >  #include "xe_drm_client.h"
> > > >  #include "xe_exec_queue.h"
> > > >  #include "xe_gt.h"
> > > > -#include "xe_gt_tlb_invalidation.h"
> > > > +#include "xe_gt_tlb_inval_job.h"
> > > >  #include "xe_migrate.h"
> > > >  #include "xe_pt_types.h"
> > > >  #include "xe_pt_walk.h"
> > > > @@ -1261,6 +1261,8 @@ static int op_add_deps(struct xe_vm *vm,
> > > > struct
> > > > xe_vma_op *op,
> > > >  }
> > > >  
> > > >  static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> > > > +                                struct xe_gt_tlb_inval_job
> > > > *ijob,
> > > > +                                struct xe_gt_tlb_inval_job
> > > > *mjob,
> > > >                                  struct xe_vm *vm,
> > > >                                  struct xe_vma_ops *vops,
> > > >                                  struct xe_vm_pgtable_update_ops
> > > > *pt_update_ops,
> > > > @@ -1328,6 +1330,20 @@ static int xe_pt_vm_dependencies(struct
> > > > xe_sched_job *job,
> > > >         for (i = 0; job && !err && i < vops->num_syncs; i++)
> > > >                 err = xe_sync_entry_add_deps(&vops->syncs[i],
> > > > job);
> > > >  
> > > > +       if (job) {
> > > > +               if (ijob) {
> > > > +                       err =
> > > > xe_gt_tlb_inval_job_alloc_dep(ijob);
> > > > +                       if (err)
> > > > +                               return err;
> > > > +               }
> > > > +
> > > > +               if (mjob) {
> > > > +                       err =
> > > > xe_gt_tlb_inval_job_alloc_dep(mjob);
> > > > +                       if (err)
> > > > +                               return err;
> > > > +               }
> > > > +       }
> > > > +
> > > >         return err;
> > > >  }
> > > >  
> > > > @@ -1339,7 +1355,8 @@ static int xe_pt_pre_commit(struct
> > > > xe_migrate_pt_update *pt_update)
> > > >         struct xe_vm_pgtable_update_ops *pt_update_ops =
> > > >                 &vops->pt_update_ops[pt_update->tile_id];
> > > >  
> > > > -       return xe_pt_vm_dependencies(pt_update->job, vm,
> > > > pt_update-
> > > > > vops,
> > > > +       return xe_pt_vm_dependencies(pt_update->job, pt_update-
> > > > >ijob,
> > > > +                                    pt_update->mjob, vm,
> > > > pt_update-
> > > > > vops,
> > > >                                      pt_update_ops, rftree);
> > > >  }
> > > >  
> > > > @@ -1509,75 +1526,6 @@ static int xe_pt_svm_pre_commit(struct
> > > > xe_migrate_pt_update *pt_update)
> > > >  }
> > > >  #endif
> > > >  
> > > > -struct invalidation_fence {
> > > > -       struct xe_gt_tlb_invalidation_fence base;
> > > > -       struct xe_gt *gt;
> > > > -       struct dma_fence *fence;
> > > > -       struct dma_fence_cb cb;
> > > > -       struct work_struct work;
> > > > -       u64 start;
> > > > -       u64 end;
> > > > -       u32 asid;
> > > > -};
> > > > -
> > > > -static void invalidation_fence_cb(struct dma_fence *fence,
> > > > -                                 struct dma_fence_cb *cb)
> > > > -{
> > > > -       struct invalidation_fence *ifence =
> > > > -               container_of(cb, struct invalidation_fence, cb);
> > > > -       struct xe_device *xe = gt_to_xe(ifence->gt);
> > > > -
> > > > -       trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
> > > > -       if (!ifence->fence->error) {
> > > > -               queue_work(system_wq, &ifence->work);
> > > > -       } else {
> > > > -               ifence->base.base.error = ifence->fence->error;
> > > > -               xe_gt_tlb_invalidation_fence_signal(&ifence-
> > > > >base);
> > > > -       }
> > > > -       dma_fence_put(ifence->fence);
> > > > -}
> > > > -
> > > > -static void invalidation_fence_work_func(struct work_struct *w)
> > > > -{
> > > > -       struct invalidation_fence *ifence =
> > > > -               container_of(w, struct invalidation_fence, work);
> > > > -       struct xe_device *xe = gt_to_xe(ifence->gt);
> > > > -
> > > > -       trace_xe_gt_tlb_invalidation_fence_work_func(xe, &ifence-
> > > > > base);
> > > > -       xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base,
> > > > ifence->start,
> > > > -                                    ifence->end, ifence->asid);
> > > > -}
> > > > -
> > > > -static void invalidation_fence_init(struct xe_gt *gt,
> > > > -                                   struct invalidation_fence
> > > > *ifence,
> > > > -                                   struct dma_fence *fence,
> > > > -                                   u64 start, u64 end, u32 asid)
> > > > -{
> > > > -       int ret;
> > > > -
> > > > -       trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt),
> > > > &ifence->base);
> > > > -
> > > > -       xe_gt_tlb_invalidation_fence_init(gt, &ifence->base,
> > > > false);
> > > > -
> > > > -       ifence->fence = fence;
> > > > -       ifence->gt = gt;
> > > > -       ifence->start = start;
> > > > -       ifence->end = end;
> > > > -       ifence->asid = asid;
> > > > -
> > > > -       INIT_WORK(&ifence->work, invalidation_fence_work_func);
> > > > -       ret = dma_fence_add_callback(fence, &ifence->cb,
> > > > invalidation_fence_cb);
> > > > -       if (ret == -ENOENT) {
> > > > -               dma_fence_put(ifence->fence);   /* Usually
> > > > dropped in
> > > > CB */
> > > > -               invalidation_fence_work_func(&ifence->work);
> > > > -       } else if (ret) {
> > > > -               dma_fence_put(&ifence->base.base);      /* Caller
> > > > ref
> > > > */
> > > > -               dma_fence_put(&ifence->base.base);      /*
> > > > Creation
> > > > ref */
> > > > -       }
> > > > -
> > > > -       xe_gt_assert(gt, !ret || ret == -ENOENT);
> > > > -}
> > > > -
> > > >  struct xe_pt_stage_unbind_walk {
> > > >         /** @base: The pagewalk base-class. */
> > > >         struct xe_pt_walk base;
> > > > @@ -2407,8 +2355,8 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > > > struct xe_vma_ops *vops)
> > > >         struct xe_vm *vm = vops->vm;
> > > >         struct xe_vm_pgtable_update_ops *pt_update_ops =
> > > >                 &vops->pt_update_ops[tile->id];
> > > > -       struct dma_fence *fence;
> > > > -       struct invalidation_fence *ifence = NULL, *mfence = NULL;
> > > > +       struct dma_fence *fence, *ifence, *mfence;
> > > > +       struct xe_gt_tlb_inval_job *ijob = NULL, *mjob = NULL;
> > > >         struct dma_fence **fences = NULL;
> > > >         struct dma_fence_array *cf = NULL;
> > > >         struct xe_range_fence *rfence;
> > > > @@ -2440,34 +2388,47 @@ xe_pt_update_ops_run(struct xe_tile
> > > > *tile,
> > > > struct xe_vma_ops *vops)
> > > >  #endif
> > > >  
> > > >         if (pt_update_ops->needs_invalidation) {
> > > > -               ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > > > -               if (!ifence) {
> > > > -                       err = -ENOMEM;
> > > > +               ijob = xe_gt_tlb_inval_job_create(pt_update_ops-
> > > > >q,
> > > > +                                                 tile-
> > > > >primary_gt,
> > > > +                                                 pt_update_ops-
> > > > > start,
> > > > +                                                 pt_update_ops-
> > > > > last,
> > > > +                                                 vm->usm.asid);
> > > > +
> > > 
> > > Remove extra line.
> > > 
> > 
> > Sure.
> > 
> > > > +               if (IS_ERR(ijob)) {
> > > > +                       err = PTR_ERR(ijob);
> > > >                         goto kill_vm_tile1;
> > > >                 }
> > > > +
> > > >                 if (tile->media_gt) {
> > > > -                       mfence = kzalloc(sizeof(*ifence),
> > > 
> > > I realize it's the same, but this should probably be
> > > sizeof(*mfence).
> > > 
> > 
> > Well it is getting removed.
> 
> Heh, somehow I misread that...
> 
> > 
> > 
> > > > GFP_KERNEL);
> > > > -                       if (!mfence) {
> > > > -                               err = -ENOMEM;
> > > > -                               goto free_ifence;
> > > > +                       mjob =
> > > > xe_gt_tlb_inval_job_create(pt_update_ops->q,
> > > > +                                                         tile-
> > > > > media_gt,
> > > > +                                                        
> > > > pt_update_ops->start,
> > > > +                                                        
> > > > pt_update_ops->last,
> > > > +                                                         vm-
> > > > > usm.asid);
> > > > +                       if (IS_ERR(mjob)) {
> > > > +                               err = PTR_ERR(mjob);
> > > > +                               goto free_ijob;
> > > 
> > > I think this needs a little more granularity. In free_ijob below,
> > > we're
> > > also doing a kfree for fences and cf, both of which at this point
> > > aren't yet allocated. I realize you aren't changing anything really
> > > here, but that looks wrong to me. Maybe we just haven't hit an
> > > issue
> > > here because we've never tested the ENOMEM case?
> > > 
> > 
> > fences & cf are initialized to NULL, kfree on a NULL is a nop.
> > 
> > Same with xe_gt_tlb_inval_job_put, skips on NULL or IS_ERR.
> 
> Yeah I saw the job_put.. and true on the kfree... I guess we're saving
> a couple of labels at the bottom of the function, but it still feels
> wrong as we're depending on the underlying implementation, which would
> break if we changed that or wrapped it somehow.
> 
> Anyway not a deal breaker, it's the same as it was before anyway.
> 

I get what you are saying, but we do things like all over driver in
particular with kfree, dma_fence_get/put that rely NULL being an
acceptable argument. I'm not saying this is the best practice, just
saying it is done everywhere in Xe / Linux. In either of cases, kfree or
dma_fence_get/put, changed to not accept NULL the entire Linux kernel
would explode so it is pretty safe to assume this will not be changing.

Matt

> > 
> > > >                         }
> > > >                         fences = kmalloc_array(2,
> > > > sizeof(*fences),
> > > > GFP_KERNEL);
> > > >                         if (!fences) {
> > > >                                 err = -ENOMEM;
> > > > -                               goto free_ifence;
> > > > +                               goto free_ijob;
> > > >                         }
> > > >                         cf = dma_fence_array_alloc(2);
> > > >                         if (!cf) {
> > > >                                 err = -ENOMEM;
> > > > -                               goto free_ifence;
> > > > +                               goto free_ijob;
> > > >                         }
> > > >                 }
> > > > +
> > > > +               update.ijob = ijob;
> > > > +               update.mjob = mjob;
> > > 
> > > Is there a reason not to put these inline above where the ijob and
> > > mjob
> > > are allocated? That way if we moved this to a loop eventually (not
> > > here, in a future patch) we could more easily reduce the number of
> > > indentations here by doing:
> > 
> > Sure, can move.
> > 
> > > if (!media_gt)
> > >     continue;
> > > 
> > > >         }
> > > >  
> > > >         rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> > > >         if (!rfence) {
> > > >                 err = -ENOMEM;
> > > > -               goto free_ifence;
> > > > +               goto free_ijob;
> > > >         }
> > > >  
> > > >         fence = xe_migrate_update_pgtables(tile->migrate,
> > > > &update);
> > > > @@ -2491,30 +2452,30 @@ xe_pt_update_ops_run(struct xe_tile
> > > > *tile,
> > > > struct xe_vma_ops *vops)
> > > >                                   pt_update_ops->last, fence))
> > > >                 dma_fence_wait(fence, false);
> > > >  
> > > > -       /* tlb invalidation must be done before signaling rebind
> > > > */
> > > 
> > > Why drop the comment?
> > > 
> > 
> > Let me pull that back in.
> 
> Yeah so other than those two (comment here and line break above), the
> rest looks good to me. I like the job based approach rather than
> embedding like we used to have, thanks for the change Matt!
> 
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > -       if (ifence) {
> > > > -               if (mfence)
> > > > -                       dma_fence_get(fence);
> > > > -               invalidation_fence_init(tile->primary_gt, ifence,
> > > > fence,
> > > > -                                       pt_update_ops->start,
> > > > -                                       pt_update_ops->last, vm-
> > > > > usm.asid);
> > > > -               if (mfence) {
> > > > -                       invalidation_fence_init(tile->media_gt,
> > > > mfence, fence,
> > > > -                                               pt_update_ops-
> > > > >start,
> > > > -                                               pt_update_ops-
> > > > >last,
> > > > vm->usm.asid);
> > > > -                       fences[0] = &ifence->base.base;
> > > > -                       fences[1] = &mfence->base.base;
> > > > +       if (ijob) {
> > > > +               struct dma_fence *__fence;
> > > > +
> > > > +               ifence = xe_gt_tlb_inval_job_push(ijob, tile-
> > > > > migrate, fence);
> > > > +               __fence = ifence;
> > > > +
> > > > +               if (mjob) {
> > > > +                       fences[0] = ifence;
> > > > +                       mfence = xe_gt_tlb_inval_job_push(mjob,
> > > > tile-
> > > > > migrate,
> > > > +                                                         fence);
> > > > +                       fences[1] = mfence;
> > > > +
> > > >                         dma_fence_array_init(cf, 2, fences,
> > > >                                              vm-
> > > > >composite_fence_ctx,
> > > >                                              vm-
> > > > > composite_fence_seqno++,
> > > >                                              false);
> > > > -                       fence = &cf->base;
> > > > -               } else {
> > > > -                       fence = &ifence->base.base;
> > > > +                       __fence = &cf->base;
> > > >                 }
> > > > +
> > > > +               dma_fence_put(fence);
> > > > +               fence = __fence;
> > > >         }
> > > >  
> > > > -       if (!mfence) {
> > > > +       if (!mjob) {
> > > >                 dma_resv_add_fence(xe_vm_resv(vm), fence,
> > > >                                    pt_update_ops-
> > > > >wait_vm_bookkeep ?
> > > >                                    DMA_RESV_USAGE_KERNEL :
> > > > @@ -2523,19 +2484,19 @@ xe_pt_update_ops_run(struct xe_tile
> > > > *tile,
> > > > struct xe_vma_ops *vops)
> > > >                 list_for_each_entry(op, &vops->list, link)
> > > >                         op_commit(vops->vm, tile, pt_update_ops,
> > > > op,
> > > > fence, NULL);
> > > >         } else {
> > > > -               dma_resv_add_fence(xe_vm_resv(vm), &ifence-
> > > > > base.base,
> > > > +               dma_resv_add_fence(xe_vm_resv(vm), ifence,
> > > >                                    pt_update_ops-
> > > > >wait_vm_bookkeep ?
> > > >                                    DMA_RESV_USAGE_KERNEL :
> > > >                                    DMA_RESV_USAGE_BOOKKEEP);
> > > >  
> > > > -               dma_resv_add_fence(xe_vm_resv(vm), &mfence-
> > > > > base.base,
> > > > +               dma_resv_add_fence(xe_vm_resv(vm), mfence,
> > > >                                    pt_update_ops-
> > > > >wait_vm_bookkeep ?
> > > >                                    DMA_RESV_USAGE_KERNEL :
> > > >                                    DMA_RESV_USAGE_BOOKKEEP);
> > > >  
> > > >                 list_for_each_entry(op, &vops->list, link)
> > > > -                       op_commit(vops->vm, tile, pt_update_ops,
> > > > op,
> > > > -                                 &ifence->base.base, &mfence-
> > > > > base.base);
> > > > +                       op_commit(vops->vm, tile, pt_update_ops,
> > > > op,
> > > > ifence,
> > > > +                                 mfence);
> > > >         }
> > > >  
> > > >         if (pt_update_ops->needs_svm_lock)
> > > > @@ -2543,15 +2504,18 @@ xe_pt_update_ops_run(struct xe_tile
> > > > *tile,
> > > > struct xe_vma_ops *vops)
> > > >         if (pt_update_ops->needs_userptr_lock)
> > > >                 up_read(&vm->userptr.notifier_lock);
> > > >  
> > > > +       xe_gt_tlb_inval_job_put(mjob);
> > > > +       xe_gt_tlb_inval_job_put(ijob);
> > > > +
> > > >         return fence;
> > > >  
> > > >  free_rfence:
> > > >         kfree(rfence);
> > > > -free_ifence:
> > > > +free_ijob:
> > > >         kfree(cf);
> > > >         kfree(fences);
> > > > -       kfree(mfence);
> > > > -       kfree(ifence);
> > > > +       xe_gt_tlb_inval_job_put(mjob);
> > > > +       xe_gt_tlb_inval_job_put(ijob);
> > > >  kill_vm_tile1:
> > > >         if (err != -EAGAIN && err != -ENODATA && tile->id)
> > > >                 xe_vm_kill(vops->vm, false);
> > > 
> 
