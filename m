Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1A6CEFC38
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 18:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC54C10E5A0;
	Tue,  8 Oct 2024 18:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYMFel3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FE310E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728410440; x=1759946440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N0b27lMnanXN6ij3DjqB9L2qwPs1tC23FsJXHsLKpWg=;
 b=VYMFel3+5rzVwHt45E/X0O49ogOUUEy2tlvCkVKUctKapXIZWSQJv3i9
 EAJmWCzYNOGUaZM4rP1OPy6ZOCs058yamkaZJDG14DJNeYvOtjz+1Yz0T
 QGVo87ugi/V5w102JFeT5Vfm/V9MkCxyyjutaRreX4Pa314cLg1gKE0Oy
 94Z2bkjpfk1PYUm+kFvBxCvclgyij1PRJcMb9n43Tc0gNCao8E5fpyV28
 A27FE1MkgZiRP5D6xT8oK+wfwLGSv65JwHlM6enSYfFMlde3ho7kH4OO6
 mpf05vSr3XPE9mOGme7o/osl8l2xNjAVA//sV9TluRs19L2BPjc8IEfoL Q==;
X-CSE-ConnectionGUID: OY6s/AThSsqBOJrWEYHRNA==
X-CSE-MsgGUID: hP2HN1HOQtKyB/47rMaXdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27116777"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27116777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:00:39 -0700
X-CSE-ConnectionGUID: mUcLIud9Q5G5lrbZ54mZUA==
X-CSE-MsgGUID: jC5KG5eRQ1e8SNxerQKfFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="113398733"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 11:00:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 11:00:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 11:00:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 11:00:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 11:00:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFZLK6G1yn3/1FY3jbk/diJvqynziH0yPWSl8mBzzptxzUPh/Eii2Bo6AGiX1bfaZAIQUi4/vK7F2fPemWMF3wF6tu04XT9wAhAzkb1rwnVMZtk/XHS2FwvnmTUMx7UGen6ch+Us1D0iNHDBJuC/NREO4PTChA4PvWo6AiuUSfSS/TJoBHqBi/YzyDCf0iv/8/D9NjK753HLuZw4O10Tt4UiDKIMhAoNRV5N6A6h9SO0GCf9OH4aMsnN86cI+6lpe0TcY3P0v0tqrR1hSlYYjs8RteYBceEG9vVShyo+I5LQwrtgpe9R2kHrB7XCBytKokjcqtvmyGD+umQOMAlrUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4XQ6DTsgn3W1hyOdhlfGiJKf9FnojRJlDYLywdiF0s=;
 b=md5iFnzEXxKKwJ4LzIiwV8WFk6QiUiEj+ADG4DfOLtwMmRyNZgrrOUzJrDCKGdBWqATYLpqZjf0yuPwGYkaDSPUC8LQB+rDl/OKaVYEjHkkzad1qp8vGoV05rcHgOq9C4CJnodklrBWSzzkSd9OY6jcYQmPX+GgPhTHxRPBSVMUOPHFMLun7olAqysvzUIyH7nfkBJSXwruGJrD77eRuGaBRBQYU+gSqlU1YwhkJqnUHzz7VZWfAvIF5w92CvhxyEl3mRXsa+VmRokJo0q/NkrcbikA5B6YZTZO3QV7+5RbsrM647v5V1j7UjBkqBCEHpHZoIaHpx8MesiZg4mEKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 18:00:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 18:00:36 +0000
Date: Tue, 8 Oct 2024 18:00:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <ZwVzOahncbCljo1f@DUT025-TGLU.fm.intel.com>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
 <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
 <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fdfe6bf-8be2-43ed-793d-08dce7c31c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?irZi7DJ1s/f8beb17hTIZS/fa/iMYkmxdHvzNJaOqSCAkdk0ehheN1t3LFfk?=
 =?us-ascii?Q?nicUBBcuyxkzsL6guIFG8oGNY0v+Se42Cu7G40029XZuBLohWb8zbXuFo7at?=
 =?us-ascii?Q?q7STxuJ93PKGjk7f3cfMKeYVGQh+2X72AHbDSUAKx2HH/Av3xYhH1j3y9XXi?=
 =?us-ascii?Q?2gl29wz1LXRwwxyx9IenBEKIVP5e3NXuVIoWaox8P+X6kSCzmime0zPQ55gI?=
 =?us-ascii?Q?rCEoavW7UV6K+kYViLCQBiInOkE4lVGjLbwN7IcuVMq/wIOLC7TaEuRJZtY2?=
 =?us-ascii?Q?DcLM4mEuKu0SWM+aFFYDjLoTt7kYb0GMeGPkPpEvel/1o+T3D8U1wFNG8nJM?=
 =?us-ascii?Q?KLNIFUop+Cu1xeih7u0b4AynrxBxc850AK+o/1Bxb4Vwa9d1VOMoaKPoBKbB?=
 =?us-ascii?Q?SNGhstBfSD92SK0pkUexYo8WhPnL7TOWoAzPDHY6bWxnFtLcUoj4WuuG2qFC?=
 =?us-ascii?Q?N9w/vTEIk+a+NpRM1k1FER+NqErgfQ7asV2Sbex8MwuZog4Sy1covPDQLfxQ?=
 =?us-ascii?Q?lvdSizkoYblMRw06VRgzFG1qkWG5nfgkkOwC+68BUaF8thSRvcAFr/48GUwA?=
 =?us-ascii?Q?PLWVN6tNn4BCa1/lvTjBI+j4wyD5Y2V4g3z/NguT8zOuQ8eKn9FdxE6aw/1u?=
 =?us-ascii?Q?viuDoE6d7u9k9Fcuezz9hmE88uR2wtnwgo30FhpPgiddkU1+mRm+xgWAYWiZ?=
 =?us-ascii?Q?jo6clJSzc9TBeIM0+L+haIqLdO82cGnJz7U3ZE5GrOxf/EROa/q5K93C/umh?=
 =?us-ascii?Q?jLQ0UfF7cy39kHYfQCuKvltgrn2oTfScIS72eGqRnB325N7Q86+eFyWbuLXl?=
 =?us-ascii?Q?VUEfN3OIOIgThcaab9KUtPOhCdfE/D7vP+QAW1HGahXKHU7jZqV1pgALGr6U?=
 =?us-ascii?Q?mX/V9v0qG0m4dYJ2bTQkr/W/vBFvW/uhBVcv3qG+qn0wcUo+ax73VI+FHPnG?=
 =?us-ascii?Q?Y5iqGsb8AafsgkU3Kzx8G4PYAQuIKNyMAVGv4SswCG1gVIVhXuphk4cfvaLd?=
 =?us-ascii?Q?XZhclElcdFdzFDHGHyUU8BOwHpSLjXslcUty0eNkiMkQgrBVhx66XrTIngHl?=
 =?us-ascii?Q?c13DaWBzg6CMFp9y77WfZ+mYa9M3jvlm5IfsHBTj3LWTwUKV0LIB14KeCCJe?=
 =?us-ascii?Q?Nl5fB2FcJObqYfgX8LZApmiREtiq07+bENA1XiEYi4vywAAOSRWi6q3nABhV?=
 =?us-ascii?Q?5l7WACNIcxLgyoFUBe5OeAfqM4DdUvH0fqCIRXXb1Fwsv2/MXPoSbfOokuSU?=
 =?us-ascii?Q?aKryBvysB1YspomYpX0DLw4TrXPyceT5ga/qD10B7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?abDBBAlpxvDdvTr7ruiXlbk4Pd6M2gW7IMeKoOOFkGhFTi7ja2PktnWCT9/P?=
 =?us-ascii?Q?Oe8AtqHII6eBpH6/zLvdItmnraZernHpRH1dR4wkPQrQdFg4pPNlCfQOSifE?=
 =?us-ascii?Q?buxyLa10JFYqarvXiPmBHTyLUr4g2D33SAuC/HesUOugRwETngCnwfSeMyi+?=
 =?us-ascii?Q?ifNSy/lQjrPIqiIMPLXCZMQofXdNYSTWtPlzjXrpGJTW33AA2yb8TdKYdJBQ?=
 =?us-ascii?Q?WjX5Z/ZpDMvIn9WoPwA9qv2BI2MsS65r+KX1oXFyekHtWIpbUx1heu7k644T?=
 =?us-ascii?Q?Zucvq6Q1HsllumSIb+qryymjTAYzAbbAT4QhDe7IUq2Gi8p10lEvDUtDuxEf?=
 =?us-ascii?Q?jSYiTC2msTuuHVLYDXc+WW69zK2IBWB77V2TfUWyH/1wcSzno6w27OPZb5Ua?=
 =?us-ascii?Q?9Xp4JvXT3HWi3zQ4MQWV7yoHPiRvb3p0SkBdAJcCoYgaEsGun4+M75hxkj2/?=
 =?us-ascii?Q?j21/fBbPG8eJle6rOP83Xsb+o3uqg48tIf5xwe3AFAXvjBLlgXYNB9lAs2QN?=
 =?us-ascii?Q?FdpEFeLBSxa/Vk+l/Oz90sECnCFb12MTKBVPNnsEwZ03QD6HciCF9a63YV07?=
 =?us-ascii?Q?CU4ro2NDgIPEO7H2gLVkFLSrvWJ5wZ6/SWs5bcgZExHJZ7OZMsQ4UfmwO2kv?=
 =?us-ascii?Q?UQw174VSK6oGuLcNOwm24o9j+M1ZA8zqnMn22fs5aJzi1NFH6zfsl/nE5nN3?=
 =?us-ascii?Q?CbxqMI8Jy7eCTrJ0UqhcuqiwbikAo7Ue+wBQMPYn4y5ZiOJ3QYx95qNL7nEF?=
 =?us-ascii?Q?VVt4wJbfSfYw5HZdZnHiY86gA9RVoUYV1B5tTUjA0+5Z5i4ajJ/CfGO3PxoX?=
 =?us-ascii?Q?mzXHxZPU5EafPJi4Mj36r5FO54ZIoJBeb8GBclvFccdOUIX4RL4xUIERYxnv?=
 =?us-ascii?Q?eakqGj8Ur9GpxJ8a2klChR/qAKc1tEStCJ8WCl5mJ905QeaW/q3QOS2eLvjS?=
 =?us-ascii?Q?eBKYWbb4tU2GNE6146iXMi7RuQYpdoSqZ4k7IqWIyP2YseKJT2cXikswBKmC?=
 =?us-ascii?Q?ckYK7hBPWDU3O5K1yPSPwGvdQO3njXf5A1v4r9HOKexqv3eWwy/3Z2+nxxcZ?=
 =?us-ascii?Q?b73Okj+6SMGsyY1IxdCSJo7r7b4QaKq9oN+qkaPERcjd3gVea0zmjCKWiXr2?=
 =?us-ascii?Q?ywCyAov8ISdrYzUEy01YkH6F6TK24OXle2YV08qlHOtkBlXVb3ycCk5eMxvY?=
 =?us-ascii?Q?xJL8b+MV/QExcs6BA4Bo82vXxyrazQ891h5pf9Tjaya27curLfnE2BBPbcWu?=
 =?us-ascii?Q?34aH6UbDwUkPh50ycyCmuF8h2c/XaxtXrLeZ5K2aGQ3z80MsbEnaKE2j2I69?=
 =?us-ascii?Q?zF4NPG6S3/XEZuRK6BkvlyxSCY2n9ewjcYqiql3mnTs/eGeeDnyWRXeShMLa?=
 =?us-ascii?Q?Qn/rjYimma1X3KxpfPUehFWLaO7FxxjU4uhKM25Y9r518RSwcsns2lQHy16V?=
 =?us-ascii?Q?kR7wJ0bLiYHBFu7XLy1lMHvo11hz39fQO5pels3HGsgLHEJvq5JX7o16xzq/?=
 =?us-ascii?Q?TtgGR49UbDub9cGuyLqICKMzg2jyxoXlVsTf6e/U0EK/Vkh149X5t974MNt3?=
 =?us-ascii?Q?9zpxZ9wJTbWz4U8p2SUQOAVIZB71GBD2AW8JCFQnC4RB/H9wYaOVR3UOMeH1?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdfe6bf-8be2-43ed-793d-08dce7c31c74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 18:00:36.3084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/PY4T9SZqAOlVpETTkYkZdA3xrAX0FXs9tWVCfhPgACbIS3rduWaYyh/HF6hbxdS6qJjLE7qc/zDrMSlSKkdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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

On Tue, Oct 08, 2024 at 05:24:32PM +0000, Matthew Brost wrote:
> On Tue, Oct 08, 2024 at 11:55:03AM -0500, Lucas De Marchi wrote:
> > On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
> > > On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
> > > > On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
> > > > > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
> > > > > > Drop the exclusive client count tracking and use the filelist from the
> > > > > > drm to track the active clients. This also ensures the clients created
> > > > > > internally by the driver won't block changing the ccs mode.
> > > > > >
> > > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > > > >
> > > > > Is this really fixing anything. As far as I can tell nothing upstream
> > > > > opens a file internally (i.e. xe_file_open) is never called directly.
> > > > 
> > > > should fix this case:
> > > > 
> > > > 	open()
> > > > 	close()
> > > > 			<---- race here
> > > > 	change_ccs_mode()
> > > > 
> > > > because the close is not completely sync - the cleanup where the
> > > > previous number of clients is decremented is executed too late and
> > > > subject to a race fixed here.
> > > > 
> > > 
> > > Ah, ok. But then IMO just move the clients.count decrement to
> > > xe_file_close. I try to preach solid locking / layering and this seems
> > > to go against this idea.
> > 
> > why do you want to track the exact same thing in 2 ways, one in drm and
> > the other in xe? "Are there clients connected?" is something drm_file
> > answer and doesn't need to be duplicated in the individual drivers.
> > 
> 
> Well layering, making assumptions about the file list means, and not
> randomly deciding what we can and can't do with locks we don't own.
> 

I looked at this a bit more, if we want to do it this way then I think
at a minimum we need a drm helper for this.

e.g.,

bool drm_device_user_clients_open(struct drm_device *dev)
{
	lockdep_assert(&dev->filelist_mutex);

	return !!list_empty(&dev->filelist);
}

Matt

> > At least it's also used for similar reasons in amdgpu and vmwgfx:
> > 
> > $ git grep -l -e "->filelist" -- drivers/gpu/drm/
> > drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > drivers/gpu/drm/drm_client.c
> > drivers/gpu/drm/drm_debugfs.c
> > drivers/gpu/drm/drm_drv.c
> > drivers/gpu/drm/drm_file.c
> > drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> >
> 
> The AMD / VMWGFX usage certainly looks wrong to me. If the file list was
> meant to be traversed by drivers there should be an exported iterator
> IMO.
> 
> Matt
> 
> > 
> > Lucas De Marchi
