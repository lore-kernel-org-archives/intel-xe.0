Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBEFEB3640
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 23:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130B110E5E0;
	Mon,  2 Mar 2026 23:19:19 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C81710E614
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 23:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772493553; x=1804029553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=14btSMC0B6YvOPUIdnHZXMh8qm2olZ3kEe1M+gukjkc=;
 b=dnlOtIgMPz+PPsRG/f2Q3CVtbQ8Y7MJY9mlG2ZJ95C/BjaoSr4wnW1Bb
 O6shdYNGDATwuGCRkwuJhRRs7eCRaArYHzO4zsuNHvp/tXnsiV9O6wcXu
 eAtmtSUiNwHFlgz3pUpb+tCzejUY7n+hwjFtKMKQyJoNazoYAi8AtYron
 qGB91oM4YH0cZBgp3ti9l9NeNzqCEC4yc0OD9dO0j3VoW7Q0miMgGYZa+
 8ea/7N85Qc8LYree1dPX/+7B9ObUPunJCLLXYz62NbC3z5ggPzwVpyTLF
 7AnFNRUWYoase7q2Os144tyt3yL1L2bzNquCQA4xX0Y61FgGVQyMPC6bR w==;
X-CSE-ConnectionGUID: nPXKYFdYSzCjcNfJqPNtfw==
X-CSE-MsgGUID: j6CLBRJ5RFqVIFPn2HrDJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73584024"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73584024"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 15:19:03 -0800
X-CSE-ConnectionGUID: 0MQ8QzkcRn6gvGxoK3I5OQ==
X-CSE-MsgGUID: A2Kh/Q1vT56MTmLLo4Lv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="244775185"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 15:19:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 15:19:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 15:19:02 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 15:19:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqp7169oEVyNETUziD4WCb5gEt5Ma4/Lody6b8Crh7zNtrQZKk1ZeME8QlPOLqccxpculVyymlz5BoMcgb+unX4stRrZB/lQIZduO6E4X7L80EIR1pskxj9gMiqWN5j8uND0tOpvRPpBSSXjrjw58Ba7e9K+/bQiBCJ5QlKH9z5IFohZNac2IWoM0eDpliejphLu/SkK9srnmIOyD/Mtok3jZ+GUUgzPnZ09y66zVBZat/Nm+aaAClIEMwKq9A0tPGvnbZSvc3tzJ6AuhLMKIPT0tYpicdT7yDgvAGjX3MApdFVbpVJaDTboZnFWHXmt4tP0FlokS00hdUV38iliKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZo6NEltHOko/Y8j4/sNf4yRaCK3JjZNQoBZhCwnrFI=;
 b=VHDwlKos/JlS6yxNwaWH3k/1DYAa1SCo8+KCl5cm8glB1jU4+0BI1SnusHUTzFtN0xuatBG1WYaGd0iiGgWUbM1OrPy9oWw3i35hJvjX30oALHfYXPqXyiqOOkiiQzZcBS4walBj32i9QRkZ/7v/uhdNBPu7jUPGbsGCjUuAgNA2kYAytofWeyR8g4/bX8sP73xrQ6PayC9o1T1z8cwLRMsAdgS855OiGEOebuFmZ7J9FXgfHjqKDr2mnzhGbu3QzwWX8hQmj8ekdCmGHcP9O6+U+RsTg4w1OYN0H118mfmVgpg/rNj7yaFCFIY8gp+8YcJipmI/K1Xop3gmyKIkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MW6PR11MB8337.namprd11.prod.outlook.com (2603:10b6:303:248::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 23:18:45 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 23:18:45 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH] drm/xe/multi_queue: Fix error path skipping group xa
 cleanup
Thread-Topic: [PATCH] drm/xe/multi_queue: Fix error path skipping group xa
 cleanup
Thread-Index: AQHcqosme4/qWzO6iUKzHP1hcvkQPrWb3jaAgAAB53A=
Date: Mon, 2 Mar 2026 23:18:45 +0000
Message-ID: <DM4PR11MB545696D4C17DDC3667091635EA7EA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260302212447.208218-1-shuicheng.lin@intel.com>
 <aaYYtVox5lyayXH6@lstrano-desk.jf.intel.com>
In-Reply-To: <aaYYtVox5lyayXH6@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MW6PR11MB8337:EE_
x-ms-office365-filtering-correlation-id: c5e9f366-d06a-4f5b-cef3-08de78b20d50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: N/CGV2rylqMeMffEaoh6bim0WAoqf/Cm375LkboHIOZ2HTBjBEX/AH+kY9V28QqGXdhG7IaY9H3iFpBRC0jcga0hgYAF27JgXMhKVNEBqYWpPPqKmHI+SaTLx6sc8BHeEIpPUh3r11gq8+H4af3gbGU69lIycN80yxdd5upo1Iwbcdb/mJp2LSK3gD+UBiOD3IZKrxh8dIydZc2jmzglcMRFiD8Y+z0C2qAFbdyjCuBhl8wM/bu51rsMALJRsveokcrkMso/nk3DcrV33FAS7qLnWJR7WP0vXQj5ZId2wxNy09f1kOsG2GR9EDmBTTahG4WYxOR4xI39HXGWPOH3X/n+nPvi41JIG3BBtTc/dAEHL0zG6U22Yy85PjnVZ3SlJyE7nZGbBCfJ0D7ZbGgD+FHJcqmNKnPTEr5IBMa/BnT0D4AQKyw3Z8gVLTdhKyyaojts25r3nk9dA7EalTPyOR77K30yHgWz092g/bN0EBcwbmvCFoRKzVdiGe37ia6vf/ZsqUGAtSjgchIs5EChKT2f+YbNj6YF6jiYoO5genCrDHMAJHicno6+GGzAn0RD0RyWoqWYK3Vv+a5K9tHiRZx7yV4Cj5mgwIRzkW4GuzrV6LyZv0A627n+BtD9E+wFXry8fJ5ZbdGYSjQ6JdJVZ1BAWJVfB8Wm7L/o3O9NhyhdExS4ApQafusXNxde/wk7CfaMg4reWqnSKYAxH3hydIR6GmZ6+JTy3A6bh8bfibQQTF3p7EWUjPOKy14drQFecII6I62kJvqwBqXP6zzX/8JA9p1OhZoOT9/QWORUVyc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AHAySKrIZgMR2qsjawsy5I7SX+r7/I4CVzJBhgpFTWBHaRIWm+JxCagkJmii?=
 =?us-ascii?Q?wZ7PrREJjWGUf5RAGDR24WMrcwAMoEstKdSyPJHz1NBCxnFijE7tPvd3aO43?=
 =?us-ascii?Q?Jf2s4lA2AYhli6UAX7bVPaG2Ifc356rReg+vZ1r1H0sN0mfxi4qvejVtnBRu?=
 =?us-ascii?Q?ZMnQmpi8SeDA0v13rCrBOU04FWEDPHUOQY3PvIBDaydXeCKBfeEqbg466PDu?=
 =?us-ascii?Q?oXGkt2dhLdkkuOJ1VCEbzf4SJIbcF1W0bAniOn/pQBEXE7kgA9owNyA8a9+U?=
 =?us-ascii?Q?PkD/0/5AH58A4A70rrUOANTVVjewCnvdDdZpV9trO7L/c1dSjApvtc8p6XyE?=
 =?us-ascii?Q?yXTzgvq+b80xvnjMoIvjy6etfoeyXWqjx2/TbmWH7FWen0rL56VH3szlL0UV?=
 =?us-ascii?Q?QcGRevTX4uMVtjcFnIS8eCkJqwgofAKQf1dyl+k4HeyU8sf62eZP/mFuV0rO?=
 =?us-ascii?Q?j1IsF3X7BWmBT5Wsolj6D/ph6FD+mgMJJfxpLqz7keWkbTMcK64bRBUhcVei?=
 =?us-ascii?Q?Jry2s0OwD6ODhL7FICHaevB3+c+dE5WsIBf+J51Fapa6cHibKh2aJ+ABDLQc?=
 =?us-ascii?Q?Z6pWjJ7ku/+HFHhAVbo/TF6oqdjswU9OE3+GngqHhj/S8z2Awg8shnbL2jEz?=
 =?us-ascii?Q?b7twSNrMCIqTnlrIE/dc/Q4rDUvyVOEm4Ti28X0OkaYT/+MBxmcF0ATNcaf1?=
 =?us-ascii?Q?p04biDqnZDu2p3CXqNlGrcOWbdqMHNZFhRbHZy+3GhXzw4v6U89vseAN4Nwi?=
 =?us-ascii?Q?59yKEVGloTX84rL9lCVaFTTdSpFZVBTywYtyspPgGmJvJdtj1UcRIOC9OQ9y?=
 =?us-ascii?Q?5xmlF7xiRUGT3xDz+dSIoaGDJb3iQcYJ+ordoQ9cWCr8PTF9sYf/Cx9JtAJo?=
 =?us-ascii?Q?REUh6N9pOFavlQqq8CLaiOUUQqqRz32beLl44yMJBnTKS5ss0mR7Q21FDq3g?=
 =?us-ascii?Q?Ew69N2jmuE2tsDEHk8rHpIqd2shWfI8af+7oKsWUbrm90jUYq7FTE8lBs2Cb?=
 =?us-ascii?Q?PKvphWHqwvgCtjh+h5VqNapl0ykOpu03BNtLUnd/UqWL+ksmrUe31k9LBUew?=
 =?us-ascii?Q?tGjJ1RW+5gNQkqc6z5D7rUoNMzeEYbAoxyALTrd/ivfgR0W7fR2IAQZ78Fv4?=
 =?us-ascii?Q?DS9/u0hYNpeuwwBKqKVEynU0zQyJO9CuxjMP80oCIklH0RRRtbzugFnZtksS?=
 =?us-ascii?Q?O6q1s4MxMHCurZsm0RHfAwmg8MSIVAhCVpvDk3T7NdyQtCvanBj7QWQANtzL?=
 =?us-ascii?Q?/wvjGwS+2vitY+ltfBpDbgO7jEjGHnoOwBYl3g7grGPa/aDAPzILGNW/KzEL?=
 =?us-ascii?Q?829kR4gjWbhBsPbd/2D0BIGDcDnF5wlk7Dw/ScdWaY4sLHCHsmMRRDbrb+XO?=
 =?us-ascii?Q?V/TgaBLGL5IV6EAhxmtHXeqIi7OcmVJizLcdn/ijdVBRRH3dkAYfV2i05zdx?=
 =?us-ascii?Q?DCkAKXDnaEAxJd1EWmIXppIPqdxcjHH0KQVoI4aZo03q+fnxelma1B3miaaU?=
 =?us-ascii?Q?sL3fcK7owq6VxbwDg+WqnFAvy8Tk/SEMcEA6AZ/C95fxV4XcrQa/A0coLIlK?=
 =?us-ascii?Q?6t7Mo5gW5JYGYv9Dwo6JUfLivRQBf5O9smpkoln4zCMSxSjIbNMWmpKHAyDk?=
 =?us-ascii?Q?oq66sqdfWgLjfKq8bAskNu6TXJXyjqaTsvTjOuaI4WpLxp3U6QoGq563opu3?=
 =?us-ascii?Q?QMNhosn0aFAttrhZ3eRCe9SPVDqOC5KoSbBcDFXGlyfrCE+nU3rdhWxWsZXk?=
 =?us-ascii?Q?tOS8CFjRUg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e9f366-d06a-4f5b-cef3-08de78b20d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 23:18:45.5716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3BvJpIycn3/A9g4oQYVTJQZbSsDcTPdRe3wwbnvdF0CY1PcTBzsU0ZjZs/8qyfXifs/WapVpSyfkyPEJKLDv9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8337
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

On Mon, Mar 2, 2026 3:10 PM Matthew Brost wrote:
> On Mon, Mar 02, 2026 at 09:24:47PM +0000, Shuicheng Lin wrote:
> > When xe_hw_engine_group_add_exec_queue() fails for a secondary
> > multi-queue queue, the error path jumped directly to put_exec_queue,
> > bypassing the delete_queue_group label.  This left the LRC reference
> > inserted by xe_exec_queue_group_add() sitting in the group's xarray
> > until the primary queue is eventually destroyed.
> >
> > Jump to delete_queue_group instead so that
> > xe_exec_queue_group_delete() is called and the xarray entry is properly
> removed.
> >
> > Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi
> > queue support")
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> >
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 1a7a4a37bbc6..fbe3ac399cae 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -1298,7 +1298,7 @@ int xe_exec_queue_create_ioctl(struct
> drm_device *dev, void *data,
> >  		if (q->vm && q->hwe->hw_engine_group) {
> >  			err =3D xe_hw_engine_group_add_exec_queue(q->hwe-
> >hw_engine_group, q);
> >  			if (err)
> > -				goto put_exec_queue;
> > +				goto delete_queue_group;
>=20
> This entire killup is questionable at best but the label you want here is
> 'kill_exec_queue' as that step will undo the
> 'xe_vm_add_compute_exec_queue' step.

You are right. I missed it. Let me update the patch.
Thanks.

Shuicheng

>=20
> Matt
>=20
> >  		}
> >  	}
> >
> > --
> > 2.34.1
> >
