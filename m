Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2454EEC28C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D51D10E465;
	Mon, 23 Feb 2026 21:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6iUrKnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C271610E461
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771882875; x=1803418875;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xpw+pzuhsR2yKYC0H1QAj+IcdPgomd/IncRGH2A6nqU=;
 b=m6iUrKnnWkeUk7NiRVf6vWGsHaeoUxXd6Y0G6okTj6YfIZm68Sz8lftI
 6yvQ0VPPH63y6J+W1PUA+xoSU3pKv1UBNBNTHAOSx52jOrq9zrqTuyJVp
 nMlmYBAeFgcAIioznFpQ2CMwIi3s2cAbQ0f9kYDKmwanu32jYOFs93JFO
 84BB5slNQI8N0e6OkyYyw6k5WjXf1ORTrmCHREYyakDrndr1v/1PQlCHS
 DsOIUwqp2GNpstbX9pNL73UPsBafnxe8+enwpCmbamEE5rKDdhVVZvb3R
 1UN2zqPpIz3yY3Akj8dHeRvcvWar5LcEReXPnsI4FpRMdsAklVPyfG0WZ g==;
X-CSE-ConnectionGUID: BWXV+QQmRaq5880m93ve0A==
X-CSE-MsgGUID: GUPckd3MTXO0umHMKocZfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72766553"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72766553"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:41:15 -0800
X-CSE-ConnectionGUID: Sil9EVnHRx29CCtMynSnPw==
X-CSE-MsgGUID: t1Af85gsS3uiLaJqPPsb4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219802237"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:41:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:41:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:41:13 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:41:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/hGdXv9XPtNozdI8X2N2U8mdK+L1/yKon457kCJHiLVpE1iZm8HOi6qgEyYUUeIcQmVVBJm+B4uEFtWZEHo3Vksn1H2EMN7nvB3POVf5t9kn2Jvgx3EnwDxnQXljVpDaDyElnWal3tfnY7cDXxPyK5/trP8bbFkSxY3tiX2TdhW9SelYRtqQOscOKQmve43EsJLLj5VGTWrZN3hQ9PEVd6c1J8Yj+cPkexR/6J9jyCc4nG1mOrSDNNODfm79bj5jilMel9+aTCkTpCbGHn6otJHii3zesq0lQ4eEn/NQwFc+g/h8qkBXrl5Pmdebp6Qe96gvAcfBWFctyRJCLLKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56S12w/JhK48nyG63XkP7mWlhlo552FRp3WPb1yUyic=;
 b=YMkulSi32j+2KJ2GDZKWwdnHY9dZLmhU1MscTKaqjbyEN86eqqgS1iveQDdCXx32Zbll6U7Q93LeZD1jxGEzg2cMA/oAoM3SmakDdaq4lsYqTHnRp1IhzF8HyK0h9WYrelVHkn7mh36OWuVyBG72w080xXEPaL00ynYA5/jYkkzrMJZBzfSg5iG/4ud4MMbP+s/YeJ9Hs37nnSMSzlMNwec3pIRtBqb70XZYCAwr/IKHi83PuWhiDRq5VKbEtLw6OCstri6taWSUQjADxJzQxUvgN/EICAx/1QNiDzBTX4kSTS+ssiu+fKfcLwwn6jQhGunNPhEQTZNEuuxSb76mWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:41:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:41:10 +0000
Date: Mon, 23 Feb 2026 13:41:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 16/23] drm/xe: Consolidate workaround entries for
 Wa_14019877138
Message-ID: <20260223214108.GH4694@mdroper-desk1.amr.corp.intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-16-b12005a05af6@intel.com>
 <DM4PR11MB5456A6363D05A35429F44AEAEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456A6363D05A35429F44AEAEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ab533f-a4a9-4f66-60fa-08de73244285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ivl3SpK6Y4AHL8GkxD/YWJrpzQEfAvtj1cej/e2sQ0crgQGEEmy0Gv18xdQR?=
 =?us-ascii?Q?hExT5EK6z99pzGMkjPOA3ZUUxdbihgKvePhfV5AJXOo/74MM74vE1kN+3ekz?=
 =?us-ascii?Q?/bEVuvaa2z4afUChmT7n8vw1qRRHqpeERYUFp+A8hRS8tzoEckGeDJnsgh4Y?=
 =?us-ascii?Q?kSXmfDUNF80ona4IPZWPqF/yuIsN+0J92bY4w2zSxqVHENzeKwsk3WGEgpND?=
 =?us-ascii?Q?WuNwq4cc2VR0Rps55YuKDiwLGtOIz3F4bbtJz2JIzxOr0UGI/8pZLIKXKgUP?=
 =?us-ascii?Q?Qvcvgpi/wxzXTuHh23Fc9H+oM7JTuZ9EsXby1gNeadxFQBNrHvU5WAnhCq5K?=
 =?us-ascii?Q?NrrqtsjYVZ+u/7UuQSfsbzKsQ/pFmm5fHP0hBvINc5s7FxObd1zJiNLTW4EA?=
 =?us-ascii?Q?ypwDKvmOX89DkOFi9yowpB6n0dMYJZO32w9kO7/sbYSmY2w8/QyjoQHoy+oq?=
 =?us-ascii?Q?Pkke9Yye12E36YsR8M0Py65OVjkIRIrNsz2rHo5wxtLGHPM9A1pO2Kxvg0kx?=
 =?us-ascii?Q?VNOMV0DUgscogna9BbWWHvwP2DtlXsnUZeJ4jRcjEVWiPzx0hhU+XRWi8oYN?=
 =?us-ascii?Q?8CdieMlIvGpcAVCJtIZDYC34bTHNkvjeu1Y0u49xcMXFx0V2HyAWKgmqxgcK?=
 =?us-ascii?Q?OOAv8ZimScomA1lK0LUk7+pvH7JOnGaivfWwhzXf0pZVYRayBRviZoJ1nVgI?=
 =?us-ascii?Q?e2b9e1XeH4QT7QjLXYezNXPK3A1OdS2RGJg0eeH94rAp9XwrandMYTpZi6/s?=
 =?us-ascii?Q?21DqSXDIqXiIHcnp8PB9P7Qos79hy+6MofGSOZNXGDF8JLNsMSF42Kxykxnm?=
 =?us-ascii?Q?UeTpW5h0SyBQRpcGL8KnuKfsWRZ9E1ld6f2qUA6lTkJZJdmt2ExrZrtn6I2s?=
 =?us-ascii?Q?RwqZGSXMZZ9ZsorT9mWyIgg7+Ke1KKSdaRPcMKW+XF8UrY3r6BsftA8iyZkl?=
 =?us-ascii?Q?PyAlzMYhRuIKPAznpAEO7YVpNH0I51IeV+/aErcxYg5jEHb+o/URkz2/QzZM?=
 =?us-ascii?Q?f1aYwjjy5KrktWUzZ0wQ2/jAl0Sq0R9emCfUjb4+xxkrrZO4XFA5SCouEbwu?=
 =?us-ascii?Q?E5E9WcVKzCz4uZjCWepALhzZAlDuAw4wPHEEXRvwDazBSYb0oEztXhAHHrlH?=
 =?us-ascii?Q?oJoJDDTNIMDbubXhgojlCvYo4uXyYFKJrA+Z09c12FbUZrKkrKGDWmqe7ATL?=
 =?us-ascii?Q?7HuXUhgx3hwIsW4XXR1zrJ0/rujWnfj3qmW0byB4KresBGM3nCZrxtho4j10?=
 =?us-ascii?Q?IAQ0gvF0JXz6t9rQ2BL9gbqq7UtdR3Ho67q/PZdFluxf1Ofdg58J/Srhw8ZW?=
 =?us-ascii?Q?abrIofKPQRKvnW5si/I8utVrMZd5Cn7O8ugjtwJjmIcbMm3TxiEIDtCMZHsX?=
 =?us-ascii?Q?TDM5koUgRJ8lzMW8FIJt6OrbHnGZQUdr1nN/ZCNiEwXzzVfGHhIoT1arHNN9?=
 =?us-ascii?Q?8yqGB7Lc8Hae6v6nGgMySi/MPQ+sa2mPIsSr8zx+K7hMrtjt4CWcrQp7H9iI?=
 =?us-ascii?Q?VzVZhkmItxYZCjecv51dWNateZfeMPN78HXx6S6FdY0CYgzC/+xmdgccK+AP?=
 =?us-ascii?Q?8K0LayUhMTmcIzczR3o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iwVLQ0ajWNl9bGMzKFIogT86wK4uo63xtcIlb60LAPXylamH5VmK+OsY2Ye3?=
 =?us-ascii?Q?IeJciPxcWFK/dMSn3CYZuYS6FhW3w1Sea6cUGAxxIp3HEXohR2PYzjj3xWQL?=
 =?us-ascii?Q?GtMSuVl5riDMGhKKvWyOzccPREgQJprvauQyo5QznDE2cZADTPYvioSfflm5?=
 =?us-ascii?Q?rtl8OXV3RpqhSovcxFrB+kc5XAhlm0dez5YvlkF18oKMeP1pHYOuAwo0Yogp?=
 =?us-ascii?Q?NBLKnqJqpUqGU6kVnNrDhfzOHnzGP3eaBJ+gNdReI6JhM7ls7vrg+yVcLLCR?=
 =?us-ascii?Q?nrA+crF+owwTyBtBWGVIDisjtLf18VNXRIYw1wJXWy+PsJ9ntx0llHuvoHHy?=
 =?us-ascii?Q?S0OLz9jSejJME+RWDVtt4QfnaCAj7yjW2bzxEn9RR5/aC/vYOxUSYqxdTHy3?=
 =?us-ascii?Q?WF0CONDn+M2qaysUUDxq4qp07vmYEKWcKuy1cPk2aXUUNfr5uZdYqB75Nsr0?=
 =?us-ascii?Q?ICgeQOil+M9mYQsWsUoutWPzz0vJflgQXzmYir0WQOwrx2gu5kx1B3awTTW+?=
 =?us-ascii?Q?YCYeJzTKzJvGv1RRCW6o1SZYM34SMQC6aWYgcK3jcX3Hkkg5cbuUFPM9J/q1?=
 =?us-ascii?Q?qXB6RuKWnjmjWVQu3ozQNrdA2gYkpIJ2PFFjX0Zff6I5rygg2tRsq6zUYzF5?=
 =?us-ascii?Q?WfAyofZVIhgm2Brr0maL4yPdkLkWTiFMIINuCPArpHzUw/sU4MdMD0YAyBGf?=
 =?us-ascii?Q?q/4wjClgosHjoLXz9hNo0sFn9kAmnst77dThva2sDIGXwh0ePrN2RRcTfZZP?=
 =?us-ascii?Q?i0WLxikX4KOtAOtc1tSs/ccFNskFg/tVAATQoB9t087kH15GtU/P5tCbMRPS?=
 =?us-ascii?Q?DHvWzy1CN0Nds6V/wOR9qOMZCL4LayOnVTGW/n0kna66TPdtZ68dbtDSmEbS?=
 =?us-ascii?Q?bu6BPlxOO5/RtMtQBeNnSsvv3H1gDG6uqBQczBQG3bwcDoRGFt9gdwbGekbs?=
 =?us-ascii?Q?etbzqNMy36DZseM9lXFlsXEn7NA469ppzCjOzNJHkLz6sXVXZR7kUUuj/8zE?=
 =?us-ascii?Q?StgBwarnySuxOROgp7FU4A5617pG075Y4HGsDJ7jqcD7cOHO99Ovp3FVyjRP?=
 =?us-ascii?Q?72S3eFBWqpjJ/9eS785tEB5rsbCU+JCLc2N1QC+H3hwB9CQmefctzc3Hnn5V?=
 =?us-ascii?Q?aKrG925SVf6MdM22uxWR3YSlt72BmWb63YLrX/pxtOhpmUZ9MRw570451YY0?=
 =?us-ascii?Q?FRmldRRXLu8RVDdlI+X10BrEKjYkD/3sq9jKZotobheaF+vKRyPKecDY8M0X?=
 =?us-ascii?Q?wY6epddN6j5nvMWF643i49/d94zfFNcWKi/xfNcgcO5UNT/ZN1u9Ks637PYN?=
 =?us-ascii?Q?+a5/0X7yV7HPSeIkxFoAUatMz1NzJW/xfCEZxGs90OjXiBfwYpD9OA84RiZS?=
 =?us-ascii?Q?vAGZcgTJrEZRBxTW1ih50EQjfnk2rhUvxAspRPkPdfX+kau9Ld+EXNaE0wh6?=
 =?us-ascii?Q?HfkPbY5y+3sVW3H6JCXDmvrX/RlhsmBWiqX353hHSj+MOlgEzUfv42Nrd1Z1?=
 =?us-ascii?Q?2KHO8gkAvddYgaZk0hGaW8YAhySL0cxCUnFnvJOt+pJVXuqumebeb4GWLEDi?=
 =?us-ascii?Q?TJeRvtC5FK1OPAwYr1TCIyjvO4qXxFwLRhFW6MsVHhEFCjUcsSAPNBXiLXmy?=
 =?us-ascii?Q?3RCIFjSfO3HLoDJaUKZ/2wmOjJbmErXAo7mwENyxoWUr8jXRFXo8T81g/Jh4?=
 =?us-ascii?Q?jJlihzuvL1oDrKzJSj0wLN1SOGja+eOB21fPnlAPznXa3M4oYfnf4WEL86eN?=
 =?us-ascii?Q?O8aGtpeZr5VD/2wyw8ug+Zpvqg/dFWQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ab533f-a4a9-4f66-60fa-08de73244285
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:41:10.7054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpsUNDazdxcINEj8tMGiMEPgmMJ8CWekW1/E4eITrVS2eNbRvM9EbwFg5WWejWG5M3wDrhU2l7GESzR6hARw0m6m1O0sFAiB8PwlZA+MNkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
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

On Mon, Feb 23, 2026 at 01:33:37PM -0800, Lin, Shuicheng wrote:
> On Fri, Feb 20, 2026 9:28 AM Matt Roper wrote:
> > Wa_14019877138 applies to all graphics versions from 12.55 through 20.04
> > (inclusive) that have a render engine.  Consolidate the RTP entries into a single
> > range-based entry.
> 
> 12.60 is included in this range, which is for PVC that doesn't have render engine.
> LGTM.
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> > 
> > Note that the DG2 entry for this workaround was missing an
> > ENGINE_CLASS(RENDER) rule; that mistake is fixed by this consolidation.
> 
> Should we fix it in the stable kernel also? 
> This is a pixel shader related register; the setting should not affect other engines. 
> So it seems this mistake should not have side effects. 
> Is my understanding correct? 

Missing the ENGINE_CLASS(RENDER) rule will cause us to emit the register
as part of the LRI setup for the default context on other engines, but
since the register isn't part of those engines' LRCs, when the LRC is
saved out to memory at context switch it won't have any effect on the
context that gets saved.  So it's a bug, but a harmless one.  The
documentation in Documentation/process/stable-kernel-rules.rst indicates
that only important problems should go to the stable kernel, not
theoretical/harmless ones, so this wouldn't qualify.

Also, the Xe driver doesn't officially support DG2 anyway (the support
we have is just for driver developers, and will taint the kernel if an
end user tries to force the driver to load on DG2), so it's especially
not relevant to the stable kernel.


Matt

> Thanks.
> 
> Shuicheng
> 
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c | 20 ++++----------------
> >  1 file changed, 4 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c index
> > 83318a4ebcb51e004497e2cb9460e95691b5d9ff..21af997447e78951dd6d
> > 40c87454e8ef69343006 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -637,6 +637,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
> >  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> > DISABLE_TDC_LOAD_BALANCING_CALC))
> >  	},
> > +	{ XE_RTP_NAME("14019877138"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, 2004),
> > ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > +	},
> > 
> >  	/* DG1 */
> > 
> > @@ -673,10 +677,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> >  	  XE_RTP_RULES(PLATFORM(DG2)),
> >  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1,
> > MSAA_OPTIMIZATION_REDUC_DISABLE))
> >  	},
> > -	{ XE_RTP_NAME("14019877138"),
> > -	  XE_RTP_RULES(PLATFORM(DG2)),
> > -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > -	},
> > 
> >  	/* PVC */
> > 
> > @@ -694,10 +694,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
> >  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1,
> > MSAA_OPTIMIZATION_REDUC_DISABLE))
> >  	},
> > -	{ XE_RTP_NAME("14019877138"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274),
> > ENGINE_CLASS(RENDER)),
> > -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > -	},
> > 
> >  	/* Xe2_LPG */
> > 
> > @@ -705,10 +701,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD,
> > XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
> >  	},
> > -	{ XE_RTP_NAME("14019877138"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > ENGINE_CLASS(RENDER)),
> > -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > -	},
> >  	{ XE_RTP_NAME("14019988906"),
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> > @@ -758,10 +750,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> >  	},
> > -	{ XE_RTP_NAME("14019877138"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > ENGINE_CLASS(RENDER)),
> > -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > -	},
> >  	{ XE_RTP_NAME("14021490052"),
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> > ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(FF_MODE,
> > 
> > --
> > 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
