Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9069BC0219D
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 22:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E7310E3DE;
	Mon, 10 Feb 2025 22:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLI+FwlU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320BC10E19C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 22:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739225071; x=1770761071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=npje1vJkHW7cY+hyJxdh5p4G+6+Hu/7LSSLz6M5tdw4=;
 b=gLI+FwlUGsQO1FoROGArXj6Vzhw5mFQXxzp0+p0n0Yc1cMPEU6W+2Pna
 q2RkrL4arD5BBRtllfykRXimpLutwa452AW3BlqmgW9KxewO9sQI3TfC+
 HoC8Dlf2pm/DUc1BxUhi5KzfsegQvNSPmlZ86/d4lUYn5nZqrI+a7Spz4
 CGZT7MjnlA28CjaGRc9d0NHkT7CAgxjbUEI8EGEMJo3mIknj6ojb+lwgg
 xch2OyDrR3IGdzB6KKZ8Uah4Ju2MeSmFjXEW01orNA0tv8Bo0UDeMl72j
 yHeagI2xr0b3Lp1YqhZm9+xU7iUugacLTjZ6AQL9lMgf4N7zVv4Ng702Y A==;
X-CSE-ConnectionGUID: wQ3jKJcPQR2618RiOhCU9A==
X-CSE-MsgGUID: stSUmfePSvyl7/3kxBL7GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42664477"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="42664477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 14:04:31 -0800
X-CSE-ConnectionGUID: WortqzhfTbyVjHZ6CZnP8w==
X-CSE-MsgGUID: e7pI2zgSRV+cHz9TQC8Zyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112285246"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 14:04:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 14:04:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 14:04:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 14:04:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHREdlDBUy0vrebSvGkLhwMQ/MUeVa4yqniMS4IbmFBAJsG2QPWWfsj5lqHRjYRFQDbWxUad3wt7BGaalDfz5/PGhSWtbumIWKNPwu7+PEkaihJqM1wawOcTDBy9IK66QxYFfEiPF9fUwFyYaZTLZvqU6vUyBCTNJzSORxvydUXrhhXpAtLqqiW5T+NOA6LScx9wkCBGNqwws+BIAuSStzyO4/K3YU37XWfk5YQPNHFHkqMUnpHkgU9CRoBFFSFpuWRgU5FsPi8Mnt4DTesQY+gcOnOWVg5MSITU2xIcNrCX/hDb3wWMUeBDVRrzkFJEcidxZDqCLLCSRo0s2MFaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BO/wTs2lDum8dMgbMhPVZy9r3N25XYOByjnVwTx/w/U=;
 b=BafKWMbeEnJSfYvkUx2D8dRpwqUPJ4rEbUpSCB3r8dZn+imlS3mG2um31PNKYBjcrJ6fvw589nPQNcbzGEGCHWhryLGN/Gd6gq7QpmPm+OPFsSlOt66PhJ6JELqu5ksDqaWFZANJY59g0fEBwz47gKCOyJ3WYNYe0vDRqrkpOEoEFsROmIeOCjvjqcD6ZpD6InIc7EBi5HVb8ygLHViFnCqCAS2pLPlc3wvrwkQn0yxgNCEKgPr9SdQpS02GNNcwWtSQ1i2NP5Dw1WyL+C5wSYnG+N77J5TM98FMzHh9GQBw4aDTP5yKVfRLP+H7slKU7xVIVBmAA3XqOTMP98QexQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB8291.namprd11.prod.outlook.com (2603:10b6:303:20d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 22:04:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 22:04:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
Thread-Topic: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
Thread-Index: AQHbe//aeao1RxNidEaTqD0w+FN/JrNBCm4w
Date: Mon, 10 Feb 2025 22:04:17 +0000
Message-ID: <CH0PR11MB5444C8CA507F0ED75E8BD033E5F22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250210210719.477386-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250210210719.477386-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB8291:EE_
x-ms-office365-filtering-correlation-id: a2e34d86-d235-4311-6740-08dd4a1edceb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8aeaDQ3+/vPS8hFnAdTyN9Ww+3+u6PNjkmf/jKVzC8Qqv4CxX3iYUV7p0fA/?=
 =?us-ascii?Q?/v+gyab0/e1Av/v5lbRZ54MBF8lRntjBv++620YOYQ76q7VdqYjARL4+hglv?=
 =?us-ascii?Q?XLuo4QvXggCdGXqrhn2tGBrN3KwowwwS5zFNCGzZypFRQ54/XvhgxtQVbHsr?=
 =?us-ascii?Q?K09+mvmtR3piNd0Jm5fiN7VwCMy7VLB4gdZ8h3EZ41h3LI2nZVx/SSkSOq9n?=
 =?us-ascii?Q?MUGObjycTSSIWOUMD4nu8zug+5th1zNo6KGl/ecv4/6fh/kh0aatcTxxwlHC?=
 =?us-ascii?Q?C9veIK6Kx/Vc8ksEmB26Rc2G4tEF7FW0gR55sSW1e7mI+gk0PxFw/LCDmgaG?=
 =?us-ascii?Q?8D+gvYCDbFVi8mKA8R/EyHODCqpbntXXJ+V5/QxeExPOYRbRqnjbWGrtCRdN?=
 =?us-ascii?Q?+eD69LkNsbOXy+pwgbAO9PJmDscQEl+LuC9Dh5dYSt4n9zOKnjr7axw3EEui?=
 =?us-ascii?Q?0rc2EDuNVfPuc2ICjiAND+MXrULe1BSudufBcf9XZB22JNH+bsqMSQOM7VPg?=
 =?us-ascii?Q?Fj58f2q93W5TzZURO7kEnGnujKhIMZskFQ+VCF1f0SP1PIFkvGBSrnr47Ks+?=
 =?us-ascii?Q?oH1YKutQ/ERDApdJbcL10jqt30vddxTLrnymmiKQLC/N0zdv0RR/jh/ACQa/?=
 =?us-ascii?Q?DyF/16oQ4XUnUIS2wphpd4Uyx/SGV8UfwQ1QPSHnwm4Xf5pZrYPiXFbKy8zL?=
 =?us-ascii?Q?9IfWgJDvUViGIEYnQoabNu/rVsJqVBDEbPII0K7QhOOmY99orfSoPN1QNk9U?=
 =?us-ascii?Q?lqrAGE9iEmJFZcw/j/wbEtmfMIY44lHmb0IhtfRSyFnPmw9jCcbnS8IsJqX4?=
 =?us-ascii?Q?kX13oWZnAoRzLAsaRflZ5fixo6Fxlyz3wAGyQt8YU7IIPHpu/RricLbiWAL1?=
 =?us-ascii?Q?zQ1IhNKu6zgvhFQ60R4jhiooL0Ky3XLozooTsGASMok7Of7v9zhkSPZQcq5z?=
 =?us-ascii?Q?epQhDNQOTKTE/2gNRzzirlbsXgZri7F6SDaTAW3DcBzhoQADfIxo/Q1REGRd?=
 =?us-ascii?Q?fUURpmTlaB5cN5tD0TOF4VVaoegSiH9SPbrzF8MF1zkGy4a0hQgS3+SKIEwu?=
 =?us-ascii?Q?bzVVAykDrYEo25Gu46pK46H+u27Qusc2SfDHMrsR2VDVdzKslxG9gqfvheIS?=
 =?us-ascii?Q?tDy7C4X5DpvuJmPhamWsSKRdXVtQXbIi4M3sFdaGyDQoRjK3w4FEG7E+s6op?=
 =?us-ascii?Q?8NBMfY1xcdgOdQnD+NCsIPN5zOnhzCbHkWfKgTkTmUQMCIPgH4LI+Ox1gDUR?=
 =?us-ascii?Q?DNYXYLfD2B7ZY8It+8jykMgFSvB41WOAZSdJ6n3/q1bXGMchzbAmzPwSxBUZ?=
 =?us-ascii?Q?4JEzpnMKB6UmilF9vKGrS8bIGUaaYSztHscOlV19C+vPRlirmHHvdkhB057N?=
 =?us-ascii?Q?HWTk748FUfvrv6H5XtdOt5HRajYQWJdJg56oIWPThHi7zSAXOTfNPjhUJvB8?=
 =?us-ascii?Q?2j1gIuM+JiFiHgAIo1sxnfbvD1Ozhw4B?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qrLZ1cIedjQ8lm51KVefxiE09adQcm7D+73hl6/pF5ujW3i57J/1ezU70fAL?=
 =?us-ascii?Q?0BwuJITzGVmbl8J8+oD07ix4bxxswxcVoiMxoIoYoEbc1Lu1qk8qTx14C4PG?=
 =?us-ascii?Q?W0Eh0I6Z4Y3uWiBq31ggDJqWcKZ2FCXxcPH1tZ+Q5ThJitrNKAuJHN7v7DdZ?=
 =?us-ascii?Q?9Nhj/HLGZb69wRF4ln8LBCuA1GoJYtlkeXL7sKweIe31bVZs3XhE6jtQ+LAE?=
 =?us-ascii?Q?ll+fjmFTS0shHKQOpt8pObp+NEQlfDNDmuFwTt+2aGWg073Sx6wrMKEfVUjJ?=
 =?us-ascii?Q?z3BzOHEmnJpoapKPCIcZCnjwthQOOtt8ADQdpNDKIsyD3p3E0UpHbVxt/Hhx?=
 =?us-ascii?Q?VhX43n+Xl/b/XfnY4X+Ym2P+6M99KhOHvrMvdiYPZb3xOy0a1f+KMKV5ag9v?=
 =?us-ascii?Q?ReAXrY3uXK0KR4PqmLdQoKyM3Mz/aqMCzgQD906BD1N/wqXuJ3CR8EyZybgA?=
 =?us-ascii?Q?2SBUIlnJYA6Pe/fj3S/kwW+7Ibc1oRaRcrSa+ZtTjKfHIZRc7o9ZDvP08THa?=
 =?us-ascii?Q?MF1rKshIJ1m5QvvLIU+Ub/ygYRQmdIGRpdVSkO9FV3JgmDjCnYlIopL7ru8W?=
 =?us-ascii?Q?fY3ow9pM9VaFG5/N8SUQDJGwuWrhcvU0SXosk1v2x8GDLkGRtjPmRtk7QjtV?=
 =?us-ascii?Q?GM0h28fh8Rwx+5t0lpjUH+TY4rPGM86zwxgp+Ky1YQC2trQR7RjGFABAHKWy?=
 =?us-ascii?Q?6fIn/Sv9M7Nj8j8Tdg8+V0157sTi+NTnjKs6M6Svf8hhPKcob1PmhJpm0sTB?=
 =?us-ascii?Q?+K6zj2471FWld1f2toq1bU6wok0S8hEcvC1Sd9zt6v/brSqQipXQV+mhYgK7?=
 =?us-ascii?Q?vpPjcIBZ2fyZ6DV73UKm0LIdqidmPMGnnSsrYy5DeqRdcVZVLf+Vmvry059G?=
 =?us-ascii?Q?5h/mO7dIK8BK8VBdKiNZq580nhJh+GgvEexghTpJOq9OIbRiPUXLo8aw8Z26?=
 =?us-ascii?Q?W7w9K47fxA4F3GCkgakQvQAp72oP/FmhXWhj0vwRhJILy7VxXkER+VlJTAKd?=
 =?us-ascii?Q?A1nWU/7UdVq8Wp1rzcBw9Cp0oN/dNbjBzQ0kgudDr+PN/w93Uptf4r2lTOuj?=
 =?us-ascii?Q?uIkxBzVmdTaAjdJ7LJTNyOOeyebQEHY2PbSYhxPbiicEqJkVA1Zk3S3gp2lg?=
 =?us-ascii?Q?l01swRVS5bXi1IZmj4YDHlJ/MVykP8N5IQBktcRQwn5QvVc2qQRAqNo8CXDi?=
 =?us-ascii?Q?VkSJx3cY1va75b+9B4Kz9VDTkmiNvLl9L9hQxD9y7DNJWU3sLtEEukvDVK7r?=
 =?us-ascii?Q?9isqP/BzNf/px3Ud1RDKAywmeWlrNn8DPG6R2Zl4oy8IIGFkIBwfw/QKnxLe?=
 =?us-ascii?Q?rAotVC3m+aEebxiuugfMM2s988ePviPYPrXqSPDVRmsdt1e2jj4vMB0T9M/S?=
 =?us-ascii?Q?xC8GQWKMF7U61oj5c7MzJWWnJh6h57EdB2tPvXiTC9SCMMLtoRmtE6zb0X8w?=
 =?us-ascii?Q?GWwk9C6YbmWw8sEOFpq4McBzsKo+uOO4fE23Xerm2FytmBeXd2HF6+xcvKvV?=
 =?us-ascii?Q?xqIf2f+X0W+SaabZlfrtaYQWImzXm6WDWMYWXraGUgpzUtp+kX+d/Ow/FexM?=
 =?us-ascii?Q?FtcsNnmQwbFWScboktr3WWL1tqHLsLphNNed36bo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e34d86-d235-4311-6740-08dd4a1edceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 22:04:17.1911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpYwsONfBXr07VSTeaFJGecAMQEeGiIpuNM9qOo8WeXQd8AXlQJw4jFHBanG2dYPY18NGquBo/YYQIWl3Th67nmCl84M+694rdFNQkv9khc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8291
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Monday, February 10, 2025 1:07 PM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgau=
mkar@intel.com>
Subject: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC f=
ails
>=20
> In a rare situation of thermal limit during resume, GuC can
> be slow and run into delays like this:
>=20
> xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
>    		 [status =3D 0x8002F034, timeouts =3D 0]
> xe 0000:00:02.0: [drm] GT1: excessive init time: \
>    		 [freq =3D 100MHz (req =3D 800MHz), before =3D 100MHz, \
>    		 perf_limit_reasons =3D 0x1C001000]
> xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> ------------[ cut here ]------------
> xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
>=20
> If this happens, this can block entirely the GPU to be used.
> However, GPU can still be used, although the GT frequencies might be
> messed up.
>=20
> Let's report the error, but not block the flow.
> But, instead of just giving up and moving on, let's re-attempt a wait
> with a very long second timeout.
>=20
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Minor nit below, but you can safely ignore it:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 02409eedb914..aa58f9ddbf84 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -114,9 +114,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc=
 *pc)
>  	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> =20
>  static int wait_for_pc_state(struct xe_guc_pc *pc,
> -			     enum slpc_global_state state)
> +			     enum slpc_global_state state,
> +			     int timeout_ms)
>  {
> -	int timeout_us =3D 5000; /* rought 5ms, but no need for precision */
> +	int timeout_us =3D 1000 * timeout_ms;

NIT:
AFAICT from the comment above, this wait lacks some form of precision.  It =
might be worth while
to keep the comment here remarking on the lack of precision (or how the pre=
cision is unimportant
in this instance), but I won't block on it because it's not important.
-Jonathan Cavitt

>  	int slept, wait =3D 10;
> =20
>  	xe_device_assert_mem_access(pc_to_xe(pc));
> @@ -165,7 +166,7 @@ static int pc_action_query_task_state(struct xe_guc_p=
c *pc)
>  	};
>  	int ret;
> =20
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
>  		return -EAGAIN;
> =20
>  	/* Blocking here to ensure the results are ready before reading them */
> @@ -188,7 +189,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, =
u8 id, u32 value)
>  	};
>  	int ret;
> =20
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
>  		return -EAGAIN;
> =20
>  	ret =3D xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -209,7 +210,7 @@ static int pc_action_unset_param(struct xe_guc_pc *pc=
, u8 id)
>  	struct xe_guc_ct *ct =3D &pc_to_guc(pc)->ct;
>  	int ret;
> =20
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
>  		return -EAGAIN;
> =20
>  	ret =3D xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -1033,9 +1034,12 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		goto out;
> =20
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> -		xe_gt_err(gt, "GuC PC Start failed\n");
> -		ret =3D -EIO;
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5)) {
> +		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
> +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
> +			xe_gt_err(gt, "GuC PC Start failed\n");
> +		/* Although GuC PC failed, do not block the usage of GPU */
> +		ret =3D 0;
>  		goto out;
>  	}
> =20
> --=20
> 2.48.1
>=20
>=20
