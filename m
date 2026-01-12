Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9B7CF45B0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 17:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2610E00A;
	Mon, 12 Jan 2026 17:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmkSUnT7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2965B10E422
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 17:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768238603; x=1799774603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UJ8Mb729rMexJ9l0ined2Bnx+W50xgXOM0FnKdTo0ak=;
 b=VmkSUnT72ML9PCR+UtJ04inXDLKtk9P0mAHs9N0h8q08BzpjdLrHlXAZ
 Ae8evlqnZbpquXKFr5O6sfehINxjUFdMU8xIXT67OBTWAIdDaZ8iz4EIT
 Ab5g7gKvyLfBI4co1U4P1L7ryMCZJoQzLoQ4tu5o9HvLbFNJrl9jqJj2u
 RbFhV5Ms0uVVO5mBUeHIs/6eNEusRRl48krc8zHCp4hlaGNRhvDRKUqXW
 hvGXnvcv1ust0c+L9RkAwElIcwkmzOgQdYXKkB0w6o8wq1xhj2KcpBdTu
 OK/P1N4idKoMv8gKhvT7Ws6xDud9ioATe9Xh8OGvRgQ+cP44Cx4fZfM3h g==;
X-CSE-ConnectionGUID: FEShaCeGRXq+gu9czN86Eg==
X-CSE-MsgGUID: +ZOhbPxiRy6+elzZROUQHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68723453"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="68723453"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 09:23:23 -0800
X-CSE-ConnectionGUID: ztpizxCNRT2sJAjjtS2y/A==
X-CSE-MsgGUID: n9XqpAutQJSP3Sy/8Lo22g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204159264"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 09:23:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 09:23:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 09:23:22 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 09:23:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/Utyi2tVfKhhllC3qz/kSRxWDXgO9Iw0rrQLSyJnHg/Nl81LU4C/oihOHPcamAt4iEAMzZnOC7kwlhqzfPhAX5zEixvrtSsCTbR5FRlB+qNB5c7O5DSoqNc+t8DPPx4jilI5CkRQvpwb4MxLrwp47vvYKWVlPegsMcOfBe4VpeLnQuNgjokm1otNZz0NEk89/cbcp0Ou9YxX3agHJYw5Qu2/yvAtX45KrPY0qqDxKH3oEWyQpGf8/CLRv04ZFSKJaE7rqjs0QvcOXOXYt3uUp/RVmo+iXb8hkVoOsnwENBitfWrevgDHU7J6VcYbNFMIHaL/TLgQaJqYZJthXoGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOZEhhJMQK4MplQ1Xp70oGjoTD4EdlBO97q1DxiKxYU=;
 b=Cu6Gz8LLYrVxFoJ5R7Jy709j9msBqYp4sBJRKYm6x69qFYSv1/or6ivg3l8jECTXedLY2Nu0dLeTbnc/gV+v4gQFDUOJNaoVWlOJYqAbFqikfN2TV8t3SXHY/NZCoJ9rdvZNQ+MycAT06vV3GXKZkxsX9eQ+Jl3eipPT0VChHBsZW61b2Y99izd7O0BskDQgTCO2HC9ohB5rSzW2JTcwKAS/RHKxnO5TrsYIE3ROE4hfT7P0Y5Jrn/i8RZPU7NNfUjPCtIGZlcENmb6dkTUWybPMrJxy8gDanov7v/FlauVCkH4aFqcYGFd6vtwccmqsIkFcBit2zpJ69VgVyA9Aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPFC0CDE789E.namprd11.prod.outlook.com (2603:10b6:518:1::d49)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 17:23:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 17:23:20 +0000
Date: Mon, 12 Jan 2026 12:23:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v5 4/4] drm/xe/hwmon: Expose individual vram channel
 temperature
Message-ID: <aWUuBYoZt9xmAlcf@intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-5-karthik.poosa@intel.com>
 <aWJ9EK0bi7f6WNRH@black.igk.intel.com>
 <79952244-7068-4d03-b142-aa15c81e2b59@intel.com>
 <aWSsrNRG4dDjf2PY@black.igk.intel.com>
 <67e9d831-361b-4691-8a52-bc6d0695b7b5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <67e9d831-361b-4691-8a52-bc6d0695b7b5@intel.com>
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPFC0CDE789E:EE_
X-MS-Office365-Filtering-Correlation-Id: 17965b7d-2384-49d5-5e4a-08de51ff47f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?px8QyfFbQF+UjgvwURzZd0jPG4YuHcVO5JzP0o2x0Ja4xyjyYXOzox1iuoM+?=
 =?us-ascii?Q?CZEik531m0be5AfKeONJsW3l8p3PiMJsnBdpkj7LH8PErcB5JGJFC7pcQPCH?=
 =?us-ascii?Q?yTRAKXdnbdpv649cWwWO3H7ITDX4cJqnYPL7sP2nywdd1/4qn81NoAnEe65c?=
 =?us-ascii?Q?3zOHoXW7l9y83cTPtw1M5tWNzQbJyVIHRkyUOtm6m7DaiNiUj/qaKneh9dER?=
 =?us-ascii?Q?JTeLYs3pKUnEie+w3EUFKiDqTrMJYxQ1fyZavS+f1mawt+0YlTlFyS5ictlk?=
 =?us-ascii?Q?68cz7Jw720wQkJA9UgwVQ1KR63Ixdqpo7pdC6YH4e4QYz3kkDtjKhR6+Kvya?=
 =?us-ascii?Q?yMCwZEICBOySeiykIwNxJJltyfJEXmC26iHmDjp4ITdK2OBx7BmWpkybFjKX?=
 =?us-ascii?Q?gnfxLjo99AhST5OCYpvYq/hUD4d480L5G003Dh6nV+pNuZ2nkk9EXQyS6y+J?=
 =?us-ascii?Q?RDisTe3gCP8lo4GiF+HWb8zMyNCBH2v0rRPOROaTN0YaTyNveplV9XavUNiK?=
 =?us-ascii?Q?IlGIfvh8zpFJcasO0VRSANf8hMPYz16jpv++BvplE3600LDAVwtlnXJ9RoKg?=
 =?us-ascii?Q?77rDkyKOuDdcacuGRWrXGl8eKIFQGyV+/zHCVs2YLDG0B1Dphj+UqzD44+Fj?=
 =?us-ascii?Q?uygQs2tbS8Es240U5IHJEHVJm4yWiJ95z4CVQvSzlfmV/KZutBzm8s4lh7Cl?=
 =?us-ascii?Q?dGDDRmZZZbct/Nqc5MzGDrOm+KamTqvU6oNAtMZZyTMOfNl1bm+EMPaVhJjh?=
 =?us-ascii?Q?fMxy0BHd3Fa4q+ZObot89d+9wO7YeAzxvlWk8QEA/Uge2qC3q1fayXW8WArz?=
 =?us-ascii?Q?R8VNrxiqo2uwqgTSke5gqUgf0cJVf0M9fPyRDxGE5KqzLaWnwZcGebWZhc/B?=
 =?us-ascii?Q?QcC0B7BKckzZLboIlhhsrEqUCucm6BRiDnvAqZAKpZeELv+ucOFBZk8REmjC?=
 =?us-ascii?Q?OGsaIa6iapDMtyybSIbdV60BQRVGKyW4QRl72wGnP/W2ZxcQnvs36zcnavpj?=
 =?us-ascii?Q?nz1s+aoEvx2J+nY/1cuUpVSuj3KxXO8Encfkm4wFKEdh8AOK69q6rV5RYSNg?=
 =?us-ascii?Q?AsPnC+UT8SCPl0lfqtR2QoPjUfU55mMUpa6gg+Gs70ylBxLqg1B3gn+NhaTW?=
 =?us-ascii?Q?3mSsA9vmitc+PMePGSyZ08I2yN+UyjQZ6CK3vtZ8S8BMK5WbipRaeSJbxici?=
 =?us-ascii?Q?smM8lUyVaSaxKxxLIM/IfyXgqA+VNaqZlZlV700bwyeVJz1zOaJqF3D2tuKP?=
 =?us-ascii?Q?1RVEdW1mVPxifiYS7ttbIo4rev1TEFnWFUc1fkZ1/7zE72w+rUgqE6ZyhyDH?=
 =?us-ascii?Q?pwhW8eW1j4q5/nExbyDsqyuA2rWAMMA63ogyRqMs4+XCl9N5qP5WUO/vzaEm?=
 =?us-ascii?Q?Qc3Uzv6KchzcabNNyWrGA9WCxzjc3VyHveUNm+LbCKbaJmhah9wQ5JO+bS5c?=
 =?us-ascii?Q?RnA7ePFj99Py2EAWQHqtMMSIGOcxoY3V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dflShVn3d11FtB6f2WB0dQ76n+2YA0IRYsRbc28K3eKzjErjKG8gmGcBGnLQ?=
 =?us-ascii?Q?MhXCZdSBZYR7V4n71aDq2fC4by8tWDilDqD7+BmhyxNd325XTEo99kwZkyud?=
 =?us-ascii?Q?tHw6r0q7BaudJsmbBtw9OoTIAw43P49GLdF4SLTnKNZVEkakC/lLo3tDJQin?=
 =?us-ascii?Q?njQGVi1586GHMyBd6Vt69CLRxNnOLM7QiwKb6x9x1l183ArtB8Z6KulKsbv5?=
 =?us-ascii?Q?M19CBBtgpMsY3oJW44Im3QmbRxktyP0iIHkCguqBw90r6/lkYp4wxnotXzNg?=
 =?us-ascii?Q?Mtv2qwb0v8RT6pGnbrSHOEz/l9O4AVze7QGnglRRezNT8OENiocR09SnvToQ?=
 =?us-ascii?Q?Kxo4d4F1hyhvPRErn/Nd0rigzvGx7vzb8RofmQeGFup6ev9fMZtn5fm1/VCK?=
 =?us-ascii?Q?qIYzxlRDs/LdUw2CcpjYw5fMqgJTStmfAY/Uqo7dadUDGc05BOZ+vKqrz+r9?=
 =?us-ascii?Q?NJCUDhL5neBn39drDhEBt7bBmfO8B/NF7cWgyNzXF+XN59LG8cVdiDTfq1zD?=
 =?us-ascii?Q?2ybK2UA+naGHSzh3hvfoAM2OOVzhzIGQM8w6/y7OZixC8n6NaCwn1UilhsPe?=
 =?us-ascii?Q?LQR3ZFpW5h9LOx2VLzwG2/Bx9ntRsqcZ7xwRNdrGxtqq/aG82cpfy6Sab6rR?=
 =?us-ascii?Q?kr2H7Lv2FrdQYFQYhyGXvLBs5tUoVicI9gWY21o1X9Xky+3SREVeD0tOwwT+?=
 =?us-ascii?Q?P4K3Bruyc9JG75KMKsATgUwtNn9S6VQ4jGXsrjK8nIjXeKiWhvobCMnsfS6M?=
 =?us-ascii?Q?WBoaTLu0yAF7f+sdftRbKJMCw/S7JX9hGTVAW9vEw3F7KXjhIAoMaA1h77b+?=
 =?us-ascii?Q?vZFsK1iBlqmytQ2eh5dCxWRTIwL+kUpFuagmRmvpKyGJ/Mv9q65Vltw3k+jg?=
 =?us-ascii?Q?l0QR8dX2ypSgGiaaeXoHzJjL83vfUsjVAGeE410fk0S6fg9UM8xVX71LKdXe?=
 =?us-ascii?Q?c9MG48PMYWyDqoP/CE4WFbmfqyoaWfqFHo4g1nEjlYqwFrfeYMWOrB6ZKkdA?=
 =?us-ascii?Q?BIhnMHMzv08+Z2bI975sb1a/n+ZzTy+jg9lYyOIJdUkaASkcYs+gA1puWOSh?=
 =?us-ascii?Q?Q9wroIC7wrTq22VP+IogEqVu2OUskmBWg7ZGv6+y/JJnlkbt7KL27yaxzdLK?=
 =?us-ascii?Q?PjMKmBiLhTaKKCsInunjh1+hn+7UFAdtzlCJ652bIvmjMKtj04LTY/74r9u/?=
 =?us-ascii?Q?uTVR0RJYeNALfCcwBT/3U6/fxS2pUvoi2YdtLBIrGQMa/5keDPgvMQBnto4J?=
 =?us-ascii?Q?jA2plFuNceAjv3RRJLEYL2P5DM9Zxb3be/NXlDgIukbqbn+wryD9Ha4LwW6J?=
 =?us-ascii?Q?yGaeHuZN0QB0Js7pV/AEfl1abd50qFXkAiqJ/m1R/vFOqVxs7MFNr8GhuLEP?=
 =?us-ascii?Q?JGCvMvAK+Qi4k82qwqvbFyB1T0Z2wfu1iLRKzp3ado+8sIAh5xX8fX8WilUJ?=
 =?us-ascii?Q?+6eFgEBTfBFAPXIp60ca3gScblgF8cd6VXxQ456oSnI/fprr/Z1cvB6khsUY?=
 =?us-ascii?Q?IMiWyzu4O8dNxOQYSLHMFbt99xIsV14sya68FvFX7vo6f7WgPAAZ8VdBY0rK?=
 =?us-ascii?Q?05vbYnHC+QdXZuBUE95/vGPZsLR34pQMxRYFl5nequvzTIagPlavGm4i1K8H?=
 =?us-ascii?Q?Gwv/jJQkE8CkFMMYFfNq44BAvHCHL1w/OIEiPzRNNznoPOE1JsNwOjlzuhfe?=
 =?us-ascii?Q?5CERdgpjXwns9eH6lcmRGZ/PhS9dE9XgiX186U7jdndF+vvh4Gjm1TIe7XpU?=
 =?us-ascii?Q?a59+4QBVgg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17965b7d-2384-49d5-5e4a-08de51ff47f7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 17:23:20.3278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHhixum3yZXDQe3mjS62DRt169zEcFPVh/tNt8dX6YT06JHUaPR+frMTe6QZunNrboepJQ32+iSe4Lj32/gyIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC0CDE789E
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

On Mon, Jan 12, 2026 at 05:15:35PM +0530, Poosa, Karthik wrote:
> 
> On 12-01-2026 13:41, Raag Jadav wrote:
> > On Sun, Jan 11, 2026 at 12:52:39AM +0530, Poosa, Karthik wrote:
> > > On 10-01-2026 21:53, Raag Jadav wrote:
> > > > On Sat, Jan 10, 2026 at 01:46:44AM +0530, Karthik Poosa wrote:
> > ...
> > 
> > > > > +static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> > > > > +{
> > > > > +	struct xe_reg vram_ch_temp;
> > > > > +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> > > > > +
> > > > > +	vram_ch_temp = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> > > > > +	if (xe_reg_is_valid(vram_ch_temp) && xe_mmio_read32(mmio, vram_ch_temp)) {
> > > > > +		/* Create label only for available vram channel */
> > > > > +		sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], "vram_ch_%d",
> > > > > +			(channel - CHANNEL_VRAM_N));
> > > > > +		return 1;
> > > > > +	}
> > > > > +	return 0;
> > > > > +}
> > > > I'd write this as
> > > > 
> > > > static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> > > > {
> > > >           struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> > > >           int vram_id = channel - CHANNEL_VRAM_N;
> > > >           struct xe_reg vram_reg;
> > > > 
> > > >           vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);i!
> > > >           if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> > > >                   return false;
> > > > 
> > > >           /* Create label only for available vram channel */
> > > >           sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
> > > >           return true;
> > > > }
> > > I'll agree with vram_id and boolean values, for readability,
> > > other than that I would like to stick to current implementation.
> > The usual practice is early return negative cases, but upto you.
> okay we can do that in next revision
> > 
> > Also, just curious: Do we need the 'ch' string here? We already know
> > it's channel, right?
> yes to differentiate between existing channel "vram", I've appended with
> _ch_X
> > > > >    static umode_t
> > > > >    xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > > > >    {
> > > > > @@ -903,6 +944,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > > > >    		case CHANNEL_MCTRL:
> > > > >    		case CHANNEL_PCIE:
> > > > >    			return hwmon->temp.count ? 0444 : 0;
> > > > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > > > +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> > > > Shouldn't we also check hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]?
> > > that can be secondary check, then this would apply to all channels !
> > For the channels that return data from the mailbox, we'd want to make sure
> > the data source is also working. Else we'll have dummy attributes exposing
> > no useful data.
> okay, I shall add this in next revision
> > 
> > > > >    		default:
> > > > >    			return 0;
> > > > >    		}
> > > > > @@ -915,6 +958,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > > > >    		case CHANNEL_MCTRL:
> > > > >    		case CHANNEL_PCIE:
> > > > >    			return hwmon->temp.count ? 0444 : 0;
> > > > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > > > +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> > > > Ditto, hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]?
> > > > 
> > > > >    		default:
> > > > >    			return 0;
> > > > >    		}
> > > > > @@ -935,6 +980,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > > > >    		case CHANNEL_MCTRL:
> > > > >    		case CHANNEL_PCIE:
> > > > >    			return hwmon->temp.count ? 0444 : 0;
> > > > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > > > +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> > > > >    		default:
> > > > >    			return 0;
> > > > >    		}
> > > > > @@ -963,6 +1010,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > > > >    			return get_mc_temp(hwmon, val);
> > > > >    		case CHANNEL_PCIE:
> > > > >    			return get_pcie_temp(hwmon, val);
> > > > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > > > +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> > > > > +			/*
> > > > > +			 * This temperature format is bit 31 for sign, bits [30:8] for whole number
> > > > > +			 * and bits [7:0] for fraction
> > > > Nit: "Temperature format is 24 bits [31:8] signed integer and
> > > > 8 bits [7:0] fraction."
> > > > 
> > > > > +			 */
> > > > > +			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) */
> > > > > +				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> > > > Since you're already casting it, I'm wondering if you need to check
> > > > for sign?
> > > |REG_FIELD_GET() returns unsigned type, which gets stored |the lower 24 bits
> > > of an |s32|, discarding the sign bit; consequently, negative values are
> > > interpreted as positive, requiring an explicit sign check.
> > Would something like this work?
> > 
> > 	s32 vram_n = (reg_val & TEMP_SIGN_MASK) | REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val);
> this is okay
> > 
> > 	*val = vram_n * MILLIDEGREE_PER_DEGREE;
> 
> but this wont work as it will treat value as unsigned and we'll need to
> again check the sign check here.
> 
> existing one does these all in a single statement.
> 
> > 	return 0;
> > 
> > > > > +				 MILLIDEGREE_PER_DEGREE;
> > > > > +			return 0;
> > > > >    		default:
> > > > >    			return -EOPNOTSUPP;
> > > > >    		}
> > > > > @@ -974,6 +1031,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > > > >    			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> > > > >    			return 0;
> > > > >    		case CHANNEL_VRAM:
> > > > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > > >    			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> > > > >    			return 0;
> > > > >    		default:
> > > > > @@ -987,6 +1045,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > > > >    			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
> > > > >    			return 0;
> > > > >    		case CHANNEL_VRAM:
> > > > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > > >    			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
> > > > >    			return 0;
> > > > >    		default:
> > > > > @@ -1356,16 +1415,20 @@ static int xe_hwmon_read_label(struct device *dev,
> > > > >    			       enum hwmon_sensor_types type,
> > > > >    			       u32 attr, int channel, const char **str)
> > > > >    {
> > > > > +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> > > > > +
> > > > >    	switch (type) {
> > > > >    	case hwmon_temp:
> > > > >    		if (channel == CHANNEL_PKG)
> > > > >    			*str = "pkg";
> > > > >    		else if (channel == CHANNEL_VRAM)
> > > > > -			*str = "vram";
> > > > > +			*str = "vram_avg";
> > > > If you look at the readings this is actually not average, so it's a bit
> > > > misleading.
> > > what is your suggestion for that label here ?
> > Since this is a stable ABI, let's first make sure that we can actually
> > change output string. If we can, then something like vram_high or
> > vram_peak would be more appropriate.
> > 
> > Note: This is different from _max attribute which signifies the limit.
> > 
> > Raag
> 
> 1. Actually, this label change can be a separate patch.
> 
> 2. We are modifying label here, ABI still remains same, so this should be
> okay
> 
> vram_peak seems apt, as it the current max value of all vrams
> 
> Rodrigo, can you also share your comments on this ?

I'd say we can keep it as 'vram' only... like the last version of this
patch is doing. I see no reason to modify it.

And if some tool out there is already relying on these strings, it
might break. So, better to keep and avoid changing it.

> 
> > 
> > > > >    		else if (channel == CHANNEL_MCTRL)
> > > > >    			*str = "mctrl";
> > > > >    		else if (channel == CHANNEL_PCIE)
> > > > >    			*str = "pcie";
> > > > > +		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
> > > > > +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
> > > > >    		return 0;
> > > > >    	case hwmon_power:
> > > > >    	case hwmon_energy:
> > > > > -- 
> > > > > 2.25.1
> > > > > 
