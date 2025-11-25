Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B4FCFD368
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 11:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A421610E3B8;
	Tue, 25 Nov 2025 11:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxjGmahq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2C010E3B8
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764069235; x=1795605235;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iihDCtnxkx5oKEs8u66XRVrGCYxcQxfoP/j7VOj2tzc=;
 b=fxjGmahqEcXXjuEICRge5QeDqXYLrjrb+xMpS5Y2HDFfQlB9oI41jni1
 /IC7zl/7x3Se7XcRuaHudDqhKHIJy90z4PLTqVjxP53QUbzF/hwaN4d2f
 m4ZYTDjwd3vQNWemO2SeR11WqNTX+3K9+RFK4DYUlbrdDTQJGCiOwdIez
 s5hrZNetDp/1UKOEIyHp6ObR4FF3tG/ULr4ZSN7yAqWcisqZFeBxR4+yI
 hBxd72aNDpE6g/DY1yMYNV7b/Ox9BJVQLNUtgCB1Ul+2qg/ZUbaHzMrBy
 7Jtfmcb0ZttrXxQndulyuKe1fapG1GcXMyktlmuCeH53rrq+ciU/XyFag w==;
X-CSE-ConnectionGUID: fFJUpJkzRBWOBQkdl6ticA==
X-CSE-MsgGUID: PSyzItgFR56zGvxnYzl4iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65791092"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65791092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:13:54 -0800
X-CSE-ConnectionGUID: HW3rUP5ESD+yP/XznzYknw==
X-CSE-MsgGUID: lI6R1zxUSiKXowEhP1XKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196775317"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:13:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:13:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 03:13:54 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQcJeCSpE06fqN+A6r1udnk6KSiTGAPW3Z7DOornUsGcSDuzzVuNQ321X6hMOMKNXT+6kAJ5CfKZztghyp6VMe6dyD6kuxMh84PIBDcWScj7O0DHZ/xQlPzbZefBy4ve7gWCRqPT/pchZsTRrMf+gMGaPsEWqp00vcDp3fJyOk/bvHyjze3HYAOfgQwm/i43RCvUTZcPoQCTHGjnqBKfE2oyzTbutvN/izSp2xrFsCuC8UZH+jM7wOzAaILDHoaqfslnVz0YeFceg1TjgzVj1YVEmocRZ4DRTyG3xqBA+5RqaCvqEJ1nRNetqtjlME6Ihu46pNG5BadagZoQSA49Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/hwSemm1DjWVY1wHtgnkmdjQTnkwephUoPrMhh81lU=;
 b=pHOQ7m8Ar4D9SvVmwdg3xz49P2WX1DKnqgA/g5eDAkTlKvAsPP2buf8sYCViUuKytZzN/RC0Ov8mtS6/fjmSMnlERH5lLiVNh4AvisqrRlk0kWqngeAVHfDcBHSmyEsuNg47qJqYrTVIVGEIrLmBFs8iOT1mJELJdhM6/VivpJt/5GdZGNO1O7Q6P8dDFMyan/X7BgF61GrsfZNQpTox4RbhtJBBoE8ZE4GZBDKy5fpdo+qTpC5WxT8INcZTQC4yxxtJhkZyfop2cP5ytaFk0FTIMZ7Cn3O3xFL2c5AbQKoNXe+HbeDY9d+vwzCjzVOPS3L055Qg3MllaA8b9feH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by PH7PR11MB6795.namprd11.prod.outlook.com (2603:10b6:510:1b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Tue, 25 Nov
 2025 11:13:52 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:13:51 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Upadhyay, 
 Tejas" <tejas.upadhyay@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
Subject: RE: [PATCH 05/11] drm/xe/guc: Add page reclamation interface to GuC
Thread-Topic: [PATCH 05/11] drm/xe/guc: Add page reclamation interface to GuC
Thread-Index: AQHcWGqWpTzm3Skg70Kp92AqSOQDsbT9ea6AgABOGRCAAUYRgIADLK4Q
Date: Tue, 25 Nov 2025 11:13:51 +0000
Message-ID: <SA1PR11MB8839A7C26338E6B10E0C1DCBAAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-6-brian3.nguyen@intel.com>
 <DM4PR11MB5456D83789C73B756FF7F570EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <SA1PR11MB8839340F6CB3C3E374DAAF07AAD2A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSIDY00xv6Q+I2cg@lstrano-desk.jf.intel.com>
In-Reply-To: <aSIDY00xv6Q+I2cg@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|PH7PR11MB6795:EE_
x-ms-office365-filtering-correlation-id: 26e30c7f-9ff6-4e3f-b765-08de2c13b6ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Bv2dkTDXXeZQ4/0BpOzyWItwTAvnYONL2XIRTr5PzM/YyA+ODlT/Ldf/e2VN?=
 =?us-ascii?Q?L/UfmBVdntMhcBSQK7JGhaElWGP6GWIL0xSRM4pMzLkfzAmieXvcy52zjDJD?=
 =?us-ascii?Q?5huPPJ9Xe7dKPORx0E9aimj6I0V7YlvYJMumU+9mIvIv0Hjjp/pT9gzCGtXq?=
 =?us-ascii?Q?sHoicdxPMPjwPAL/qT0pS1VlIrpgjCW2rLX6c0Z3Mvou7RN8Bx9tmaGMBlR6?=
 =?us-ascii?Q?5soRteg5vT8/5TRjm26Cv3bhihGIGf3Zmgkn0ZQptTv8wfaxJTV/YbN0kmB9?=
 =?us-ascii?Q?YtHXOApx1DMpTmi1axzZno+a+Qbdvtmmfz04qdyzDFA6tMqtYc7oWsylv+q+?=
 =?us-ascii?Q?pWx2FW2XpbspIpIwT0nHJ+kSRCX80LWys8LpMZyDsXwH2yb9f8L8BLEK0Jm+?=
 =?us-ascii?Q?GamxwgGu+R51ov7jxOs5MrH9Nx5WzPqJ0bqjM10ROkEYmjqxh8d1wsDjR9i6?=
 =?us-ascii?Q?yWCfzsuRWk1WGaKIlj/8p2rigSUqDJd/s89/DPdMvfYlmKk/vY3wYoJsysGe?=
 =?us-ascii?Q?0tvzYLYrJ6zO/KkuEwJ6RYbN3rtI/0gY/W18q+JlMIs9BFq8/z7V2v19L8oD?=
 =?us-ascii?Q?ORdVuyjYn1J5o7JKYTzQs6mXeLoCFDYvhzEsfl4HHdYltqf0WNi1Bj+bIQrx?=
 =?us-ascii?Q?Cz6s6D88zNe1OkOyhc26XN7RAPQg2NoJh3hGCurdKlSoXD/ndkrjWsJnWFXz?=
 =?us-ascii?Q?EY06chvLbkSOLhWim3k8/aSnCmqhrSxAbRXTmbSfcbVfRqZUPcgwiVo6/XPb?=
 =?us-ascii?Q?hMU/b4gslC16MRby+M83fh554Bvjl0lSB5HyopqIgPCz3FgkbVIfezC+uk9e?=
 =?us-ascii?Q?WJVwPJbUsplwggE/T6en+jfzyL8aZ3xb/HxZWPkdfhUpEx9KvYswjy2T2WYg?=
 =?us-ascii?Q?iq2nSuDDFcI8tC2lFY8W99LOy3XZwe+ECbmfzZZkUbi3NFRAi6fenifZS/nX?=
 =?us-ascii?Q?y7BnkQOP9PIVU/y/t068AL/Ofyivrh6vs+mjAuwqlLYk93fdO5QTEF/Jz0kf?=
 =?us-ascii?Q?rilIEQMOVIKrTxVWwmqT6SVdWHOFJQzV3gGGWGwofEnIhj8CplOro3MBvPCG?=
 =?us-ascii?Q?plxsH0Eya9jKxCs1wh5Ddwtqui1j6pa9GSX/waWcEtezctmE6YJfL4ZNbN/F?=
 =?us-ascii?Q?KirjP1F2dzPNuBhgxLTHbJBQM2ArVmABXz7RzykEQp288mMLn07b7YGBX6WG?=
 =?us-ascii?Q?rmIho3xYQKo1fEEqleyBZxurSvJH7z8HB3Ed5do0lQI6Yx3wiJcYkGEr+mky?=
 =?us-ascii?Q?/ctWBofmlfPgCEpuvZYFSSGpX6xaLtDhEnoNl+x7e7R1hy1SM6HfX7YIvxke?=
 =?us-ascii?Q?cwPBA+YVJfLBYc+kxpRXIK6XJvwpSGOFEw80E6ySnMaJ4xCx1VOzkEXAXXxe?=
 =?us-ascii?Q?CKrniuRMeeG4u8YBFHu8ZKsYgUI5n87y4On3U8bbO/9qmisAv+R0Zockddzj?=
 =?us-ascii?Q?MtGYCUNXJDz+QqBWVrjJkOK9GPC2TVxF5jjgIc/+57rWrw6fX7XMOB0JUTnX?=
 =?us-ascii?Q?k+k8n7o1Ib53Yu9NjgAb0koGJJMpdPspZHuM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QOcHBDstCCMjx7M20D2T80RCdD13MFE1E00Ce76P5V3CncU97ALGJwxOBuJH?=
 =?us-ascii?Q?V+gQ87cBF0/POg2lZfOfqz1ZEU9EfDSA8oC/Ml3KkBX8R7ih/cY6YqZmvX/c?=
 =?us-ascii?Q?Mmmonk2Po4s+AIUe9R0GA+l2MkLHDxUyylf6NQPDli8buA6aeI5XlFvUwuP7?=
 =?us-ascii?Q?80lQRxJex1yN/qtktRat7ITOUDi3fMrxhI8katys+zXmxfVu6fdRVC9imTdn?=
 =?us-ascii?Q?ixl+yULOBl+339LxSGKHionYXlNvY4Trr9Htll2slcrgk9+p9L+X8qsJb6OV?=
 =?us-ascii?Q?z92RsJ7dFtHJihQdEGbNKR7PGb2huH6ScTxgXntC6HmlliinBdidJ3RKVBS1?=
 =?us-ascii?Q?M0G6lkNhgmTKr9LkKiQtyi97V1DgCuKyb2eqKj2vjtM+eN77BJp3h2fa/rTU?=
 =?us-ascii?Q?oINnTOl+7nPRn+Nwb5YGPoWmpTULBRodETCLK9QCR6agJElPjzPlXBmrjzwq?=
 =?us-ascii?Q?hLI4sTw7SBo6EmhT1LTGF4ko0udmhVamfr0ZpzpZIRttaU1+VVETRvNpspoq?=
 =?us-ascii?Q?jc7+7rHZAy1vbJJtRa2FhIp6tsghB1eBNdShIeaoCKQb76GCCtYotKKQo8wy?=
 =?us-ascii?Q?4zHx7b3YfcqZpoAo2Gx8XeJ8uABF/qjwB4Bh6Px8UF2TRjGWTnzGVqIJ2zh0?=
 =?us-ascii?Q?RqEj4MBfh/HWETVk1xTw20KlRGSH7MmBtZhNVB9kRYlffV5nKGborsKHWf7X?=
 =?us-ascii?Q?kq67wJK6CEDV0SN5+4Yeqqe0njCJiNoP09axGrELtTQkdrG1TeqMsmuRE1H1?=
 =?us-ascii?Q?mx9JmYJwIWCvyfPH+0I3ExVyc1FC38bao6F7mMR4Zd7g6GqLzyZDB1hJAcuC?=
 =?us-ascii?Q?LICH+8SN3nn5rH+P73s/P6w72I+70RIMs3oRNXNgsZtNv956N38LRoAFU9JD?=
 =?us-ascii?Q?2Zdu4aPN8Dd+4RutjsQiLZqY7s42r20aHV/YoPsG6op1aIthS2NmtVjT2s3k?=
 =?us-ascii?Q?vAOhZgr60pCGYYnwyZutFosDBS4dmX1gc+tbsPxxL7CZRwhQ28Q07L6ZAXj+?=
 =?us-ascii?Q?MIE5y5Ju7iMgyf+sikxx0zWjojaFyn4v9wIaLZ8Xy6tEa5D8ga/Omm3qWQ58?=
 =?us-ascii?Q?/ejCfGWpX/xYBezAHCkvSXuaF7Zg53yTIyhFN0o/bbGY2s8kXyld2T1CHAcz?=
 =?us-ascii?Q?SEJqZTvdiKWEogKcfrIC4Ae/vWz2XkKD2luLs8qKjWaBMPm6CgsFyk7BTCbs?=
 =?us-ascii?Q?utMJuZ0RUIYI9sW7fRbuC/5X0R4+n2PuVcc/GkPF8rdFs6h0f9ZkqjKZxYo2?=
 =?us-ascii?Q?MZdZl1q9dV2zrjbPHqYFT4R4c4zU4t5qeHdzCJ+HnjExhY7NMXIYx2RI1w+Z?=
 =?us-ascii?Q?mIxbVqO8vePFBbT6dZbmy05e4r/QclWgiw1c7/k6D5Bao/qLUUN1XMrqWECR?=
 =?us-ascii?Q?fG2meAvyR+Ca3cXeaZSSILqHQRt175EBnUczEQzzk0udF5x+Mm3T8dxar3ES?=
 =?us-ascii?Q?8FRKOz0m7vmv++fNzsEYb2LCXe/5GEM2a6Z1YJNv4VZmcgqWk2uX1G8SJs8G?=
 =?us-ascii?Q?KGwJZmbt0rxu5NOTOUt5BCTgma66XlQj1Vya/vTccyn+X8g7IeasnCISO7nI?=
 =?us-ascii?Q?5AwPHzHVqOKUktWQpTJF0+9ktwZnLUXoKyiUpfGgUG4Xo/RilYjpwhcXx46G?=
 =?us-ascii?Q?GMKVpkyrt1uhHAnKCAupERNJ2R5hu8aOr3wGqNWAkijT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e30c7f-9ff6-4e3f-b765-08de2c13b6ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 11:13:51.7658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: we3K8gbO/wE3ni4MROmj3z0u66BHu0CfngUJZMih9Iv4I3G2D/0ZvgzNYHob2CniQNaGR8gWNR1Px0LSzKZv0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6795
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

On Saturday, November 22, 2025 10:40 AM, Brost, Matthew wrote:
> On Fri, Nov 21, 2025 at 06:56:27PM -0700, Nguyen, Brian3 wrote:
> >
> > On Friday, November 21, 2025 10:33 AM Lin, Shuicheng wrote:
> > > On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> > > > Add page reclamation related changes to GuC interface, handlers,
> > > > and senders to support page reclamation.
> > > >
> > > > Currently TLB invalidations will perform an entire PPC flush in
> > > > order to prevent stale memory access for noncoherent system
> > > > memory. Page reclamation is an extension of the typical TLB
> > > > invalidation workflow, allowing disabling of full PPC flush and
> > > > enable selective PPC flushing. Selective flushing will be decided
> > > > by a list of pages whom's address
> > > is passed to GuC at time of action.
> > > >
> > > > Page reclamation interfaces require at least GuC FW ver 70.31.0.
> > >
> > > Should driver disable this feature if the running FW is < 70.31.0?
> >
> > Default FW version is above this at time of patchset submission so I
> > had assumed it not to be a problem, since the danger is a user
> > forcibly using a bad FW which already has unpredictable results.
> >
> > However, in hindsight, it is easy enough to skip if FW version is
> > lower, and we can safely fallback to default TLB invalidation, so I'll
> > proceed with adding a check within the later patches that'll disable
> > page reclamation within the xe_guc_tlb_inval.c unless there are any
> > objections.
> >
>=20
> I would just flip 'xe->info.has_page_reclaim_hw_assist' to false very ear=
ly in driver
> load once we have the GuC version if GuC version doesn't support it.
>=20

Makes much more sense to do... will add in xe_guc_init for now. Thanks!

> > > What will happen if driver send this action while GuC doesn't support=
 it yet?
> > >
> > > Shuicheng
> > >
> >
> > AFAIK, if action is sent before correct FW version, it'll report out
> > GUC_HXG_TYPE_RESPONSE_FAILURE in g2h due to illegal operation,
> > eventually triggering reset.
> >
> > Brian
> >
> > > >
> > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  2 ++
> > > >  drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++++
> > > >  drivers/gpu/drm/xe/xe_guc_fwif.h         |  1 +
> > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 14 ++++++++++++++
> > > >  4 files changed, 21 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > index 47756e4674a1..11de3bdf69b5 100644
> > > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > @@ -151,6 +151,8 @@ enum xe_guc_action {
> > > >  	XE_GUC_ACTION_TLB_INVALIDATION =3D 0x7000,
> > > >  	XE_GUC_ACTION_TLB_INVALIDATION_DONE =3D 0x7001,
> > > >  	XE_GUC_ACTION_TLB_INVALIDATION_ALL =3D 0x7002,
> > > > +	XE_GUC_ACTION_PAGE_RECLAMATION =3D 0x7003,
> > > > +	XE_GUC_ACTION_PAGE_RECLAMATION_DONE =3D 0x7004,
> > > >  	XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION =3D 0x8002,
> > > >  	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE =3D 0x8003,
> > > >  	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED =3D 0x8004, diff --git
> > > > a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index
> > > > 2697d711adb2..e13704e61032 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -1311,6 +1311,7 @@ static int parse_g2h_event(struct xe_guc_ct
> > > > *ct,
> > > > u32 *msg, u32 len)
> > > >  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
> > > >  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> > > >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> > > >  		g2h_release_space(ct, len);
> > > >  	}
> > > >
> > > > @@ -1546,6 +1547,7 @@ static int process_g2h_msg(struct xe_guc_ct
> > > > *ct,
> > > > u32 *msg, u32 len)
> > > >  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
> > > >  		break;
> > > >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> > > >  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>=20
> I get what is happening here - page reclaim G2H just uses a shared seqno =
with TLB
> invalidations but this looks very odd to the reader of the code who hasn'=
t worked
> on this or understands this as shared function is called for both G2H. Ca=
n you add
> a comment here explaining why it is ok to use a single G2H handler for bo=
th TLB
> invalidations and page reclaim?
>=20
> Matt
>=20

Sure! Will add a comment here explaining the relationship between the two.

Brian

> > > >  		break;
> > > >  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> > > > @@ -1711,6 +1713,7 @@ static int g2h_read(struct xe_guc_ct *ct,
> > > > u32 *msg, bool fast_path)
> > > >  		switch (action) {
> > > >  		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> > > >  		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > > +		case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> > > >  			break;	/* Process these in fast-path */
> > > >  		default:
> > > >  			return 0;
> > > > @@ -1747,6 +1750,7 @@ static void g2h_fast_path(struct xe_guc_ct
> > > > *ct,
> > > > u32 *msg, u32 len)
> > > >  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
> > > >  		break;
> > > >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> > > >  		__g2h_release_space(ct, len);
> > > >  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
> > > >  		break;
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > index c90dd266e9cf..34d74a71c4f0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > @@ -16,6 +16,7 @@
> > > >  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> > > >  #define G2H_LEN_DW_TLB_INVALIDATE		3
> > > >  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> > > > +#define G2H_LEN_DW_PAGE_RECLAMATION		3
> > > >
> > > >  #define GUC_ID_MAX			65535
> > > >  #define GUC_ID_UNKNOWN			0xffffffff
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > index c05709a5bc98..3185f8dc00c4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > @@ -95,6 +95,20 @@ static int send_tlb_inval_ggtt(struct
> > > > xe_tlb_inval *tlb_inval, u32 seqno)
> > > >  	return -ECANCELED;
> > > >  }
> > > >
> > > > +static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> > > > +			     u64 gpu_addr)
> > > > +{
> > > > +	u32 action[] =3D {
> > > > +		XE_GUC_ACTION_PAGE_RECLAMATION,
> > > > +		seqno,
> > > > +		lower_32_bits(gpu_addr),
> > > > +		upper_32_bits(gpu_addr),
> > > > +	};
> > > > +
> > > > +	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > +			      G2H_LEN_DW_PAGE_RECLAMATION, 1); }
> > > > +
> > > >  /*
> > > >   * Ensure that roundup_pow_of_two(length) doesn't overflow.
> > > >   * Note that roundup_pow_of_two() operates on unsigned long,
> > > > --
> > > > 2.51.2
> >
