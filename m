Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE8EB105A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 14:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307CA10E269;
	Tue, 10 Mar 2026 14:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I95Ilj+4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBB110E269
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773154216; x=1804690216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=I95Ilj+4uT2P+oPTtoZevkQ65iaGc4K4ScwE5asy9sF2WqpmUxfBwoNP
 qR2QpTeE2TfPNkHAzTzYujyB3FLvg3vMN93BpaTYZjFktZ3dR16JqeTFq
 yX1Vcv2nS9Z+KG0UOlMGaNqp565dy8+rAIuNDUTVYhHqetTKmfey9Lt0s
 cNfo4Xnbyz8nR01X/cZHOdqrNvU8MAvwu24jrzuwnmFnRJs8A5dSXkmN/
 8b9MkguAuENFyd+IdX0xEiESaKQi9GW1si3zcg3gmrMuQk4fFFt1KhAXc
 wOsnNpdACjG6C5Nl31VETXs/nPqLEgaYpyDNHxsCxkX3qMmxvXA+uafZc Q==;
X-CSE-ConnectionGUID: PHn2uy5hS0SEuK+dcpvKpA==
X-CSE-MsgGUID: dSSdBaV4QL+HFsZ+4ryIkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91585658"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="91585658"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 07:50:15 -0700
X-CSE-ConnectionGUID: eMAh/6ujTJOplKTnRMGa1g==
X-CSE-MsgGUID: f2KXwOsZSC6rZ7QtD616tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="245886694"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 07:50:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 07:50:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 07:50:14 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 07:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UV+9JyQGMR5xY+Ok257M+tdUbRbiMt4q+2a0wxeZMTvEomoOtezbE4z1hPXZL3cFzpzrCwCRvZaECBuZj4+QAku27nG6SZJgjdBDlelB40hYgl11lCdfvvaPGvDF7VlOjf7pXPlBmqvs+RIh572VO8prMO2cWXxePwvUVR16KqsmwQ+I+LtMRjvrsDacgkXV8oRCnLX0CPAwHKEyWjkBINm+Frjaa+ThhZ/vMEIVOVt2adxPWmf3Vyvd/ggIXS76PMaW1c3HycTmgBn5lUQ7XH0QvVMma/BJIaS04mGADnvummdKVAdQyaQ0FOkRUFM/GzXYzoGG1CWSTCSvDmAAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=yankOb6WpRHsFPCm2qMd9MaV42XlCRqehonQhvS4G5596tpc7rDyt2GYOHfGLzrVNWE6z4cqP3mNeVeIk7rrZzECpOJHJw8qUWuhBbH5mTs2c9T2N0iwsI98JwvsMNyOkwT9/xMZ24xLapBTL3qaKSX/9HMwNofl6qN6zldkj8Ilon4Bk7BBP2j0Nue1p4Cr2/b9ANxWuPVYFVmTzUHp3HR34E23VUH3l/VFxZmwzVPP4NTBLY9cXqP4o5KuijsSfGe2/Id6q51Sgr7E79gZTk2BJ6MED+/AL5YEXSyr+1DMYuum6GxihNUtxSH388B8ZRuN0mI/1EPfNjKKwo1qiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 PH3PPF4B53DB4B3.namprd11.prod.outlook.com (2603:10b6:518:1::d1d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 14:50:12 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 14:50:11 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Yao, Jia" <jia.yao@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Mathew, Alwin" <alwin.mathew@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v4] drm/xe/uapi: Reject coh_none PAT index for CPU cached
 memory in madvise
Thread-Topic: [PATCH v4] drm/xe/uapi: Reject coh_none PAT index for CPU cached
 memory in madvise
Thread-Index: AQHclSScRbTDptW0L02ptzv0nlw22LWoD9ZA
Date: Tue, 10 Mar 2026 14:50:10 +0000
Message-ID: <DS7PR11MB62719C80FF646C9E0620F49AE746A@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260203154846.1113521-1-jia.yao@intel.com>
In-Reply-To: <20260203154846.1113521-1-jia.yao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|PH3PPF4B53DB4B3:EE_
x-ms-office365-filtering-correlation-id: 23402582-7b76-4aef-705f-08de7eb45489
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: fTpNTK8T7F78d0f37TpVBQb9VjszyTLNu8pC3ChNzNE6ZeuO6jNrzbs2rVAY2wfqkv+7CsJ8OVxRIW7OUBur00Afm3Ql2RRI2nGa1PkrD9dJqES5DJC6qnvKzf20uUoQrTTDeb8WZEZjnyKmgO0G25UTN+abIPRgNCl9IhiJuoSE9txONwt/VL+GK3RMMUwJvtugci5yDago/VoWZvyFO4Znc8fSFbY0LkYZFLxYxKnZdZHTapVSvUUVA+M8KSTrmHrrpyHhm27rRA4wCiVxskJYnQm/uMK5XKhFkz/JMQ5YAwOJ1ANzEpMlcF8gZ2yVf0Ek52V8Pqeqty7S6v6S8pqVmNXgjqZc0lUC/y/FQ2ogpIXYxaHnFOZ7y+WhG4zMj+K49gpjzus3hPWzWTPNG4BcbWxrV1QrgHt7bBq8fwZQv7jGchiu0GJFR/D8wOTGiC/4oWIkcOpsp/fMH/fvpgBghpX25XR9/tL6Dy/Z0Yze/FyxwGKu/NNK1lnTuM7LsF2MA9A2axYw1g7fmHs7HHj1jIHEgtAVKGIti8Z+UbARiiCdgZaKplyysE2z0KG17r9HSaQ/ZQ5Tm1NJWfOLTarawS9qzEMvoaHmM5I+XOFhxyOPF4SQI0UvK4n52oTUN1U1j160QzotkS0hSiLPecL8aeK/fZLXUWMrLnDLkO2oGM80LszunyvaJ0AQC9x9LvL0OdvdwtIlvagv3/xy06vFFotuZnovYABXMmxfQUCpsirmyTL9bH5i5hlBK6E5PrT4/WQkOc8FqJCI1ahUa5wh+VJmL/LpOY4fn1+jgok=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eRvhe6yAgom9FowRMe6nMoocUzBxxRmF/JS1VT8Ygb5OClQCICj+laC1nsSb?=
 =?us-ascii?Q?ecg+fg14OtoFYAbEEDvWn0KZMeEw2693mq2D7v4xsDUisIZ/a5Is4KbpgXYW?=
 =?us-ascii?Q?1339QO4iCswMJItojSnwR1gLUou8AA9S6MUxBXzOU/9XUgF4fF8EfUmpDkpW?=
 =?us-ascii?Q?zsFNHFlnI3PpuSkxiqkI7OztrvNg3JgHNvPEd8fuU4qnY2EBryBqSO5I2Lav?=
 =?us-ascii?Q?Vr3An70y9pBrdxjzHsLaipzYfkB3Aqax87quT/iSTA/tCzXj4a9cBQjrXF7N?=
 =?us-ascii?Q?iIF5GncgVK9YWN+3lKpyXIGqFzGj6cl33FDbJdrmhFz5VJ4C7KfUMYdRGHh8?=
 =?us-ascii?Q?dq5Z8bD66vkp/5c5QLirT/jCzmcNa+sfNs2A17+/Tqf6UUqpfe8vqh60xBgh?=
 =?us-ascii?Q?YCWxJXh8wqA63NEST51cglyNtnnebDdUWgsKR8nVB3g2arj14QL2zP1Tvze1?=
 =?us-ascii?Q?p7tzFNPwmoEB7gXCCdJfEbSW5817cVQTz/d7/LCxl6qZfxp6TziD6J0zDpLE?=
 =?us-ascii?Q?pz6y17LzEM2gJ4Dj9BdCXVR05X0S/AsLkf4bBgI1KK2E2j6bZmWZiERP9MNv?=
 =?us-ascii?Q?TUAR9UYRJ47xODkCVcPGZThpqELoI45Vak9CLWAmkg1AlXC7wvAmpGibZHok?=
 =?us-ascii?Q?zAo+e++6VoUsYsYpvcag4cYrr1CdVmBF9xt5GYbwypDlvqo+zVLHLdFHrR9t?=
 =?us-ascii?Q?bOjEuuYXcHCXuUKwSn2KjtEgL76dB/3BWvulIinOrtbCpd+zKhj7kEuudPT5?=
 =?us-ascii?Q?Fb8AI35gy335aZQxCCp4ybK9K0hQcIhvCGKrUP+86lXmeia/zhfUs6na7A7K?=
 =?us-ascii?Q?TIGiKUyohDIz21AEQb21rpH5e4pGkLoDQI4ti4LZEc40uUqAMYbnuoiOeDvZ?=
 =?us-ascii?Q?piWxJW2nuadsBo4+oPdxhGd3MThC1DT47qi6uDYLhJE9PtsKF8CFQZPX5ymF?=
 =?us-ascii?Q?UbVPUbQ+YXbDDoT9IIIrUUT55kmzQEEZ2+GwKX+QpMnk++WEXZe+NOuria2B?=
 =?us-ascii?Q?Ew7qOprNf6pkF0aeMnNohepXXUFHQ9dbm5IuhhfyO9UbVixwSguEq171/1HG?=
 =?us-ascii?Q?4a+QBtryWXw1JoPMmrrvDE8SCX4g3j2lUSl47Nye5E+9L9TCBqv0iU4S7WaP?=
 =?us-ascii?Q?5prbB8lUmbLhmIIEyBbaUaX+sMiebhaz3hI8aoqXNRvFFeHKVZG0aeuiim6e?=
 =?us-ascii?Q?qWaBIsamn2roqKzEzUErdJfWcs3uHsMmU3O6Dbk5mbVOezYMc/hb9TSnLQY1?=
 =?us-ascii?Q?4ZDQxbXkGz+CcYQygPKSLsCTWyYAE0NM1OkQNl9ixCR82r1tIrAcEtCENm/U?=
 =?us-ascii?Q?7qkg68KRNHYGO/6TJgtVjx6H2R9che+DvRqTnXqwotDXLf8BLpPiCITuOBBo?=
 =?us-ascii?Q?t4hGPwYeXKyFyVHZppzO63Jio/BNvf2rnBjglTEdefPGahaqcJlzButy/EKR?=
 =?us-ascii?Q?uA1dYTrxCaCsf/UzkS6RVB9xg89l5JfzOgWWLXu40qZyPc5gdzNCEt8CcHN+?=
 =?us-ascii?Q?1vkt+UPjOrpMjLlvUo+FyHLcrCC8kcPbJZyUop9QYD4fSKEMoZlQFhjFYKLB?=
 =?us-ascii?Q?JL3ejPPMlSHDuoKXlTQpNNZvOaokzlt+XoF2SUoquCLGbqb9MDrtpdTc6lnf?=
 =?us-ascii?Q?6rSmKFNYUKCRRpwCWWhm6dR93bXAaVLzj7G2LC3Htg+iTrC8y2zNeb6KA48J?=
 =?us-ascii?Q?y5GZjKn2eK23uqEqREyIrrog1i4y4p26upz1g+0IsdPZYFXXcGPhtjMqGGqD?=
 =?us-ascii?Q?vCBen5k/lw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YZ8v/+Vl4cCQfnhOLJcMehloIdcid43PfRJdMa1doYXmjx3/H/LkRdNPXnBtRLIhQZZuDfRd5AavTeuXdUurG1qYHMYIf39/xujEdFYPvWBSwaoD5EBS6b/lQIZDw1+4pmhkIU0pBMco0jgC3S2UOUXRCp6Ey8UdviyMMJToO3sFV+g+WFv6uTlkC3JP1FrNrulSW70V7IkoMZNFRxic3qXVoMlRi4HhBYQSqrtRGxnBQXYWx1fQ+0gxjHBXO28rO1dVGxA1fqoq6qkafL5+aXyxLfPKRC8sachIqH8lHd2yoWbw0JPO7ZPYvXXzH5I9wxAM09wSbxH1AQL1BdlBgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23402582-7b76-4aef-705f-08de7eb45489
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 14:50:11.0032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kg83v6qAD9nc7rmTYmef/UIg3gwBxSxnXdmwNuVVCUd30V4wgkYxMHeW+6UdJ+eIn0dDHBOkcltSfDhIUPZtiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4B53DB4B3
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

Acked-by: Michal Mrozek <michal.mrozek@intel.com>
