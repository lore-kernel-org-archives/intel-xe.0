Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85129109E54B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 05:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407A510E94A;
	Thu, 26 Mar 2026 05:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8gkd1SM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBADD10E957
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 05:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774504303; x=1806040303;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gygoToarro2LeFZ3akTUqJmSD9UbdBmvo02hWFxc0TI=;
 b=k8gkd1SMVb8h26tu/sGYnw7b/lWoZn2+LvBAHRetnmKRKCKsa/oqreqX
 BTih2+BMltMrKST9Md+rbi86hpPk3o47RvrIChQoROtH1AHE3ABNgTGBl
 iu1W2AS9/AKZfKIyydh9+BXCXin1Qnq4yTHPiq072UkEQ1rfPXhrWXYP1
 2JD7LY4QvafiKBCOxoZWIZXBhOWXs2CNmC2zgrfdNoWg7TWt8svumuQc+
 PxIeViUYfGUMSDcw8+25it+uYKqWxu6WU3SpiRcSAftgjn9HTnpcIFAO/
 bnkAzyKmS5W4WyDlK3mAJyLwtZaqrxuDAYpM6migMfAGfMRX8vJchYnGW Q==;
X-CSE-ConnectionGUID: yHyXT2MZReCAMyIjK+MNSA==
X-CSE-MsgGUID: mmdi1KzMSI6woN1BLu2SGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74734930"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="74734930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:51:42 -0700
X-CSE-ConnectionGUID: IPPj32BDS1Co9U8KlkRZ8g==
X-CSE-MsgGUID: 5zf7GfVNTy6J+qs9tFJLaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="228973087"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:51:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 22:51:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 22:51:36 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 22:51:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es5SX05YPNxlcz7ILwPJgRF2W1hSWDbIWd9EPd60z1CnwBm9Mu6aUXursG+o2V9OkWkSmnW0ryJhgDMjxx3mbMBAhkNV2jRjshyFTiH5Nw1bPHxJC/AmEtXMF9rAc0OZ5TD2cx6BKGVR9zybaLtqvNW0eiD+LdEG+q9rXuZKmx6fwNjQ8bp3iBhovPdHyhftjCd37iwmDeGLqNs5zEoC5Zqj+ndw1ad3ugd3sc5usbleoVMDmS4gkwYaB5wIlqfcxEpZYx7sYTDF0gYm1nEctEKVkBNGGzH309waHvLznQy24TkNVWldRdxyd6jOmk+399mqfJjsFAEYgB3yMLBigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW7zRGK2LwNSJe8FwVJ+01HoF6Qt6jNUx8KwlxBnGQU=;
 b=CQzCjvVOF8W3RiyNwmumkb6Sx/ggjD7s7fSafPkyTWoGyWddNM3YwA3h9NINq21uCg7P8dV4a1UhHewdTT0yucwf8Dd1AwrTcfrl5etR01C8qKfEumdPLuSuLTwAjmFHr3ia8xZtEoDIYwuBnU7fa4v3Lw0fwkC5uL1HwouwzHpH3YV58ZSNUmwOW6QKtcptrHBGK9/oxpinnZ/yFKdPBcany4z1YD4rlKjh7HzQzkASOzR05rbt9/tOHYkK47e0w/gW+4iomwKERe88lFejlbmwT3Phw0DJABTLLsOFvOZ6ywTqKhmokfdlCaPI0cnXmy6CIJbuclPLvsYyOKPYNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 05:51:32 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 05:51:32 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Issue GGTT invalidation under lock in
 ggtt_node_remove
Thread-Topic: [PATCH] drm/xe: Issue GGTT invalidation under lock in
 ggtt_node_remove
Thread-Index: AQHcvL2jhAaIOJwlQU+6YHxmjbkhyrXATtmQ
Date: Thu, 26 Mar 2026 05:51:32 +0000
Message-ID: <IA1PR11MB6266431DF332E63D66EA6D6DE256A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260326011207.62373-1-matthew.brost@intel.com>
In-Reply-To: <20260326011207.62373-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|LV8PR11MB8697:EE_
x-ms-office365-filtering-correlation-id: d01594a3-9dbb-4c4f-fde0-08de8afbbb8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: CO7MZRu1bqMX1heqTSV1BCulBY1U2f0imuwbWEN0u/kKmjod6HCnZ4OEDhElAXU2n4BE89+X3ZNN3u1c/PpHNR/2+TIRffxXVWkJbyKNpoxtvh1RJRDsZcWJqt9UJur8uVWz0f2/e5Z1lqvHe9/0dSLYo43qINwZqu34V2ub6IWcJarto48y6Un085vdmMjt7lOP7iLPkLofSW/4Z+i3b+KLgCZKgIqJDbSDWlFX1q3Vtj4z47R7SHmYDYktO4Vd5hIUd9UnfXT+dVKV7WLrmOlfDsM/SXEWdbRdnxUHqCksikTGxa1nb7QN7YvKlqscOdY0uNHUlBBayirun7KjVodiOmjJVDovR+Yp84XVYtrIKXNlvjC4cwq5lZL/FoWJGOtlryCqkGKnquNhSWMNup/AHYNbD/hOylAMeSPyDjX4iqHWxIdF9HvIJocrSceNi9Im7j46Y3Wq39fqxd1Q0hwnjtc8ZKsvP4n3tMs+Map3gsxmVI72kRDxdeR1nP/FNfmA/BkHSlglnuOOb0FrqWkJSmKtcHE2KqC5vJMxRdyI6pmtqg9UGo4Nme6k3eflEis+7x7PywXJDhcbnnl92tG3xfQX8p4dMUFK9oZ4MIR/I2RFPBBi8WA4p1IBxYsGGK+t2al0rdOVjnfev3m8x3rHvcNZm5Xf3iuHZoSJkekrbCdlQ9kmjxNr0FRCFJX3PR9Sbm3gKS8+c7LjSrrOHA03sKGT/bWLFrKJZjW5bhBzDQ/sftvFduVX7SgumjoCQFEbenRN3SMs3qlEVdNr7RwQsSF/vrjSUrqmRbixqU8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y9K3sfvCLu/+CjmA9zLkE1pUtwuEG/a0dkc9lShBCRRC5flMX35XJeKDgptJ?=
 =?us-ascii?Q?DXd0GxhERKfS2i7uoevYh70k4fDo8sSu3RDlunKqBMnv1c0FGzupoarQoiOL?=
 =?us-ascii?Q?Z2mqrKSnUDxLAqzZxO8VMVdbSlPmQ7HX4vbrgfFaeGIVIcBnnMwqhtYeknld?=
 =?us-ascii?Q?DkgsfTvUPB3w+rCipx/3PYGrJJLXHJjmIzzkVyiPx+IN6DWE3bhycy3AnKho?=
 =?us-ascii?Q?5LuWf6MQEOQNlu8NlvZkzfFh7qGTpnq3sfg42U8iW808YTkKFlX2VOzmAJvE?=
 =?us-ascii?Q?eWKcfxEcBx8cW6dgRlISCnFlZL60TU/YJv/7EVyqprgDmTPd+nhuSH/Nm9C1?=
 =?us-ascii?Q?os56jJ6HiwMvpO1EQEwrLcRz7CWB2kmHD7xDPA0mCUpQFeyzYMed5+dmGaL8?=
 =?us-ascii?Q?Tb+GI5KAgHL3aWAOgS8cjLzF7F4oyfRL27iwpp56IYvhH/wmkptYQRXeDeEY?=
 =?us-ascii?Q?JlASVYy2NcvUd/BH7SDAdu4IhZIfYn/4HAVpGRkrDqHjYkxAn0efSBOhUO+f?=
 =?us-ascii?Q?BtJfB5SxfUl3YICSvI3f24wXVn195sMXr9ckH42vTML1km0IdHXAumVSjAxJ?=
 =?us-ascii?Q?CYJ4BD6ynSzWQpyCcU50+Ec5+wG4tgnZBN0mlZS2xWCHShZS/AozqmNnngu2?=
 =?us-ascii?Q?i5dL0qpYYvSw3jfzkyLXmJkzFGfeHEjgU8pgTt8cVEddA0WpvjRkdrL9v6rT?=
 =?us-ascii?Q?K0EhFWqxxo0hEfBU4qp+ljmZSM+8dfeDsaAeR7FdTmptO24sNT95V4aZxEX6?=
 =?us-ascii?Q?J376ZaILfU7ju6oaMrVTJmZ5aO7+X5/2t8HlJpc9Tn3Jo12x2IgXe0K7cheW?=
 =?us-ascii?Q?XxjGgUyMsWKFu8QBCSYVfLP3dswy80CH+JZhvFwIWrhC1TlGKmxH6njKGxS6?=
 =?us-ascii?Q?/ouVMyumpAbVRlrMbx0qH6zoIZFmZXEZ5HKYE37Fo9vlbIjIcqKztMQm/T/H?=
 =?us-ascii?Q?m8smABzo4mknSZRXPcSBMXQ7mS2u6R9rjQ9dcsZA8ZFhzWdhLskBGn324XDd?=
 =?us-ascii?Q?rDJ9TdyUdVkMReh1xwaUb9j8pR8g014yLmBmebS3eGUSk3PTjwYFKr69L7Ps?=
 =?us-ascii?Q?kZ6rZ7BIuWQx5Qr0i7sP9OI1O2MMyJrP+4+NIlLbGv554Em+2XCuRcP37RBw?=
 =?us-ascii?Q?0GLRAx4Uv0u8w/eyoQxD/gGl9E4xZWNv/YYsOC9pt/UJr5LLjrft2Zwsh8hH?=
 =?us-ascii?Q?gB0+pzJ8E8PzxUQAlKvFvW6+hS0jTqnd6zHzZ8hVUw1NX0m1RRR0E5bkhIr7?=
 =?us-ascii?Q?gxid8gzC/HmSMzaKlJWXLq14p/M2nB9CRc66XMD52XkX56PDtWM/w3UgSHao?=
 =?us-ascii?Q?xQ6E7pem8+CRwRJ1ZiworMSNFmPZ4wWVNi+fScmw/czTpOIF5nXJeqdBm3kX?=
 =?us-ascii?Q?SwREQUMPjW8ewl2xNe1mN++fIxoMp1CR2Ek6hSwx50NcujqMGE29PLkiJtbf?=
 =?us-ascii?Q?BdaWq0F8afmkOvzg7IhVAOWx1T1KAGZ9VnRn7Gse5GEhMQmNCATGWAykV1v7?=
 =?us-ascii?Q?G48xhgQjlqPr8DqVUbtHUr95Z2nrIZ3Wn2EiQluNr/DVbaCtvs8K5Jg+lyMW?=
 =?us-ascii?Q?l7ysPH/sJuxG423tRYk7etQ6l4+xiC6814/poqie1XJcbtQ2cuderlRXtDiU?=
 =?us-ascii?Q?9znfn+k2zHW4taz4Bi3dA88mT/5kg4UGtihXQ/Y+SMOsit0r8i7+UtNbeVO/?=
 =?us-ascii?Q?t3hMPK/BKcfuWI8VnALIHlWMTgL/9FKZi+JJxAu8l73dEO5dEClFy19Zi+Gh?=
 =?us-ascii?Q?pswIuCoZ1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bJjzW95dYyZdt0MQMEcrmAnOWYi6BS4BpimMbvm/iHeXiIxilFZ6HmUYnwGeR0nWiC7wnhoB9wiJSWLrBEm9TwKtn3ciTmQKh6M8JunIPPAAL5sVAQDWAcPMAU5JdMb5qNnhgh+0sTbatET6R5iS2leCYUoFIKdpp3x11AtPc3sC1lmfQ0BB3mmP63qBjhkUq3y279acHeKXErStLsWZdbPdaZWignDi5hx2STLQG9BX+CadVI07EtpMJiZEH0AFfwGuLzEo7VrBUG3UjGUsXeMBEF0Rmi1bOBOmNJL879+M7uz8nsd3XOnK0m/wMJDom9OA2yofucafZro6GxVgSg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01594a3-9dbb-4c4f-fde0-08de8afbbb8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 05:51:32.0767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4loBZmc67iVtFMLNRy5ngNNlNWEugwWN0W0lIGMwZATqoaLzYJ6avBOjH2OlhRr0NSCsP+g6mFxpFOMtPs02soRm9EmgjTGojyZtX2T1tI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8697
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Thursday, March 26, 2026 6:42 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH] drm/xe: Issue GGTT invalidation under lock in
> ggtt_node_remove
>=20
> Async work (e.g., GuC queue teardowns) can call ggtt_node_remove, so the
> operation must be performed under the GGTT lock to ensure the GGTT online
> check remains stable. GGTT insertion and removal are heavyweight operatio=
ns
> (e.g., queue create/destroy), so the additional serialization cost is neg=
ligible
> compared to ensuring correctness.
>=20
> Fixes: 4f3a998a173b ("drm/xe: Open-code GGTT MMIO access protection")
> Signed-by: Matthew Brost <matthew.brost@intel.com>

HI, please take care of nitpick here "Signed-off-by" before merging.

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 21071b64b09d..a848d1a41b9b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -481,15 +481,10 @@ static void ggtt_node_remove(struct xe_ggtt_node
> *node)
>  		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node),
> xe_ggtt_node_size(node));
>  	drm_mm_remove_node(&node->base);
>  	node->base.size =3D 0;
> -	mutex_unlock(&ggtt->lock);
> -
> -	if (!bound)
> -		goto free_node;
> -
> -	if (node->invalidate_on_remove)
> +	if (bound && node->invalidate_on_remove)
>  		xe_ggtt_invalidate(ggtt);
> +	mutex_unlock(&ggtt->lock);


This looks good to me,

Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Dnyaneshwar
>=20
> -free_node:
>  	ggtt_node_fini(node);
>  }
>=20
> --
> 2.34.1

