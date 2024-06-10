Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC41DC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AA810E18B;
	Mon, 10 Jun 2024 16:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yo2gT+tP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A394810E18B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 16:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037591; x=1749573591;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eOA0GAodZhqXs9yCo/6LnU4galOPPvt7eshvjbbznHI=;
 b=Yo2gT+tPc5GWq7AkV7fgOodHBGVsWYKFmQQE6TUZFJAitV0MFOXVz9nv
 3Dn+Uv45svJ6SSo7zQ0+fOenvTiHFAfWhSy2tlA5fDhVDDFFq9sILhtkx
 33AOlKZG0ZuPJqHJ4oyM84CEHv7M4s0gv1p5smLp+9WCptdSM29QNERaV
 FUkNHybXxfNA+Y/xYvE59VOZHEcPHjRbJ/xt6O7alEkv1UEjTxDOwNOn/
 LxUZjRwHGW5JSz6Ko/1hde8oiq8omHLJc84sXGPyXEiBhvHnDsS708RrI
 29bCWYtC8I2iDKjPb/0tqLxOQDs6wH76sxGFSMOyNxF0eVwAsjSold8kn w==;
X-CSE-ConnectionGUID: VdUkCdHWSzOd9sRIdpIkCA==
X-CSE-MsgGUID: e2ae/Dz9QyusEiZu4ky1YQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18540951"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18540951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:39:50 -0700
X-CSE-ConnectionGUID: KXBj1STxSfCtP4F1KArwTQ==
X-CSE-MsgGUID: jTTGUAaATGSc/zXDlbVJLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70285262"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 09:39:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:39:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:39:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 09:39:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 09:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBNVU5jha/votu3vZS4NKb7pxhkhxS7GFd++HjJ4S912YH1cZYu7dverE+6Ta04JKkL2yzTKvgfS1P/3WpnB91Nfi/qmzL2961NjzetnYAJkFHQ9RJDOSKGuT4u2ZvZRgQpHmwii+4A4Pcn/nFNk2CfxyRB6nCSzSWJUFgsMEI7LmHOs/1TXflkmDIN/YPHPcWXEdJy6jHBe6oVS7/ABAFrhIzB7kAfSiodWLK/gPhyvrYJnXoeR+TeQh2RYmQrJQbOAsIWpzEm6n0SmRx7UkKKLzxyX0nTho7u3WlKvNREnDde3a/rbYUapuHLrpF5baBInK1GAzsO50hkuZthqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk+Dzvun4Ay9/vHgfBAC+wBTeA0QlYFakqkzDHytM7A=;
 b=fv0yMkPngYMf44ffhXu+GkDusBM78uc2wsLovm7gio7WTrbf4LDXztUOddXYOjT/wpiKpkcFRDrlpIHdWmkbiT4gX0q98jOCvwmg2lBSgQ7xdlA7NYYDDh8g+PuBQvKpm9bsWaXNUWNVQv0wPQdiZ3JnHOpMKNDQBSM8B+NkB2yy8oHhVaZey/dnEwbWRK5y2wAsn45PNWJyadHKCJN1hqs2l8e73beRNJrpg2azwACvS9OqVdRGrF7FbWwtz/9C3z5BoQ7MrajndqEc+NFFB9LKmWxyeZSD4OfAOOvpku8pg/5EPRgp5cnnunyhSNWWl7sHcSa+ocdmidPtikkKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 16:39:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 16:39:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 02/10] drm/xe: Add MI_COPY_MEM_MEM GPU instruction
 definitions
Thread-Topic: [PATCH v5 02/10] drm/xe: Add MI_COPY_MEM_MEM GPU instruction
 definitions
Thread-Index: AQHau0EYW17cTX6DkkOsn7H95+SJ5rHBMj1Q
Date: Mon, 10 Jun 2024 16:39:47 +0000
Message-ID: <CH0PR11MB544459B7BB2433A97A956769E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-3-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB5044:EE_
x-ms-office365-filtering-correlation-id: f1ab5f87-930e-4ad2-31a5-08dc896bf0ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?0VkDmB/RblIG+60dvQaajI8v2+MKfcsFZIgDhYAjMjqAShBAH8DyxBAJyF0f?=
 =?us-ascii?Q?LOhMuuGWg6mjHfw4qmQ98eNJFjVR7HOtKtKBCtWWLXAldCs8vObwUKZWSv5T?=
 =?us-ascii?Q?dbxlibWSpcUGhv4/QK+Qwt9FYfHXvyasOWBRSzGdtZvj+MikxyMIiUaejQGB?=
 =?us-ascii?Q?C0LWy+Iqyssh9qVH6+Eqx/dz09cj03vv1mYxRxE/aJI0s+o5/wrnYY+Ap45b?=
 =?us-ascii?Q?JkkmQxZRohNRmh+DMUvn9Q9WrPBMHp/hCnhNKbWswMP/afbSl+NktsxNfrWj?=
 =?us-ascii?Q?Sr51xM6UL0AkSEHcSeLzgf1eKTcvGAun9xQiv1UllSF2SioGJKcbYFxsv8Q5?=
 =?us-ascii?Q?W77BjEhiBmgFdFmdUBbVnbtzCp6kq9JFsGonq+2oRbXNLj9pbvgZx+M1PaJP?=
 =?us-ascii?Q?2gHWr//jhw58Q5Elmo0giOfJg+8Yspl9BsNXh4jVpAaOyRumEKIRTecLOUfk?=
 =?us-ascii?Q?oQ0KAub8TFv2AD5IZSKm33TjbCKV1ChNFzLy/2G8W4vbv1sXme6sVtrs2elO?=
 =?us-ascii?Q?8ViSy/6jXRG8kChTUPtuuIWjUSRekFurBO4Vpa+854fy+gRuBgWvwHoP69jz?=
 =?us-ascii?Q?VI1cbV/3kZSFGF2T1M2Iu/MACuzNnELQA71TdYxPci94in3sc/fXfB67gYMI?=
 =?us-ascii?Q?7wCpVOJPrKNY3d3fTk6KcaJ+s84+ItS+nB+rCIZt9P2VQSIPVAPbU3Tf0dNQ?=
 =?us-ascii?Q?DMUXHMWZSQvMdcQv5ao9I9n0aOf8B2snnhlUBGvngv/o6ZjLUA+sLFTBZXdj?=
 =?us-ascii?Q?cvNxEfUlt8j2RGpjFy4Bd8a18fJBfYJCEsDp7jd3CNaMwqXiI8fNMvVv07IC?=
 =?us-ascii?Q?VPK/zygYAvha10G05GuFf4OEarz0rajZDONDFREWRv+tK422KppLWvxNP8JG?=
 =?us-ascii?Q?IvkikzwuZ70/NojUSNp71bgtKawN3zqDXJmArc2z0HBedXQgc+HF/F8b5hwd?=
 =?us-ascii?Q?Osqh6gTBEKq3Ma9/J/5dCKdj8QaDfW9Um9NpguHjnB0gAavTkQeu+dWiWjKM?=
 =?us-ascii?Q?0aDbxRcm/tchepqKoOqaYeBWzwroKCPpPIVIe5UWw1Fjn1bD/z+Ut0PXe2Q9?=
 =?us-ascii?Q?Fa6Gfa211ES/ykscTndNR8sOoaL7C4lfBFck5kHCMoz2XVVqrRsFRxdI9diE?=
 =?us-ascii?Q?fMMAL/+jbbvIAWmOjXwqdNsvpRNGfCIzsaqfov7zLK+3s3OYFWF7C1joJj6K?=
 =?us-ascii?Q?dGodz+vCCGHdatGWZYEdBPn/IRng5Xq/VtD6cXk+eo7oF0H8Unge0rCem5US?=
 =?us-ascii?Q?aLAR3WQMuet3gTFGa+BfdNB6Rjc5hun+Cua22zTg6tBZEdpFxZGObl90K4yF?=
 =?us-ascii?Q?RmHKVrLxQBjyTm0rHIpkcqRycqOTjIBqXZadhvyoppJIrvKnbOzznOFsUKfv?=
 =?us-ascii?Q?g5ajKyw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wXZS/dXzniHCnQgJg06MWaQc2HYT1kcEIjN6yEbK8/6qhb9WAnShIyXWOiTL?=
 =?us-ascii?Q?Hs+Fkq5+xKR6lpAfkBvZhJr1FmJblvE8HL3ZHG0l/mKCuBREvxSDEjjEn/5x?=
 =?us-ascii?Q?E4bawPFWopfx1mNb6EPHuTeYX8k5zljcGDCFXFS3l4M9W6YUMwyYDiDEujCh?=
 =?us-ascii?Q?8hBjasS9TP9xM1aztAXZoQb/h3vvjCmct/CBhmGRBjLpS3ZcTWvna5XmyO9r?=
 =?us-ascii?Q?AlOMLymrKgNrLdKSgiahy8Q6cRz8bA8lYEA/o4riphi4D+HQQ9mZ2b0B1wWx?=
 =?us-ascii?Q?5aN8U+LqsEKhYrRP8hs3drKK9ceOy/dwhgrHBRilMiRl+uXoGb8aRiKHH/+3?=
 =?us-ascii?Q?g+NzOmHD8NNiwqdiU7vwhKECsbQIT4t624hY37MRf5C8thegqdlOOMJ92JpO?=
 =?us-ascii?Q?As5t+vMhOnLGYQzDRUrbFW4zO0Fv09ZVEM/a6tsGx0fNsu6v0xt8l0Ibemlr?=
 =?us-ascii?Q?58aIIz6837CimhvrOkDgvFkS79SihphEjaR4tniMGszuLthyw7PyUcgsqmc+?=
 =?us-ascii?Q?+nkJvjLTGNT7+0yQ8oHf2OoizH4sKKOiNsmN5KgJFNPvIgs0VryaVBuEZxDR?=
 =?us-ascii?Q?xCpDcTV7/HO630+WykewXEw7mUXlB6R5GwSOwYG2RIB3GUl8yipUU/JZpxfR?=
 =?us-ascii?Q?zdr2fI2OJEvOG0zQAZt5WJjbM8rxSlvgYyb6F1GnTAiOUQi2MIRFLAN09GuL?=
 =?us-ascii?Q?mb7rPD1NP8S1nOrjTCm/oWHSmlawdmh8PDbMSsvphGfnW4heSgWe7d+8Uflf?=
 =?us-ascii?Q?ECqOgrCcM1EQL/thIBQ2+dyo1WBCokMv69uMhdEi6OQ8Vv1Kp46zX6ihpK+C?=
 =?us-ascii?Q?0JwuqfeQXZZe0j2BOz/2VwcrBbh8r2w9/+JxhunDIKCnUm1vwQdASLjeMkz5?=
 =?us-ascii?Q?W4Czk+HACa+9wanhjKr/caq9GW+Bs0JE2zo57uNN6oRV8eIz0+zpR/Ikp/lq?=
 =?us-ascii?Q?AAauXDusupQd9Yh/NWrvSKbGOFjZJ4qr0ycYQ+YOD7Bs202p14GqOSURU/Cv?=
 =?us-ascii?Q?ifI+PvVM8LBhSp8YckJ88M2skLZFePgekfIvy93/F+mjBXC6voWEWnqc1jJa?=
 =?us-ascii?Q?UdIVEk1o1aWEMZKGdZO9xCGPmPAyRVgXBEqo1Lgtrbp/eyB0Ij5Jumi2n0Lv?=
 =?us-ascii?Q?VeMH3LtYKMXUionpmISnuufzyKoCkZmIKmZzwfCQdTJ34Ef9nsuSJED9qmvD?=
 =?us-ascii?Q?e3LzyOyDssACVr0FBSx9q3io1IBP3vyyb4tvYRqgk9N0N1ZOVn7DPy1NX/YU?=
 =?us-ascii?Q?2PHeYmKxl64WQV21Wsxyi7ie8Ck09DTaWwKbPAb5V7f1e5FsL6zCiPL0l/iF?=
 =?us-ascii?Q?TzaaL16+5OQEO+u1fDnhNn+hq/vnQeuaojyWjb0cozL8UbuI9fmn/7JTNrzV?=
 =?us-ascii?Q?npwnQhDQXLHbD+dQBWo68jAQjguaW1r3jXopQLktE5bDRIEmZnGDidSXQ/9y?=
 =?us-ascii?Q?MJ1lg6we0upkUx1FDW7lqW/jTzhuZN00T68ybk+56y6gfuAxyXqo3swf3NDD?=
 =?us-ascii?Q?X1OfY6+YSUzZuIME+PzIuawv5+rgum+xrXIW0pHTgSgJKx6HoMPGKd/FzINR?=
 =?us-ascii?Q?huJP9G8gBHqe7Ao6m/EWPzETzLnElAt+iYoe0orP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ab5f87-930e-4ad2-31a5-08dc896bf0ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 16:39:47.2156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UlDoTkP/V9DwbA6iuz8BJEoeZGFwgKB6W7Sy0Y6xRge5/XZYRCkfvMbwf5qD5BV0cem4OhICpW0JVYBTSrCTlDCOOl9AzsqcmXytQ5Hp5Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew Brost
> Sent: Monday, June 10, 2024 7:18 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH v5 02/10] drm/xe: Add MI_COPY_MEM_MEM GPU instruction def=
initions
>=20
> MI_COPY_MEM_MEM GPU instructions are used to copy ctx timestamp from a
> LRC registers to another location at the beginning of every jobs
> execution. Add MI_COPY_MEM_MEM GPU instruction definitions.
>=20
> v2:
>  - Include MI_COPY_MEM_MEM based on instruction order (Michal)
>  - Fix tabs/spaces issue (Michal)
>  - Use macro for DW definition (Michal)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

It might be worth considering having these definitions included with the pa=
tches
that use them, but I can understand why the declarations were done separate=
ly
and agree this is probably better.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/g=
pu/drm/xe/instructions/xe_mi_commands.h
> index c74ceb550dce..b7bf99dd4848 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -59,6 +59,10 @@
>  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>  #define   MI_LRM_USE_GGTT		REG_BIT(22)
> =20
> +#define MI_COPY_MEM_MEM			(__MI_INSTR(0x2e) | XE_INSTR_NUM_DW(5))
> +#define   MI_COPY_MEM_MEM_SRC_GGTT	REG_BIT(22)
> +#define   MI_COPY_MEM_MEM_DST_GGTT	REG_BIT(21)
> +
>  #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
> =20
>  #endif
> --=20
> 2.34.1
>=20
>=20
