Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6026CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 14:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E01310E147;
	Tue, 14 Oct 2025 14:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4C9CDzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E0510E147
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760450517; x=1791986517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wrBu4J7d8dyFTuZ6T9DUnK1GOKI7w0O3EDWR3ry2lTI=;
 b=K4C9CDzctI7imadFpWvLes2rXyiHu3vJQAEkO7SiiX50xSCPku+zs+3+
 MRoQPP/Jwkib9fl7BAY/oh9bWFB5S0RQKUFngvtNfovfet6vCUAG/AKlU
 ZpSy8YLLXsw1FuTexKx/lH5Tk+0w9DcOlclDOoc6REYYYqPbJEKzcovub
 xmboNNFG70fMmtLVZc4RGbUshfQ9D8hjoJmdoQhnqcXoK5gpSPFzlQUQW
 QIdSvBStdWHV87OGHIxQqkw8+uIVrkVxc1BLfUcUpTo5TJTcVvEP8Avfk
 q8FyajDxydCVkJXnV/KkoJDL8MWe2lOU+8DJyQw73IvJy5X0TNV+FydAf Q==;
X-CSE-ConnectionGUID: NrF/BT+zQeeMfpDdI/0vUA==
X-CSE-MsgGUID: l8h1bcSPQ7mIopfC6c8eeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62759462"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62759462"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:01:56 -0700
X-CSE-ConnectionGUID: gnWehXjkQhGzDsY+yyFjtw==
X-CSE-MsgGUID: +7ACMqxBR+SSrbsGtKDlYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181842662"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:01:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 07:01:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 07:01:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 07:01:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0krUdE+CoARAjm7uVJZ9CD5GLT88HnsYr4hd8KCrSQ2vpe71EgjVCuN0Mr3Bjs8GZobmy9NF/xmgHyVwlmd61GxincWaalsKXbJRGV0pKlgOxmWpajhlRgErZ/tXn1AMCWBudIDUonQK3OiX2dAUMn1EPou3qnDyUqLQAZI9BeP7c8ktdB/tKt2CA8PdRDZpyN3aysgDzOqEXdZ2aMMeq0R9KRINDEnDOcEYo4MfkGHNWIjcaipqYrYm+X02awT7NsT0WZh8HX+QnE96OUK6NHdbB890HDHWAoSGmd6HnmsSRX5bVtl59L8NB3xVN7IFz86yNRuRcX47mNDMdyoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFDYwaWC52QdLt+Ao3UAxkkD493gsIH97hWlyYkRkyc=;
 b=V5FlqiSctyx+bnGdZuDpgUoaCvgWfIQeor7xcLk3ioApwGI8LYXbzRgBPRzK546I0lrZG0Uxlu3Ut57m9b6ZWZZw8FvaBR4gjRwed7au6O0L4S73yc9LQ62l7tOt/ySQMEAJPWv8OwGdiEPiljYcaXj528cnyvq4rlxAosN1jiqaSMba+KwfxsProNsY0BSyaJ1M0NzKssfHgA0F4HWDHVudY/IKz8x4EhN9tjld6gTTs9fRV+XnOP5TBN7KBLQweeexj7pEKl2ye1p3DjtqrpA6u45dv8/QSYbFV0f9NgV+ay+HDTPqGB/FptEfSnwot38q+vZFL9+PC4Iw18R1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 14:01:47 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 14:01:47 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Lis, Tomasz"
 <tomasz.lis@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block section
Thread-Topic: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
 section
Thread-Index: AQHcDZIUOsvG1ggVzUyz8/qLFFc3p7TCCtLA
Date: Tue, 14 Oct 2025 14:01:47 +0000
Message-ID: <CH3PR11MB84348297B0CE882D299660C68DEBA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250815030936.2387322-1-matthew.brost@intel.com>
In-Reply-To: <20250815030936.2387322-1-matthew.brost@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB8081:EE_
x-ms-office365-filtering-correlation-id: 0797143a-1d1f-4ac6-2fd2-08de0b2a373b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4LHSOx1e9uOPeuA+38OnkMnc3HYl7CLP3GQWre6JfUAnz0MjyeZBeetI+a2v?=
 =?us-ascii?Q?TpiCdV1U/iZlh7FHOoQ+nP+KJRsbvUeccEq4LYGt9fq3+mM0BanH9q21QWHf?=
 =?us-ascii?Q?jHJATlnQRxcelbYJHD7RIb50OV8w+EtZQ9xSmQhvN5HewYioFt9VhSp9aAf0?=
 =?us-ascii?Q?j7+I8l86HOs97cNo80rg/wu7QyoIwV+0eyCES+XOrultHfLlrq2kVuv6tV4w?=
 =?us-ascii?Q?v0b7NTdeR1Ih0kdhK05aMeguvqIM2t1MNJh04lwSEoLrsOBQl+JVEa0XE5YV?=
 =?us-ascii?Q?p00FHbLfYW/AtJjrtjifRfB1mI92Vlx5bjkugrcnAHDWsUtoR8oV0GZegllW?=
 =?us-ascii?Q?c2zOpvcLB28audrQqYdqtIllWi/fpO7+6etF3tBZSVdtFctZ0mdm1v76XIyO?=
 =?us-ascii?Q?SLxiTQNUqCPnGD1bClD91lodDeFqtjmXhyMZzruxbLtW08wVK4EjJ9fI1eIK?=
 =?us-ascii?Q?rDxrd929FKUo9D4kRAmgvsEO2P8ibA8+W2JsMWFaf1RYSSM1ei8++VqXrKuA?=
 =?us-ascii?Q?OLpXteFp68Zdl3ZMnP30vF5QuuR3bMLCD/2An4ziGCKoCRXHle0n7TDmLuuU?=
 =?us-ascii?Q?PdbP6CPb6qgg0p+PbRBdk7RLBCaAXdyIr7v8ZB2wYzaDPkWFHRvt7LN9kyg3?=
 =?us-ascii?Q?kXSQZbviWSY4JXJA9AJ0qqVHvDcT7DoMfDtkOL4GxCEtujcie8lmo7lrNZXI?=
 =?us-ascii?Q?yTuB4xlHDFcHDnqOAtH7M23jM50ITJI4U9z5RMO1HCixHmkmaAAvcRaHFHRl?=
 =?us-ascii?Q?JAnlwteIRqEHegPg8MT+v+gGfxhmJkEOxrg0JYwFWzSutanKB6fiJn7Gn7P8?=
 =?us-ascii?Q?mUdVKKSTTzkiKhPWbpDgRgZDLiKEq4WfDMpbekOopAjyNfGaFlVG+r3ArdMT?=
 =?us-ascii?Q?fabR25Xv4IJxOgHHdgVqKw951wj2qlpFDGllsWiPEFJqmHryxPhp4G1k27BC?=
 =?us-ascii?Q?ZIeme+EYhMDINVxpnTIQYvO6Xrt8K8tLmRtrAUureFWLF/VoOolju51N53jA?=
 =?us-ascii?Q?zoE6yUQzq1zOR4AElyulXjm9wMdeKklItGK3XgYJl/hNuaF77vVZJ7ERB5LW?=
 =?us-ascii?Q?v3rdL2zKCeLF+76VHvfqiSgRPmguD0YX2UO28SkO9vZeTRNV7WmajzR4E/tK?=
 =?us-ascii?Q?RYczwHMuf6NtfEtIc0+ae+ltRkELNmXQwM4C1hK0INUIvFCW8zZz6RhQNUL9?=
 =?us-ascii?Q?cpVyFKAwVw6Q6i2pYaFmNMFO2RB3ycOcEQI4G7rfNIYKt1m7bA9eJrWn0r0C?=
 =?us-ascii?Q?dw5uYutDQiihYNE9XN9SXUWdDFyTS5hdQa9NFxLpB3cEy4wCOPOarES6l58+?=
 =?us-ascii?Q?Y63WEiuiM4m2Vx/GK34pkQIy6zsko0Y1zjXsHXIVyZWb+G47h4OQ7dQo1YND?=
 =?us-ascii?Q?VItXs+7cS2YzPkeiMkY55Eq138kl3O5sbYMhSql3t4tnpfxZopCi4IYlAdyP?=
 =?us-ascii?Q?LiwQQJR1OSrAjZcqF2HDRahLd8UGW93utXeGTVvGF5UKdYJUrm4hS4/nhjVO?=
 =?us-ascii?Q?jYw3Rcw+dv4sRAgEn1qGuU9N5H9qdGioIkTw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jxEQXi+tJLEDEghiNYusCbTgVdCSJJ3bPpAzDjLDRig9U1Tkg8/1yYQ7OHeA?=
 =?us-ascii?Q?l0DgYBiQiMvYKRUTe7DiWCvSf9AAC50XRmqG+VQWQrwwH4wK4Km442RsitFJ?=
 =?us-ascii?Q?kDqzW+5vd06aZ4E4482mO7lagdkY+iWQIr4g71Tyhm9JpG7pACMDQ1diGXr4?=
 =?us-ascii?Q?a4Xv1TEJLrlKIV+nwvt5wsa/jhnmeZE5doZ4X5hpJqutAd8lGd/Z7LI5JMw3?=
 =?us-ascii?Q?Xab9chkVqZG0fIypUSi8qnzkShwMRqvsCwJJrb/+eF4OKBBVUbBTcbwCDhwM?=
 =?us-ascii?Q?TufFd8LI2Hijwvvjuonq/2x0s5wH0LDDzgc+v5D0bPXbHDYtIBHrrO6XIkdE?=
 =?us-ascii?Q?8cHHUCtFKTa67EKwtbRS7zPwW6v2OqZGCTDVSRm60L6BWDVYBDDPGNqpF+UO?=
 =?us-ascii?Q?Yhsf6QC5hSCRj6PUwVPXEUTtLcKJinYFdO1l4JwXo905oGTfwkvFM33yizYm?=
 =?us-ascii?Q?0L6U5DbI9CJ1+PqOTYSwjmbpQOuddIpLrD/RviQteUByAF26rx18XqE1ybhJ?=
 =?us-ascii?Q?viHR05HhOxu4Y/0neYuSbA3CORyQVPBxg+OksnENWZHCp1Bf8flfzWwZFaw1?=
 =?us-ascii?Q?bpJSUK1x33Fl5ftl8ubfBwmZ7opbipB2NVGUfBke2XpKrZX0yclRIUhHh63p?=
 =?us-ascii?Q?Pz+HHrDuF4BeYW5O861f8y4Fl8rvFmNI7mnCrvBif2/0HObz/JRymrsokcbC?=
 =?us-ascii?Q?Kwe/0gWy+vTS2+muCFMI1Tb/faZ0BcVxGPHVTqziBLo87o1ocE4VjjyzR2bF?=
 =?us-ascii?Q?Wtgq9Jk0k0FMHrc73R49Op+YGPx5TM/98N0f427PxzRbxs3Yw22L6AE7Pabe?=
 =?us-ascii?Q?MXLSaZoeRjKfqhGkaSet9EXpoxjQAUjTZPYBTz2yjHqft2aG3L0bH5skGCeZ?=
 =?us-ascii?Q?AZ/MSwzTDv45puv2+r9ATMd5dK6O/64+NCIh80eg2EqvN/VQZONEAkGslUU1?=
 =?us-ascii?Q?jeIMLgAG51wmteAyCU5xBCTJMV7PuDlRQXSnsK9Gh/3QDOiTFcwBatxD2TC6?=
 =?us-ascii?Q?v3u0vbDiLbDu62GIOOgmo2V4E3zU3+SMxjI+s8FgbbZBN5zKY/NFfExAk/LF?=
 =?us-ascii?Q?ZCubK6sEunZ0/rGiCClLA/SNsvlP8Fap8uvjcvj/9CNJTtaliG3dBzbfM6Ve?=
 =?us-ascii?Q?8lG2Kp3cZly1OlML2QLV1iwfFZ5CTMB0Y7eFBckiNao4mj8QsKLFIBCQ9rZe?=
 =?us-ascii?Q?4L+t8fxwN0HXYrzQFk5gzKQGxXHciovMA1+4idjWQubrH2LjgYVyEjed8OsH?=
 =?us-ascii?Q?Mtjppz1Cqgu/hovTj2MpWWf+r27a2/kasdqolmn7M/K3dDMcNtxxczR46em2?=
 =?us-ascii?Q?KhLzOQBhyCKqcTUHHNR10dMBmUuW2/b5fJ2VXCYKWmv1iXUrqZem9k+P0HlU?=
 =?us-ascii?Q?W4o8hh4VWWU8ATtli1rlaBwN1KTASxl+5BIHfMKES3dzrJIBBLjUHEltZd2O?=
 =?us-ascii?Q?eeCqzmHImxFDJ+pPmxh2NKyJstVFnOY53kJ9CreNF8zbZu/F3Dg0Mq2vTqN1?=
 =?us-ascii?Q?7SWVy2hX5JRSzhTUZvDUyjlrmL95rEis8JCYvnjgtFiBw/aUG2gwsJhJ8VyG?=
 =?us-ascii?Q?4/5B18qmP9oZ/PPNRhw7agRF2av0VP/2S7+mmTBNfuAkILJj4gsPKExCfsVo?=
 =?us-ascii?Q?GSqe6o4Jic2JrXit2fn9jiwStHSrNv70biLLOYi/6VD7Cm5hneJwvuzLU5SI?=
 =?us-ascii?Q?Y7aHVQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0797143a-1d1f-4ac6-2fd2-08de0b2a373b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 14:01:47.5749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FWhqq9sIOwIwqc1a7NxPlhqUC39IBuqFqhrmyJKMbtsmlR0hKGgz8KBIjQuJ/oSWQ5gCPETK1MSsNuynyUCnveN/Mi/xJBPIghVemgbgEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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
> Sent: 15 August 2025 08:40 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> section
>=20
> The non-block will become invalid and hang until the test exhausts all
> memory when LR jobs are tracked in the DRM scheduler.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 113 -----------------------------
>  1 file changed, 113 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index b904dc76b4..316f7322c1 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -320,116 +320,6 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		close(map_fd);
>  }
>=20
> -/**
> - * SUBTEST: non-blocking
> - * Description: Fill the ring and check we get expected errors.
> - * Test category: functionality test
> - */
> -#define VM_DATA		0
> -#define SPIN_DATA	1
> -#define EXEC_DATA	2
> -#define DATA_COUNT	3
> -static void non_block(int fd, int expect) -{
> -	uint64_t addr =3D 0x1a0000;
> -	struct drm_xe_sync sync[1] =3D {
> -		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> -		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> -		  .timeline_value =3D USER_FENCE_VALUE},
> -	};
> -	struct drm_xe_exec exec =3D {
> -		.num_batch_buffer =3D 1,
> -		.num_syncs =3D 1,
> -		.syncs =3D to_user_pointer(&sync),
> -	};
> -	struct {
> -		struct xe_spin spin;
> -		uint32_t batch[16];
> -		uint64_t vm_sync;
> -		uint32_t data;
> -		uint64_t exec_sync;
> -	} *data =3D NULL;
> -	struct xe_spin_opts spin_opts =3D { .preempt =3D false };
> -	struct drm_xe_engine *engine;
> -	uint64_t batch_offset =3D (char *)&data[EXEC_DATA].batch - (char
> *)data;
> -	uint64_t batch_addr =3D addr + batch_offset;
> -	uint64_t sdi_offset =3D (char *)&data[EXEC_DATA].data - (char *)data;
> -	uint64_t sdi_addr =3D addr + sdi_offset;
> -	size_t bo_size;
> -	uint32_t vm;
> -	uint32_t exec_queue;
> -	int value =3D 0x123456;
> -	uint32_t bo =3D 0;
> -	int b, err;
> -
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> -	bo_size =3D sizeof(*data) * DATA_COUNT;
> -	bo_size =3D xe_bb_size(fd, bo_size);
> -
> -	engine =3D xe_engine(fd, 1);
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> >instance.gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -
> -	data =3D xe_bo_map(fd, bo, bo_size);
> -	memset(data, 0, bo_size);
> -	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> -
> -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> -			       addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, NSEC_PER_SEC);
> -	data[VM_DATA].vm_sync =3D 0;
> -
> -	spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char
> *)data;
> -	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> -	sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char
> *)data;
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D spin_opts.addr;
> -	xe_exec(fd, &exec);
> -	xe_spin_wait_started(&data[SPIN_DATA].spin);
> -
> -	b =3D 0;
> -	data[EXEC_DATA].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -	data[EXEC_DATA].batch[b++] =3D sdi_addr;
> -	data[EXEC_DATA].batch[b++] =3D sdi_addr >> 32;
> -	data[EXEC_DATA].batch[b++] =3D value;
> -	data[EXEC_DATA].batch[b++] =3D MI_BATCH_BUFFER_END;
> -	igt_assert(b <=3D ARRAY_SIZE(data[EXEC_DATA].batch));
> -
> -	sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_sync - (char
> *)data;
> -	exec.num_syncs =3D 0;
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D batch_addr;
> -
> -	while (1) {
> -
> -		err =3D ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> -
> -		if (err =3D=3D -1 && errno =3D=3D EWOULDBLOCK)
> -			break;
> -
> -		igt_assert_eq(err, 0);
> -	}
> -	igt_assert_eq(errno, expect);
> -
> -	xe_spin_end(&data[SPIN_DATA].spin);
> -	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -	usleep(50000);
> -
> -	exec.num_syncs =3D 1;
> -	xe_exec(fd, &exec);
> -	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -
> -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, NSEC_PER_SEC);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -
> -	xe_exec_queue_destroy(fd, exec_queue);
> -	xe_vm_destroy(fd, vm);
> -}
> -
>  #define LR_SPINNER_TIME 30
>  /**
>   * SUBTEST: lr-mode-workload
> @@ -570,9 +460,6 @@ igt_main
>  					  s->flags);
>  	}
>=20
> -	igt_subtest("non-blocking")
> -		non_block(fd, EWOULDBLOCK);
> -
>  	igt_subtest("lr-mode-workload")
>  		lr_mode_workload(fd);
>=20
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.34.1

