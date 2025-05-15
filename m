Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4487CC2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 13:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109FA10E880;
	Thu, 15 May 2025 13:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbcfvI1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD4F10E880
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747314992; x=1778850992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e/chbAD82WDRuqYiCW6aumRhFo3iJEHvrUcp/c6bz/E=;
 b=cbcfvI1cweBWmy+3tz6snvy6Ru76NWYziRIk0l6mXHOJ2RSnwx6W5FQ3
 1vWp33xS08d+73/ebV87jc5j8y8WGS/5G+T4zOdTh71hmItUX74ys+xfD
 PBsJZ1fwcNI1cgd3Nw4PO0MdGzzx4W4O5ev/heUnePXurtvhW7y6fS8ps
 ZCkMw/Ov64LcTp/c5b1B+EkXFPSYEbh3KkKZMaBrxaomzpIxSOsv1zaek
 6bWxYIXBHif4v6awMTbsKhU80LTBz2SautZ0pCNSGmqbEUVefsSDEpt3R
 AweEKMwjBjXa4SjaE7hVgyc4mqJ8Kc/Qkxk8npJA6XjFbGd6mZnul65Or w==;
X-CSE-ConnectionGUID: e8uu3DfUTfKcn3nUz+VEQw==
X-CSE-MsgGUID: k3GocOROR1ed1w0Jlj4Rag==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74652415"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="74652415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 06:16:32 -0700
X-CSE-ConnectionGUID: QF8+t7IjSa2wt0jyfpN/qg==
X-CSE-MsgGUID: XFZSRHUXRmSwpJoqfi7tiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="138421932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 06:16:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 06:16:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 06:16:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 06:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hd76P3r77OjZ16Vvax+jeTtoD16v1l/UfznSUa+lKMqH4BsQRayoGt9CmZygWKDJrCvVYsodjsuyWPJFNBerHZt2zCdGdiXrVNv9pccPjUhM0mgN7ym8Jwu6pxs/uFeDQGdBPy5jfwemAoG08sVq3wryhcMTAPqPO2rqhrVLa8FLZiN7HMHtMsf7mC4Tc0nzxNtQf+vmE4UD4Y5JDfICHkU3iumxmrG/Z/CZ0hDYpFIAxPP0ygIvppjzKPy3PgbkCHGDoPzgEQBLP7Tdszt3mSV65K5Yf2NMwwBi9nGRg5IM+T0piL22pF2dBsRfbubad61riL7NtDvnk2b1BQAH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Qazt3i273tIov0eN2oftaFm3OWI0f7Epr/dlbZ2gWI=;
 b=rij8ofJ8tKD/ReORBdc5VUacXRr7BBrDBH98HPnfDdN+2YRZxCj77a6T9NBDBIUbx416IZMFXVB5nyThydmCdYilHDQpZBR+gmY39R/HIN9+6AJBmYpROuSq2k2uEWOal9RIDl9GgFuKc5ERJhwFKjVqFG7I0q6GYXxUtVKmBHCiGQzbtwu60wJsHoLa4NMQSj0urTLveoBc/cW8zl52Rpg9e1BmwvrmzR82RMGCkA1h0PBUWeHsGUElvmm2b9TGkixIPAjcOkxlR1L07HMpOaPKK0qTPR9B5DN5WmPBId2i1P9QcAs9XPnBBXLXr0cV6Z+zLa4KFUPQ4yZUvHLNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by LV3PR11MB8556.namprd11.prod.outlook.com (2603:10b6:408:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 13:16:25 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:16:25 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
 conditional
Thread-Topic: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
 conditional
Thread-Index: AQHbxX6qbAfs9IXwEEK1GTN8jxJVVbPTq7LA
Date: Thu, 15 May 2025 13:16:25 +0000
Message-ID: <SJ1PR11MB6204CD374CDB31981218C7308190A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250515094913.2437-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250515094913.2437-1-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|LV3PR11MB8556:EE_
x-ms-office365-filtering-correlation-id: 2c305b86-7bd8-4dfd-b02b-08dd93b2b1dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bhIkdDxOieoPXNQjg6p70WM7KI43MOBk5VN/o4e0MSVyLml3OIpXgUDPQa/E?=
 =?us-ascii?Q?fYyex65E3AzBMtAOpRUWHU4ti8Mz76vbTlX8HhR+samtBOzMkZ/OZWk3njH3?=
 =?us-ascii?Q?Q9gWEyU6O6VljGtu6dofmnnvrOLy3NdhHtOR75H1Z0PZLdSyufWH4RdVMlDZ?=
 =?us-ascii?Q?IsekkE0iovS9smsjj5KsT1WD5cGx6lTPQhiAYVjeokwP46krG0A1OBriaWqH?=
 =?us-ascii?Q?VeKbrJOS9v4plDS+gKwQPEf0yYR3JbD6dmPSbqKiaxCF6u1rhzVkAvALFEEU?=
 =?us-ascii?Q?G1uvEsYpC8r17AkzAIpGXmJSowk+8MuJhDWTHDMoODzTeTyFA8zk+GJ+I0Iv?=
 =?us-ascii?Q?8x/1IjTfMfmWzXxWHByRHGMXATvkn9pHGn/Am12BlrB5S8gIr4N7e01X38dG?=
 =?us-ascii?Q?qwAgE53WFMCxbJl4MsHQbwb/I/tRMjvd8j6hcmGemgX3c23+bHUcuW5kJtzg?=
 =?us-ascii?Q?UFcRuFm5MgCAIUn42rGXcGEQN7GIBgMF4eDLG4G/T3DQazi77A0RmAx/FE2G?=
 =?us-ascii?Q?d/HFmUFABXPcnElYGI2sH5K2KivBKACcEyF3MUol1CraXSTlwP2vjnt7lO2b?=
 =?us-ascii?Q?J/EKl3ngPHq1smnXJLyjgv3q/5qQmJ9j4tA74TMatdUjrT+C5m/8Gh0eFxT4?=
 =?us-ascii?Q?gWV5DC/wnpAu+ticL8Ouemx8EwHNr3wy7EDYTji1X1P76d0RddKabsJBwE+A?=
 =?us-ascii?Q?t19f4fCAcQTdpC6flZMnjKwtkXHacmn6fkZ4XurJXfUVu+DpV6E1SqlvSqUJ?=
 =?us-ascii?Q?GL9QgXkjf1c5956oDf4LzMSuopSVoSyYLxtM8zj74irOxgqFJbT4usoWL1PI?=
 =?us-ascii?Q?ZWEPDaWLVq+x2iijiDV+mdCfsIedvxUyqwk1e09ZO3ObbxuLIp7nJ1rK5b0R?=
 =?us-ascii?Q?UoLmutpASJaBiCStD5wnXPw/zEQlXjYvwPn1N0nWQBDdeai3lJ9CfkEAaoMv?=
 =?us-ascii?Q?xRw5qw9DmNEP0nXBtAKmYZD2KEr4pjmRuyyNnDHOizgz/RexAvJ13p3ElL0h?=
 =?us-ascii?Q?BrQjEl0nElMpYeuRW3XVfhoypiRO5ZfZ7aAuM7lD/BbloF5kh4MUzKvQdNLc?=
 =?us-ascii?Q?Hc7WzfLeyScldvy+O8Lu8GBz+TiaQyeyVY7Ja3U2c95Ck49YsObJU6Hhx8wM?=
 =?us-ascii?Q?JyOBPZYywvxjmj3dbxoqpb0KU8cDEPi3oKYNQ5Tj9JOcM11n8+5S1vWEtRXB?=
 =?us-ascii?Q?dxe+mYS9n0dg0hDBraZOe2s+zzeuwhvwfWretjBgAnzTcnWn/qV/KUEV1WBx?=
 =?us-ascii?Q?tuk/G3fthpcY1HTN4eR0sRBAzQiZY5GzGghD5WcPQv+ShBTlTQvNfdJhfia2?=
 =?us-ascii?Q?XqiOKLefQ/7ljKQ8WYpxPQHlIxvWUNmJhN44ekOaygLjRlErckcBBhRonAGn?=
 =?us-ascii?Q?Ue/BXyTDDuGFbCv3EWda6SqP3hpGM67dUuUTfcVWyfN/YLq4oDTzt9V1bYpd?=
 =?us-ascii?Q?FMJN3+wIoPLFTbF5qUhUw4AZLWzPMiqWrP8jY9nqWMDoGyLNJjeYnWVx+wuw?=
 =?us-ascii?Q?KA3qzgjji03rjwQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hOqiGO3a3BRX8eSSnmHXen/KgAiwCN+4K38yFWvG0nTbsdF50vJ+t92FBOdd?=
 =?us-ascii?Q?PmQa6p//2tMqmdswudHUT5U+XnLimNUDB65gjyANwmLA91tKW+5FKMTsTZVT?=
 =?us-ascii?Q?YKuBlCxU+vDg1rjAR/wRbOHI9wpAAlQP2ypOVMzFrOCPym9nkR7VtudU9edW?=
 =?us-ascii?Q?RvRzDBojbVmLF7VNBizRrdbNpKp9zlzSdfkZEvtf+hLgzqKrCvPCUYoobOO9?=
 =?us-ascii?Q?StuXRlfC74y0HN6UGOLf0jHzVzczSyx6FcLGsBjkoWuI+T5La+USWWu9eLXQ?=
 =?us-ascii?Q?K6K7ff/WiTRTMQTDz9HMd4THq4f+mOiTnBbSDzpo8C6TAYwHJ/fTy23hhORY?=
 =?us-ascii?Q?ZDhwtawF/YXldDlENsDosdfeRlx5Sy0TVhmqQ/Wd7XniPEc0/rptHNfgpXWn?=
 =?us-ascii?Q?Pp0n0TuZIXQ4kw9SqpL8QtH+eOFLV6L8fSRSs19ooDreZxsTmZPNkFOBtM1i?=
 =?us-ascii?Q?/oIKI+5GV6W9M+ITj4yZL/0iDOX0OdtD5QrqeGtwdq2p+GjFz5CVSfyengfZ?=
 =?us-ascii?Q?JNAMvzZykZfMvFifSjRPl29RboNsZpf5257HxbO3Hu/hYIwTJymcKAD5Z3WP?=
 =?us-ascii?Q?NCZ80/LIIB9IANB/iMWt/f2b6xA6QQPReZEeouIr0+UDVmG4Vvv1G5nX8NyV?=
 =?us-ascii?Q?T7fe7gTPCGzBfVwjFTbUtwHcfGO/WMHVzJ1Yhcd+uz43lhM59eIYErvxfEOo?=
 =?us-ascii?Q?rTfuB3yAgCxHF7ISYyFSlfpSEtRXlCXze7WLRLGf4pD4O/8fDrF12AqaWWB4?=
 =?us-ascii?Q?rW0QFiR1HogOme1XT4TCZkM4Tdmxy9MQ4t+X0x2cMhzs0uwCUXAsQOtfuFW+?=
 =?us-ascii?Q?p1gz6ES7CqAJ8vfy3dr1fOFG55ELPaj1JMO0uMqUIlhwBwfhNe1mewfUTFok?=
 =?us-ascii?Q?k3EXjYsFRyEjlorOEjwMMRQh5vemJiGRVg/YuckTqsAjDv/nBH/ONcVHpMes?=
 =?us-ascii?Q?ofdTBmoFjt48sig21JvzXb5IUVWHz2PXxfd/u5ZeV3Kb73b6e3aRqcQf8fKJ?=
 =?us-ascii?Q?qb6lrEy4FDv826b6EFZiaLfdRsQeaK2HBeEtPpliUbrw/NBLRCdNU0TnMRIE?=
 =?us-ascii?Q?luEYSR/jmWfHB5POnfXar8viywldqxUBKD8tJ0aMU9+1RcMTmrCqfZSofCgc?=
 =?us-ascii?Q?oInrv5jhVp3Qc5lieZysAxSVRfDkzdEPtjcNwexmtoT3GNnD0qWwQS+Rq6Rb?=
 =?us-ascii?Q?0smKinfm+Wy2g6GPHpcNgcuS2MJ4TKwLf3Mv7UPUbK8Ww9AGy2XuUe4LnlLC?=
 =?us-ascii?Q?BJms0Ozgq4EcjMl0bXpx4NcVbzeP7fzLRFz+8NDFl8ERlDztRaSThMVLMubA?=
 =?us-ascii?Q?iCpJi8gg/jD1xPyoy8b/zMIeD62YAFppedLPfj2jSsHKGKky8GA+IGg3fAnS?=
 =?us-ascii?Q?LGAuntITitsnh/Xt9jq+J1XIHdkDvG+soM6mk10CgCiBJrBFS2IoOe1mH+35?=
 =?us-ascii?Q?S9NbpEwFLHmDF4U9/ISTwjBdSgqvh4abq+zqSDzM2nTq+vw4Vm0NpPPwQWnT?=
 =?us-ascii?Q?0EX6RSx1kpU6cW3HYAdzXyNb9uLw1Z7pt/SScefVkn4ZUelaK5o99oUu2Ezx?=
 =?us-ascii?Q?3aP+OPdul+eL0nhnBi/v5BUDIOIFheD71I4snxdFmqrLaf2bsNEX5mNDpXwi?=
 =?us-ascii?Q?tn5MqSVvGVWA3rEsjXN12Nh72bYx78u0SpqyRLdtvPbl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c305b86-7bd8-4dfd-b02b-08dd93b2b1dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 13:16:25.3943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WOftqF5OpmXYQQRYrBI59w1dVnxbxWW6kbZYY/G1rnwLWctG9TAkzgS2Ov41gXqulK+lCYOz0ZxYuJ1gvrGFlu3Ae4UR0djwx/Hm2va4tSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8556
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: 15 May 2025 15:19
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
> <aradhya.bhatia@intel.com>
> Subject: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files conditio=
nal
>=20
> Platforms that do not support SLPC are exempted from the GuC PC support.
> The GuC PC does not get initialized, and neither do its BOs get created.
>=20
> This causes a problem because the GuC PC debugfs file is still being crea=
ted.
> Whenever the file is attempted to read, it causes a NULL pointer derefere=
nce
> on the supposed BO of the GuC PC.
>=20
> So, make the creation of SLPC debugfs files conditional to when SLPC feat=
ures
> are supported.
>=20
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index f33013f8a0f3..0b102ab46c4d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -113,23 +113,34 @@ static const struct drm_info_list
> vf_safe_debugfs_list[] =3D {
>  	{ "guc_ctb", .show =3D guc_debugfs_show, .data =3D guc_ctb },  };
>=20
> +/* For GuC debugfs files that require the SLPC support */ static const
> +struct drm_info_list slpc_debugfs_list[] =3D {
> +	{ "guc_pc", .show =3D guc_debugfs_show, .data =3D guc_pc }, };
> +
>  /* everything else should be added here */  static const struct drm_info=
_list
> pf_only_debugfs_list[] =3D {
>  	{ "guc_log", .show =3D guc_debugfs_show, .data =3D guc_log },
>  	{ "guc_log_dmesg", .show =3D guc_debugfs_show, .data =3D
> guc_log_dmesg },
> -	{ "guc_pc", .show =3D guc_debugfs_show, .data =3D guc_pc },

You need fixes tag here it seems. With that,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  };
>=20
>  void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent) =
 {
> -	struct drm_minor *minor =3D guc_to_xe(guc)->drm.primary;
> +	struct xe_device *xe =3D  guc_to_xe(guc);
> +	struct drm_minor *minor =3D xe->drm.primary;
>=20
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
>  				 parent, minor);
>=20
> -	if (!IS_SRIOV_VF(guc_to_xe(guc)))
> +	if (!IS_SRIOV_VF(xe)) {
>  		drm_debugfs_create_files(pf_only_debugfs_list,
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 parent, minor);
> +
> +		if (!xe->info.skip_guc_pc)
> +			drm_debugfs_create_files(slpc_debugfs_list,
> +
> ARRAY_SIZE(slpc_debugfs_list),
> +						 parent, minor);
> +	}
>  }
>=20
> base-commit: 3d6670fab64cb00b5e6ed80d2517147db533faf1
> --
> 2.43.0

