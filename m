Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63852D12689
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 00:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156BE10E002;
	Wed,  3 Dec 2025 00:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1366Scv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1833E10E002
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 00:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764721063; x=1796257063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4pqbWjDQRUaV/pYU3xAEq+jm5o7tI2YIvNPzXw1QOxg=;
 b=V1366Scvf7I8/yAEgEMDfDndVYF3vS89NIY9qCqbexb70OV40fOFIDhZ
 6VNynQefFFDpHhW9W5htqEqkWxYbGDvk1Q++xzBxC1YOvuhZrUFSOIpre
 2bGqSBMWV67OYFiqv40wLhehF+iU49SMj+zebjnxMQBh1Ux8upqgfIHxx
 f7K8rvylqJv3O3DkjIiADxIsNHFG4GToVn8vzKLoAjBgOgDcCpSRoIoHf
 umEJcGhdTOemiHDYZkg9huMsnvxhsLGy1taNsUFkAqguaC3U+jY7FBis7
 wlOfN3xHS6maiCfbz0E6giSmKqEtzGzhccVkdH5X9ujpcnrGtBMt3ehUL g==;
X-CSE-ConnectionGUID: ST+f+jM6QJ21d2xoJah1zg==
X-CSE-MsgGUID: pteT+rj1SLiNywhnZNF2wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70325224"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="70325224"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:17:42 -0800
X-CSE-ConnectionGUID: Jilx47ZSRLiXu46jvywU4A==
X-CSE-MsgGUID: kyF7y0IiR1KJoOUJn3z8YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="198699526"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:17:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 16:17:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 16:17:43 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 16:17:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZ9zKv2PRtt4+vCgsJkYyXxpP2iwwuneQGrX651zVjbu957PfyqmsrarVEtZSlcZdQuSMXkh44z/y6k3gV+i3hfUs1tTqrk9eQUKHHG27eGvDoi9uyKymckRJk6UMzoChKTwT3DxUEMLuXE75XnAMMswQMBG/IfWfZEQmQmZC/YYGktPnmMuOT/K8aWCgy/u4ENB0OZ6D7A4qeMneKOFyjEaWuXojEdv7jC+zI73zZQI190r5fJgtJtGwCou7A2f4P+GYYaPg1iLEIq+M7PyCmiDMSTPNvVmHGwt2c4aFmu2UT5oacZzgxs2A5osrQ+3eHG+6LvsCso/vUiM2PUwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+FL5Lyb0G87g9oYkgnYCGvAnYnvrhAgX+Y4ZIpHeX8=;
 b=dHYV05LZrb6qPBZ1m1P1pWjHIXO9JA5JDgNccCflWyE60u15rHOc+aysyB0HHPFFeJAYe/nBXwJQaqhY2g4+lOg2D5wyxg2f1t17oz72YKp4QvvlQc3noVXidqjwsFn9T/puAL3h2PQhYOSii4P0LKM72eyI0iEGUTKPIyCLdFRLBDYQpf31oGPd9jOCegdswwYlLp5CkkhL6qOePizlROaOXruKzMAEA6s1yVSEISvzpe0EQYXsIfyX9JwGZNeUDFJLtizFA+2epqGg1Pu1zxWr9PKRq7Y2ibSCfV7UNCL15mfT7dJdX8Dj+O6tNc5gIgDUG+GQOkP6ESPZO/1/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 00:17:34 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 00:17:34 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v2 05/11] drm/xe/guc: Add page reclamation interface to GuC
Thread-Topic: [PATCH v2 05/11] drm/xe/guc: Add page reclamation interface to
 GuC
Thread-Index: AQHcXyi6OyTcPILSQEa91K8YWAt6N7UPFZLw
Date: Wed, 3 Dec 2025 00:17:34 +0000
Message-ID: <DM4PR11MB545687F369C2115BBA04813AEAD9A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-18-brian3.nguyen@intel.com>
In-Reply-To: <20251126230201.3782788-18-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY5PR11MB6307:EE_
x-ms-office365-filtering-correlation-id: 2380bc23-f256-4ba3-be41-08de32015ba8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?bc/r9OodDtUTJnFbJW3nxIzX1biJ/ncXUjRhsV5p0cY8blzmAl9XOOfIXGDY?=
 =?us-ascii?Q?udB9m9muOjdhHZtWRVtigtR8Jbka2dzkrfQBL78MX7jhSmagWkoynLkSUgSB?=
 =?us-ascii?Q?GPlEb8QlTZQDFbJ3BycAiIjUe2cCOUG6VxoWl74KPu6tJGw/yfnZpD0FAkPd?=
 =?us-ascii?Q?oEizI0sL46gCxw+cbAEm/wOdqXzqER439sk4iL7/JtAY364g8ff6B7qtGuyv?=
 =?us-ascii?Q?fAGbFKAGkf3nJSA5nEUAKC0lu4oqtvzEhPVGS9boAQLCH0B1K7u6FOk94bVw?=
 =?us-ascii?Q?c1JuIjnmG2sBerlMVF5rW/IUYmeIIz9HA6O/Yq1aOrI106nEN4IzKcW74tH2?=
 =?us-ascii?Q?PbUYFJm0PxWYuRjCRXvDFNhB2lIeP4w4uVembr/SA7JTyr8F4zvuwB+vN9dc?=
 =?us-ascii?Q?fVPjgydmtMgKtNYny6luIZxrh/ehRLTrj1tax1gAONw5+4qfqTd7G9tMd1/X?=
 =?us-ascii?Q?O6E9eoJV9jk3BVrgV+h1Xg6SmYGSntGlUmnzgM6D4qZHdMKpVmjMy95+PyIA?=
 =?us-ascii?Q?tPWz3HQNZ/m2rL62FElJGROVVElO7Ig0HhNlW2qNQll73f01rdn4Ediur/qX?=
 =?us-ascii?Q?jvJD/Il/Krd16W1KrQTubrS1Opuzw2EEa4mvTt9vbsP+mMPko1MTT1MAX5N7?=
 =?us-ascii?Q?ymUZhgiSBprnKY5UuBct0yQGreyKj1YSuS5yk/SExVTM+a2H7hGEArL490ri?=
 =?us-ascii?Q?1H6NcKLwRaz1m3OreFD25lgF6MpoRGyaBGccV1j0zQJony5sX49pul7EWJlo?=
 =?us-ascii?Q?FV36p3KQbWKnCz0cCCV+6Iqlahp2JmZKQKFUKQUhFxYDL4GBQqwUCpMz3iEE?=
 =?us-ascii?Q?0Pk0bTo5cbOWRF/ROr9xeU24yi/+GF0HwHzy41ooLlObcoHM+OC3ok8VTBcJ?=
 =?us-ascii?Q?MLFN73XHcrUbRwu5njME1QmdUCxfGbUQIld0M9Uhp1CH60zJa7xhTTJ9tiZS?=
 =?us-ascii?Q?/16zvYvfz26PfkvdSxxKtpsRz1roSCKNantS/Err8rHTPJeDg/IFBCfnRh0L?=
 =?us-ascii?Q?n02y8pjG3y6pSiRTwfZdmDzQ0ggf5+l01L8L1Ug2PWDQM6IfL91TyVHmfsPZ?=
 =?us-ascii?Q?enErGVetpEyIeESrZjc9lwFSV90S5kbY3OiWdVm1YPX8QGy5gstaB+u9umv3?=
 =?us-ascii?Q?8klta7FbFhziR6glAIDvPKJeELHVPFT03Ahp0dQmhRK3RH5RSrIEaazbh78/?=
 =?us-ascii?Q?XyMR5RoU1Y90jYQq3U7IqW4QNdIcrpB5fU3u8i4JjUz6vqLF9xPP9H42yH+p?=
 =?us-ascii?Q?W7Id5bqN0rCuxKzcww37KlWKklSOkp7ZzFqloJYaYvGvZNW71T3w5wcs52DU?=
 =?us-ascii?Q?sTNLMZds0/s7oKezkI9iPMpb6/CIbNXM9DXQo00+E+2a2ODtr2F3oRv5L82S?=
 =?us-ascii?Q?MHzzgyjsRZOkien81pjHzLDNConsBAL71ZSqYyd+yM1uyv7PtugYWp47NYgT?=
 =?us-ascii?Q?/91aFn3BzbdkujeMnLdWwmASOlrBPTD/qldncwg7S2YXHsOQv6OXmx7u6NkF?=
 =?us-ascii?Q?tguLav4Dgem9uv+K/ubl9t4T4bMWY48g6vKl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EFen8MNsINhIQFJPK1GPeWjHdC514+ERG56VlML7gq4BoTUfW4b/+dZSGoEW?=
 =?us-ascii?Q?LP+anZSichGCvEJlQH9EUiRu10TeaNFxn2g/Aaa4yDMA4WWPqN6/UX3l6Qti?=
 =?us-ascii?Q?tlpKn8zXvToH3OkVUDQPLuyy/H1T2BEDQctB4cWGnHH4p1Py266Xl4kJuHDf?=
 =?us-ascii?Q?WCBEgwzMB8ReoqGRBOp670eb6309jTS1Vxr+yWoGFMIm2AmhU883mgXB8B7D?=
 =?us-ascii?Q?tGbJMiwH9w48pAPAHt0jVh8vPXt26wJXBm2FzIOWC96DXK+frrQ6/D7PeqJB?=
 =?us-ascii?Q?2EWEGoPilI3haW65NCpEQRw1P46icLX/yb6LQEv4uM5/KOiUylVon9G0lgr/?=
 =?us-ascii?Q?gFmCD8F3pXhPwBA/L0h2p/0WWhRCL4bG3RRd9C6TEDIfzzpV4OrHYWxmHj0E?=
 =?us-ascii?Q?GOE8W2s/sTY5Mv+FwZevJ81gl1pJHX63whsxu8WkrgBGW+WzekjM2WEIfxny?=
 =?us-ascii?Q?aUYiPeFrUdg0weGVVgLeYlntpKoPfmO8fVG0qobL4RJEFOxZqXpfchoAw7cD?=
 =?us-ascii?Q?OtnyEc8IjoX5S9NAZd+u9W29N40ZwIFKZnJc941dPHgRihhCu11DjVfJu1Li?=
 =?us-ascii?Q?MbpDM5jSAhDvOf3lbdv6+BbM3aACRPXEqRE/BwsgD/LgAp0Fqvcqp1xdskc8?=
 =?us-ascii?Q?YRD58EsMufA6oGkdiSD1zQxtP21IRcxO+VqazAypGnxHideEe0HhrF0Vthb6?=
 =?us-ascii?Q?12cq0BEia1/DDs6vrCNo+mY9pgl8pKOWglmHDJO5KdbA4DxQ6uPjTLnlyVkm?=
 =?us-ascii?Q?FmEIfiIspqqmS8ofmcSPW1ChK6uc8/8UQdNl/P6kXejeyLlEzVwv9Jlu8jri?=
 =?us-ascii?Q?N8j0AnFCVL2q1h06o73EOUwEweXdzzsHvDkgPS68YbVZceqf8Tl33ySb6zW2?=
 =?us-ascii?Q?T6ps5ZNL+INU/EovTXSquw6eVc8ZQRWcF/pI6c6T4uWIoS3nvliM+ZwG7F9D?=
 =?us-ascii?Q?Ga9w5qlEa1koT//3L6pi3pEz4YXfBj6GnXsTSqd9aq9HrmHoUFbhYiDFV/eI?=
 =?us-ascii?Q?NX3xQ27KKeZHP9W+6AblLycsPrfOyYq1s/TgV0puEc0ogZEdZplpTf5jUgRc?=
 =?us-ascii?Q?TMYMc8rsLXFcqfF0Dgh6yPegnB0C0vdLzSbZeR9T+xJ3ojs5Qe0qsgW6BOHy?=
 =?us-ascii?Q?IXmPzBesuyi43xTIoD69ABJDCzWTrTu68G1NloJBO80+7RVFdPTgD3p2bV8T?=
 =?us-ascii?Q?HZhtAJGqRexA2468xNCutFCcwO3yQ5eDVwBOO9Y0JVxhoLNwG0xPkKpaNweA?=
 =?us-ascii?Q?ysOEW4sU8dAHOhcGbVyyAi4fdASP6NaPyryXcWhdKhjS+Wz6BiyrYUIaTYQO?=
 =?us-ascii?Q?nw+GZ+7bNsUWeBOydIoVWrjcGPiUYynM9/W7MS2yYlqCX+OZtveC4rzu5HNU?=
 =?us-ascii?Q?+yNtUwgk33mU0h0h/8Fnhaxw4913Wjy/r+D6RmrpMBzRKn2T/3QC1oP46t9/?=
 =?us-ascii?Q?mCF/MOHt+r4NxbAn1d4+zFD0xZgKcs+/FyNjYGspQgdlKuYKGOGwS5+alrSJ?=
 =?us-ascii?Q?SvUz/ofygkHRAW1OdJqCaWbvnsubKocIKup2A0q6vs0mHBloQVxyvtfAZ2+R?=
 =?us-ascii?Q?SAjJHK9MGIwkkT1tgBjUkE6NNg8YDafxs24KA4ND?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2380bc23-f256-4ba3-be41-08de32015ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 00:17:34.7143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/MR4tfXHVyHjTVVxv6ctKPqqhFfyXIFzscQLgP8qBNPvzubxI9VwntNVlC2ZMPzfDPeoX8cxCsMHiP1iZRk+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Nov 26, 2025 3:02 PM Brian3 Nguyen wrote:
> Add page reclamation related changes to GuC interface, handlers, and send=
ers
> to support page reclamation.
>=20
> Currently TLB invalidations will perform an entire PPC flush in order to =
prevent
> stale memory access for noncoherent system memory. Page reclamation is an
> extension of the typical TLB invalidation workflow, allowing disabling of=
 full
> PPC flush and enable selective PPC flushing. Selective flushing will be d=
ecided
> by a list of pages whom's address is passed to GuC at time of action.
>=20
> Page reclamation interfaces require at least GuC FW ver 70.31.0.
>=20
> v2:
>  - Moved send_page_reclaim to first patch usage.
>  - Add comments explaining shared done handler. (Matthew B)
>  - Add FW version fallback to disable page reclaim
>    on older versions. (Matthew B, Shuicheng)
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c              |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_ct.c           | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_fwif.h         |  1 +
>  4 files changed, 24 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..11de3bdf69b5 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -151,6 +151,8 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_TLB_INVALIDATION =3D 0x7000,
>  	XE_GUC_ACTION_TLB_INVALIDATION_DONE =3D 0x7001,
>  	XE_GUC_ACTION_TLB_INVALIDATION_ALL =3D 0x7002,
> +	XE_GUC_ACTION_PAGE_RECLAMATION =3D 0x7003,
> +	XE_GUC_ACTION_PAGE_RECLAMATION_DONE =3D 0x7004,
>  	XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION =3D 0x8002,
>  	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE =3D 0x8003,
>  	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED =3D 0x8004, diff --git
> a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c index
> d6672cf30d3e..89b206c1eb86 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -767,6 +767,10 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (!xe_uc_fw_is_enabled(&guc->fw))
>  		return 0;
>=20
> +	/* Disable page reclaim if GuC FW does not support */
> +	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 31, 0))
> +		xe->info.has_page_reclaim_hw_assist =3D false;
> +
>  	if (IS_SRIOV_VF(xe)) {
>  		ret =3D xe_guc_ct_init(&guc->ct);
>  		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> b/drivers/gpu/drm/xe/xe_guc_ct.c index 02b4588fece0..b9e406d69414
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1369,6 +1369,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
>  		g2h_release_space(ct, len);
>  	}
>=20
> @@ -1555,6 +1556,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> +		/*
> +		 * Page reclamation is an extension of TLB invalidation. Both
> +		 * operations share the same seqno and fence. When either
> +		 * action completes, we need to signal the corresponding
> +		 * fence. Since the handling logic (lookup fence by seqno,
> +		 * fence signalling) is identical, we use the same handler
> +		 * for both G2H events.
> +		 */
>  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> @@ -1720,6 +1730,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg,
> bool fast_path)
>  		switch (action) {
>  		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>  		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +		case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
>  			break;	/* Process these in fast-path */
>  		default:
>  			return 0;
> @@ -1756,6 +1767,12 @@ static void g2h_fast_path(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> +		/*
> +		 * Seqno and fence handling of page reclamation and TLB
> +		 * invalidation is identical, so we can use the same handler
> +		 * for both actions.
> +		 */
>  		__g2h_release_space(ct, len);
>  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 7d93c2749485..5aa6fb249be9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -16,6 +16,7 @@
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> +#define G2H_LEN_DW_PAGE_RECLAMATION		3
>=20
>  #define GUC_ID_MAX			65535
>  #define GUC_ID_UNKNOWN			0xffffffff
> --
> 2.52.0

