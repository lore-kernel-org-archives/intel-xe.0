Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9830ECAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 10:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC5810E3DD;
	Mon, 29 Sep 2025 10:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLjLzhdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E29810E3DD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759141153; x=1790677153;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pr+LkgBmXj82PgE4ybotL7Y+CaCI4aUxqZN/PPHpMr8=;
 b=BLjLzhdbaH0CPGl6oKSLQU8n+z0TX+nxDu+KPZt88Bar5T9aelchjLjc
 taHHcS/rEQ95A74w173tpietdN0kZLuy2OkYXPe+t7Yij5UVdvXT2ieL9
 X5Nqi/qC1aJyzy0gjGr+p2RtcbZ4uWRjEcGoSPf78k98JO8S9tGz5QEFN
 +q7pVTLQLNCYk2Jd0iIQmFcxyKGVQeud3cssCEkaEshWuBYRhhRL8nFF6
 X+mRoHwj1Ae74h5WnrssTwz9S+mrwHVXVQVWsUQCj43zCbGZ4IBK5bNTQ
 YmYly5w0aVzz/JlDJ9sBl1+LzhC4jI0dPW3saW8fJdxBj2DO3CkC/zS/y g==;
X-CSE-ConnectionGUID: mcPa/wRcTyW7rUBjduw7lQ==
X-CSE-MsgGUID: HW3nOUdUTpqnZYl+sGytcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61425220"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61425220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:19:13 -0700
X-CSE-ConnectionGUID: 9R2H9Wq7Q7uL0PRX8pSFrg==
X-CSE-MsgGUID: /Tfwn/rKR0m5HrJCWOqZJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="182489322"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:19:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:19:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 03:19:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:19:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOAmNF53qzwj3+NMPS/5W6x7xEwpWU44PRl7iIaFcVglObispdFil/3DvALICObSTHNJlwMQQHb5G1ZJsAj65uj34cQ1aiDDgjbQa8Ou88BGgEY4iUnsBcmGM/K3qAvMgAGWQmT74wf2uyb06xXzWwjpSD66puxf9CEDVcu7YFk1uI+r3FDh99Vag59bTHcezi5NK+Avy345YovA/ahwL1k+QG5EscmucLdIiStNQctOvtjgPJH5EqkaJEaI0g00yHHawMo9NHLw2T8gPeI70Q1b615pRZn47qMRGKKuNN0onhd8H3JvHpQK5lu8H7/qXyL+1+dXk0wV4qbFYK7KBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1qlKSpkRRLzKRWaTxbktuGlmoLMZhoKMsXWgyr8x2Q=;
 b=WBOYaexQoGGBrTwBiZS5qxWjosAUTZHkS/taa9r7yleseBh0is6SOeucawOMdv2do0pXcN+VvXtCv0vBC43/R1OykNP6XetSMniBzaUSeFpp94PttyLyrtUw4Z95zw0i/wAYehhpFl0IPmV94GehSr4X1Z5SGQb/DD+5aQ/j96sMForlTDvH52mnSOHzkkbYw2xPaLLAOMm29C03WtyPS7+vl+ONpTAOZrCDja1x2Tm6HXHzFfRTmMKf1WqiamhD/LiKoPc93afnEOejKxXKKhec9sBslPe8KptcQClbMITXlY8KpJ20xIHEqn+wy6A82ir1PsYJljhVoDmjNa0GHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH3PPFF2B8F6C64.namprd11.prod.outlook.com (2603:10b6:518:1::d60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Mon, 29 Sep
 2025 10:19:06 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 10:19:06 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar G, Naresh" <naresh.kumar.g@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Gupta, Varun" <varun.gupta@intel.com>
Subject: RE: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Thread-Topic: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV
 VF Provisioning
Thread-Index: AQHcMRzWQAEy2icp+UGT6h91nIX5l7Sp8ojw
Date: Mon, 29 Sep 2025 10:19:06 +0000
Message-ID: <SJ1PR11MB62046A0C0AEEB73DC2504822811BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250929083613.644931-2-naresh.kumar.g@intel.com>
In-Reply-To: <20250929083613.644931-2-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH3PPFF2B8F6C64:EE_
x-ms-office365-filtering-correlation-id: fa27a22b-011c-4549-0cf0-08ddff419f28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6flTNgEhbVrxCulsTdnS0L0gJsEad0oIhQl69Q8IvT8bCysKeBhqQzuhBoED?=
 =?us-ascii?Q?R5ioOSeOLxVwHaOxyfzcB9Di9WkalJT8OrqWhOig8UZoNfvVkC5XNXcrBDMx?=
 =?us-ascii?Q?GESnzhGck93lXLpNi0GBamlytGGqaFiXcDLIHAE1UJ7lgCEjDniUT8i8NWq3?=
 =?us-ascii?Q?g3Q4HpRw/CCbh1TPZEZm5fUbk80JYG2eRNojApxtKHp3wC3P7J7BCNOPSDf3?=
 =?us-ascii?Q?85/emU2gpIfHbWBoGpZXNn7LY1D+/n1SqZLhlSOpjBCac61n164T4MqpYX3t?=
 =?us-ascii?Q?/IpHtQ4YYjcMKRTSPziWtK9xqraylMChQXQZ21Q4vfqrjzg6a46AjYYRc6JU?=
 =?us-ascii?Q?jzc6u+ScaP36J0NjM0OJyUbOrh14V91p2DwviW2fHryETAfyvLmuhg3Cfgw3?=
 =?us-ascii?Q?rHgo8DNsgrpHq/f4I6Uy9Euw/QIc7R4QgBbJufmt0ocfMQGfkGptDz0qEGWU?=
 =?us-ascii?Q?d0EoB6AcNXw9hV0VFLq7WbXdO777XbhFI4NcSK5ZwuWUPbRlQFZ1W8B+Av56?=
 =?us-ascii?Q?lL7ueJqxxQ2NWjhak7EaD6gPCPQj0bYxjZXQAGQ0mlJj5DC923HPMxFlAho4?=
 =?us-ascii?Q?jCp0EKeg09wKYPmNlCA96UuHq3DS3MVWsBRHKPx5B1EKsWQPfG9C6WB9DTkR?=
 =?us-ascii?Q?Z2HNF69WOUYGUnq2afZyV2idOAbVcPJnc9m26Kx24lE14EwlbVjFkPLATUyV?=
 =?us-ascii?Q?guWZXlOzi3gxYv5t2b+6ntYUZ3CKOiugKEAqjXVnKlYER3eXnMWKIWm+tWCA?=
 =?us-ascii?Q?TGX6ihnH5X2ayYS3D+bXKYk36Utvi1CILwDJq9ozUiUiK66UawiYzwFUQnJt?=
 =?us-ascii?Q?5+yUCqeTJV1WfuAbVmc4NXI0L/1GoIMKVT9OzvY74cz4gTO/Os7DalGLOvgO?=
 =?us-ascii?Q?k6e9kn3H45CJBQ4xY+mXRSw8hun6b+qzEjW7qpAVukSEg5W5KnGxEuUbsRXQ?=
 =?us-ascii?Q?lIqXochaSYeSePl5tHlp/uckwBvzgFH+hqQBLDEVcANKebYpb+OwD8lYhMqW?=
 =?us-ascii?Q?/PkbjsktcGt7ZEO4zQ9LMKGoDJ6DSy8UEG7M5npfCxz7ATXRicIxKyq+Jfv3?=
 =?us-ascii?Q?V2vYXUZdTyisumaujfCoSkvsfQ913CmBfsrKLF/qMFkJU6V8dXwE10s6c4Yw?=
 =?us-ascii?Q?dS4w9FPDP0q1rOuXJGhgIgUcgigfRygUpUKVuStfaKBwsft2VcRJqpXCqUkg?=
 =?us-ascii?Q?U/NGOj+8mIokh3Ycyj20zrcrQhzXxowMXwEie9ynOO7+uSO9uP3tsSYHoRQO?=
 =?us-ascii?Q?NsJQuF7kvMnsT//lVmVYaQbYQ+vM6+N37j8lFQzOGlj2FffCfo9k5/YeMCCU?=
 =?us-ascii?Q?+53PGoq9iv7VE3SQkXzSs9FessU7fsiKWMhvJDe7OXjKpEEqEPTh+dKqcsrx?=
 =?us-ascii?Q?OkdGNpMH4SV3Za4s4CbWblscQPnBwmRslnWYfUXiDew1y0erYpq+6Zw5TntT?=
 =?us-ascii?Q?v+fhNeh/ZOmHwzZVXkiV4tQ4V0/EfD+XtvkdYPkVSWaxzbxwn5bru2TG43Yg?=
 =?us-ascii?Q?K40EhsC5ZqIZYNdydr/M4mPZQx0I5x2/Jpah?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mh8JZgGq7iILY243YlbZexnoEMBSt2b1X0g+58wH3rq302UQQ8kwfrhFDWCr?=
 =?us-ascii?Q?6z1dbMNuwsSsCQHRuO+YcGSRBrn1kfaGXh1A7fMEOu09yA/sPabTx8Ap2FmI?=
 =?us-ascii?Q?EBrT49DrcMvUIUN2TjiLLz0NhzyOn1BkC/fWn+mhRwjNPY2v4XbKU8Orj38+?=
 =?us-ascii?Q?MkkFbjOVpABSogCEHcPI56lPAKqBMixDt8k6/e7DopUWJzM8rFjI/KNi9iin?=
 =?us-ascii?Q?hf7k6AOXHAFQOOWxsJULuk+amUSU378X33OaJwVvQ2qxlgYQNFpzCgaz/Nje?=
 =?us-ascii?Q?3IOaogRacQt1OwSSaM79XQ6Mx3bDAqF2LGtmcxBxquOotMRqIjRNXBX7W5rY?=
 =?us-ascii?Q?ZRkKmc+q9a8ojeu7eZh2TnQT4Jg7ioR36e6vUw5nQto6yQdCmPPwOrGdhueH?=
 =?us-ascii?Q?xCfxn5/oBFd2oWqpd49Y/uY42LfUcEaWi8Lddye21qibnLqts3ciTgUqRtrD?=
 =?us-ascii?Q?Rz9J1u/Jf8gtOde6haeIomysmuFDBpwkRzlK4AtiBoDhOFlBUdrmzyU0XiZ6?=
 =?us-ascii?Q?1d9svgyh0sWOETPhQZuMrWSdwYV3EEFTBJdjSSTN7gHV2YKDLtL+KrWSGLSO?=
 =?us-ascii?Q?lk/0AJm+CBLBd6Mp7ud7XryUsBhOJymKO/q1ZQvKFhCT714bMHJsGcNBTmAz?=
 =?us-ascii?Q?yW8LwaKvOIlrWjdiJz6XUK+6kKfc6Ry4VCu1suCIRvBgW5bEwYV4Ww9Gtgvk?=
 =?us-ascii?Q?WnLiFrJMdZ4EgnvOvQ+c7k5TWM7Lh2VcMHg1mh3sQATqgnu2djnd3R0YFqRv?=
 =?us-ascii?Q?VMoFS91KkQIokKeFAjxcom+i0SHvdGJp5x45AhC9DBwvcVWPZ3N5RmJ/o1Zw?=
 =?us-ascii?Q?YyA3EpcWp5oXP4I+X4mnphqTzR8SH6dBxUnLtANQjhZnu+i4+JCsHV9LRpBz?=
 =?us-ascii?Q?v/WPdZ3u0brao6b7uUWwPIEwsn2ogBqoegFwwDDQIWgCw66GnudWk1dqHSfh?=
 =?us-ascii?Q?cvfK76O2f2QptEJerqWPORpfVevHEF84pP1Ly4QXWsJg9vberLvdvFgcydb9?=
 =?us-ascii?Q?18e5ILIrHxj6RM2DHtKlP+3IXedestIRAf7fu478P8kVoIOhdFC1erOCF/LR?=
 =?us-ascii?Q?0MwxVDVhcmc63ckMrwTEMtxSddkszEcJBDZ6n/84mniW8ZfXJqkmuK00q3Rs?=
 =?us-ascii?Q?GUWspZviJFUWuJNZBh1iT7uiIuvdyDQ5qxxYZBRJtyaCjcuoz57sEx2KWA8G?=
 =?us-ascii?Q?j4SevVBoWYORZabtEhKVlRN166FubtsCwVRBCA6KDDi35x/8ORWlUN2f6j3O?=
 =?us-ascii?Q?Giy+slLIJ9CUarNXWQLrhwjBAy9FwMqmvIEPFG3fDlyzFe3vqRFE7rIhCUsx?=
 =?us-ascii?Q?HdkwTL6CDH7OV0dAqL36NyhugNWg01pfYRX+xj+HmEvDpHkFeVdWeLuOboSP?=
 =?us-ascii?Q?nvxZE4yMIvvbaWNujDOlFkSXRcLlDx+mzNtBNjXAGZslKCU0SaOkCTcU+yoS?=
 =?us-ascii?Q?R80/7tbD1gP0x2BdnF3nZVYQ0s19ojuv27RVq+7JrTZuc3W0kzd0SEIUa2+3?=
 =?us-ascii?Q?78H6VF7uejiz1zq2lAXoFWJP5k5idW+amRJidvi6jShpv5Onmn9B3clpPqN3?=
 =?us-ascii?Q?dJ8dmmP8E5eSbkKM886gUhKsQaGgJ6PJpc1AbP+P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa27a22b-011c-4549-0cf0-08ddff419f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 10:19:06.4438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dl5xN6eU3dcFiL28xsAkuGdCqeMgePeW0o/woMzXQJecYRbCO/u6E+KY7fqvxDxXP6ogYK5juHa66PVIJNPvrCCSlmt5O5dmBUdX2eHTtZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF2B8F6C64
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

Please use --subject-prefix=3D"V2" or respective version number in patch su=
bject as well.

Tejas

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Nareshkumar Gollakoti
> Sent: 29 September 2025 14:06
> To: intel-xe@lists.freedesktop.org
> Cc: Kumar G, Naresh <naresh.kumar.g@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Gupta, Varun <varun.gupta@intel.com>
> Subject: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV V=
F
> Provisioning
>=20
> Due to SLA agreement between PF and VFs, multi CCS mode can't be enabled
> when VFs are already enabled.
> Similarly, enabling VFs is disabled when multi ccs mode enabled.
>=20
> v2:function xe_device_is_vf_enabled has been refactored to
> xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
> The code now distinctly checks for SR-IOV VF mode and SR-IOV PF with VFs
> enabled.
> Log messages have been updated to explicitly state the current mode.
> The function xe_multi_ccs_mode_enabled is moved to xe_device.h
>=20
> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h           |  8 ++++++++
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c      | 14 +++++++++++---
>  drivers/gpu/drm/xe/xe_pci_sriov.c        |  6 ++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 13 +++++++++++++
>  4 files changed, 38 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h index 32cc6323b7f6..986f9cabb897
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -172,6 +172,14 @@ static inline bool xe_device_has_lmtt(struct
> xe_device *xe)
>  	return IS_DGFX(xe);
>  }
>=20
> +static inline bool xe_multi_ccs_mode_enabled(struct xe_device *xe) {
> +	/* Multi CCS mode supported exclusively on GT0 */
> +	struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
> +
> +	return gt->ccs_mode > 1;
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>=20
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *=
p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..584f3245fc7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
>=20
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)  {
> @@ -117,9 +118,16 @@ ccs_mode_store(struct device *kdev, struct
> device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>=20
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as
> %s\n",
> -
> xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +	/*
> +	 * Check if the device is:
> +	 * 1. Operating as an SR-IOV Virtual Function (VF), or
> +	 * 2. An SR-IOV Physical Function (PF) with one or more VFs enabled.
> +	 * Enabling multi CCS mode is not permitted in either scenario.
> +	 */
> +	if (IS_SRIOV_VF(xe) || xe_sriov_pf_has_vfs_enabled(xe)) {
> +		const char *mode_str =3D
> !strcmp(xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
> +					"SR-IOV VF") ? "SR-IOV VF" : "SR-IOV
> PF with VFs Enabled";
> +		xe_gt_dbg(gt, "Can't change compute mode when running as
> %s\n",
> +mode_str);
>  		return -EOPNOTSUPP;
>  	}
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c
> b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index af05db07162e..71c1d998ba82 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -155,6 +155,12 @@ static int pf_enable_vfs(struct xe_device *xe, int
> num_vfs)
>  	xe_assert(xe, num_vfs <=3D total_vfs);
>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs,
> str_plural(num_vfs));
>=20
> +	if (xe_multi_ccs_mode_enabled(xe)) {
> +		xe_sriov_info(xe, "Disable multi-ccs mode before enabling
> VF's\n");
> +
> +		return -ECANCELED;
> +	}
> +
>  	err =3D xe_sriov_pf_wait_ready(xe);
>  	if (err)
>  		goto out;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index dd1df950b021..e26837091375 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -43,4 +43,17 @@ static inline struct mutex
> *xe_sriov_pf_master_mutex(struct xe_device *xe)
>  	return &xe->sriov.pf.master_lock;
>  }
>=20
> +/**
> + * xe_sriov_pf_has_vfs_enabled() - Determines if the PF has any VFs
> +enabled
> + * @xe: ptr to xe_device
> + *
> + * Return: true if one or more VFs are enabled on the PF, false otherwis=
e.
> + */
> +static inline bool xe_sriov_pf_has_vfs_enabled(const struct xe_device
> +*xe) {
> +	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +
> +	return pci_num_vf(pdev) > 0;
> +}
> +
>  #endif
> --
> 2.43.0

