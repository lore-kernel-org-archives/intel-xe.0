Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D57CA1016
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 09:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F5D10EA65;
	Thu, 11 Sep 2025 09:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHXlehoo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0E610EA63
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757582941; x=1789118941;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XbQz1xPldKtFwfS7TpvF7SAmRlJgCfc3FEZAbIMP+gg=;
 b=hHXlehooRlbhp1ni/951lakRslb4svL5HKEccoV4kZqsMNQztLZdYfiI
 FNpjUy/CEY8iYTEgfU73octXhrIO+NY0TAAORSB3fAY5AvkEiSLAlTDHV
 LULQ9kyLUQiEDJLDEGKXFHdkHMxWxad8j4+JDyq08VT1wPI5PjWacALll
 O9T1VA3asf8xQ2ARKQ1tX9XPCaM8iUxEmd4ksQgAK43pie6P95LYdfbSh
 5bcKLMHGFH1K9CZQdm5KJgTsZze61ikX3vR8cw6O6CNjRL2sd4JZ6mWQo
 8/tbDsUhCG41T3dnTqSeKimZzl3CjMHux82u7PoMvRN8g94NKADngwqIP w==;
X-CSE-ConnectionGUID: IENuS2FHSSiosqkAvVt2Ug==
X-CSE-MsgGUID: TcM6pf4OQW2sZPQp2GGYKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71007829"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="71007829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:29:01 -0700
X-CSE-ConnectionGUID: CQThD84xRJGbbscwmglSlA==
X-CSE-MsgGUID: uGfbNcZKT+m8r10XaLsirw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173480065"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:29:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:28:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 02:28:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.43)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:28:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUHFUX/JFCjXQzRvCDbSEOFc7CzUXESS+MKYHrRPoiam+lkmuM5bbor55jSfruY+DEQhY7neciTWlydU4Ix6SPDk96h/ROY7kO9Mu3iSLLoV2FdrOuNEaeO5iAzuhqy4ix4cPYdpwHd+u/P2qPS693Sbqc+yHyEvmBiRVmIWEcVABh/wx3wD5XEcLltNIcEhiofyq5y3AdPRmRc1AST6aNNZiz76jWDvd8nsP+E8itdJxPs2zaNJqB1BW/4tEuDu4F+aXaXkkVtElr9IJ0BUGPUZ6YOhEHMNseAbI82qmgIfTrPlYNwxWOV3me4NaYaSIwJN/67qY+6uwNuExWzUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVf9TJTKl3BHpQaTdhgJGGhdnHQTl0jpM/mWF7XGr+4=;
 b=wwx6gz+h6YOv33PTahHlREWLPh2aM1MSkUx3IH8NwRbie71WYCewFaT1tlShq8oDs6pNeFiqea58z0vQYOQtIwngYsRi+R7jsW8oVOgLmQtWxnW3LpSah0OBEZ8m3lm2lefd9H3+Dv9CDv9QM+GtXY8EKO9vp0rRoB3UUbqXEQWS9X7Z7Vtl5467zeu4Ce44V8V3aLPeIhpwsI2YEG/YGxOrKBdvPQjoH5qbSIqPzEatBJaDHTfOqqr3tlRWS/7oBnw8/UxBa9+AXM1Yeig9Nx2A2dQ2Eoav+WsuVEppvMQZGDkgi+7fR/oOYE25DbtmBDfaGgz9szbQdcGrgxDznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 09:28:55 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:28:55 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Thread-Topic: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Thread-Index: AQHcItjkvqWZ86MhNU2ZHWX/YNP3MrSNqB6AgAAD9KA=
Date: Thu, 11 Sep 2025 09:28:55 +0000
Message-ID: <IA3PR11MB89875A837D512DDAB0CDAC13D009A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250911052823.226696-1-nitin.r.gote@intel.com>
 <SJ1PR11MB62043168C5C2CAC20EF19D958109A@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB62043168C5C2CAC20EF19D958109A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|DS0PR11MB6542:EE_
x-ms-office365-filtering-correlation-id: 4f238ed5-4201-48b9-e6c8-08ddf115a129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?pQiInLC0nSl82o8YNHTPX7EnOYtXCzEZ2vmNOxrPyEpuBjMnZdUNsPLiD5?=
 =?iso-8859-1?Q?NV6PEx/hUarevIb1vPgInQ1Ii+c97yoB0jSXFzD2rM+JL3uHXe1cCptA0B?=
 =?iso-8859-1?Q?MwAUJASQfWJlbhM07/ne6LMLM0m7jtpwJG+OqyR0puRe+iNLTPTG3tU8UL?=
 =?iso-8859-1?Q?675hU5NVM8ZUEqGkSy7wWOlkNy+0jCfqXXwY57VslYjr2qXgVQrITxKuOJ?=
 =?iso-8859-1?Q?drQ1B1Ep7SYD49Aj2wBTkPwIUPkmLZoB8xoeRJXzZeY0+H/uaiJdCkOMbg?=
 =?iso-8859-1?Q?IkU9/iuDfiCpOSjTtR19F5eP/+LGfo0SRrsKeCClrsdjG0qtt7yuSC57+p?=
 =?iso-8859-1?Q?vIsoOm8tHMvlgD1P9wUiHnkHEv8SZPxLjzQ3zPO+7iLYUkY4V7u8oO1Tk1?=
 =?iso-8859-1?Q?wRSEzyIMIRzT2Cp6Uu5NOpXTkwAhvW898bQbOR4D4BEfOSBNEJLeQ4i8ma?=
 =?iso-8859-1?Q?CpF+MezRISHABY0VEBxOPmxRS4PgxtoUTXMEw8VwiHYqx1clIKhc1vaqhk?=
 =?iso-8859-1?Q?ycNET+k2S4TMesRxHePbd5wqN/UlAagaR1oJlLk8S8S1prjD5DlzlUQEb0?=
 =?iso-8859-1?Q?m5mdMiN3cKumX/vGZwuRj1X0p4om6DVheguCApN8v0Uzmr+FE0FrCZfwzJ?=
 =?iso-8859-1?Q?VaHyV0scIOryVn3YfquHO06iInPjS7dd0JkKxQwe4nHNppKbHcZDyct+D9?=
 =?iso-8859-1?Q?jsBsWRODOJUBByo/4z0D38LqeBgPRgETAzFuQQ+9Tpu+eIuSOlWon4+Ou7?=
 =?iso-8859-1?Q?bZT25O2+kOx5hdWzzKu2nvj2MpXp5UdujZtlJEuo4XkxA7FyH1MBxmEuNa?=
 =?iso-8859-1?Q?nADbKOHBRQeW3zwECQauV4Nur7KGnvCcwmODYf3D/WJUYHPbOFqJ5vYA9Q?=
 =?iso-8859-1?Q?q+m/KKvJcqGNwVCNhTN70PhvLgyRov3VByQ8rd57lmEMH28cCkId1o8uT+?=
 =?iso-8859-1?Q?AzJ+dIT1GWmv4Zm1XtcewPhr1d2chAqeyJYpCGjDAwjWth2mSS4Ut8jLsf?=
 =?iso-8859-1?Q?GQH58cS7NkxQqv0VbJJhUEMNScqEVJEB390i6D6cBaL9uLjxQ6oqnxaLxj?=
 =?iso-8859-1?Q?hVrekWKEd6UcrSUgfm3Wlq2VJ0xWJ49wMDc5ZlGL2CWnNWsWdtz2T8JWyo?=
 =?iso-8859-1?Q?ApJyCOg3nJtqAgdblylT9FhM5TD2TlOxZ3NGPWwcsCfmlr4MJGZSRd8Sv0?=
 =?iso-8859-1?Q?fvIpxKx/1NO6BAPV2XiQ0fCTKDENMTdesTHnedcYZs1NLe7/ktbK6u1Plb?=
 =?iso-8859-1?Q?mlY7G0RpoY0VrgNsgYaZKlfKZo9KmkuT+1deuEsOgv9fmH4g1XVI7ypvjX?=
 =?iso-8859-1?Q?L8/lUc/65guPcjhuHV1AlnfbYia+hCJ3erF7Cr2C2qcM9NjJgM+y+v2W/D?=
 =?iso-8859-1?Q?w22qEtXaO9qjNXQxi4tgtDYYe+GqbH42K0TURlssF3vMitBRC0tP+ixweo?=
 =?iso-8859-1?Q?rSnBv88RAn9Wipj+F36TPmDjxyPud7LAXXrQni2aWBY3S+Gz57tIMgQD09?=
 =?iso-8859-1?Q?4cnM1tHA/w4JrpwF1TqHJMaJk1y/2ORQOXTpG3bjvR4MSNQrUym8t8bZIS?=
 =?iso-8859-1?Q?0Y9QYNg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LitQrg48c1TDsJoLLEd+FSRCRua1C37OE+Vzku4UwBcgOMMQofx6J8Zwsp?=
 =?iso-8859-1?Q?AGfm5DDXvXSFyqrP6bX4TVnp4pNAHBV0dzmaRTCQX8zAiIx8f9fFe3y1a/?=
 =?iso-8859-1?Q?T1WXTsHFjRHFws19X6Fet07spUAtTdzYVujZ/5enOg+6TuVHxO3gyw6bO1?=
 =?iso-8859-1?Q?KEo4bi3jJ5OT44eury2LMSV5XB9H9j79wiPVZaIXoMoNIPj/ajUEfSxWmV?=
 =?iso-8859-1?Q?qM2GkFRT5/pvK3d7ddGI5URC+8dQ5UVjupZxsjN3tBuuf0drPrya6oRFnE?=
 =?iso-8859-1?Q?QNa1L7nwzXBrJqrFJVDS+QHV6LrTPoUG8uAea9VHF/+trqbcWYX334K9kH?=
 =?iso-8859-1?Q?UqHI7NLUf82o/6awv/mFxtQUBV5ddLEOhWsffYWd82/4WDC0ivuAu/asBd?=
 =?iso-8859-1?Q?gVo7F+4DS7f+ELXsNU7CUgjLjKSYj2aVGtwQxW9GRWsXkNmfXKMN82C0yG?=
 =?iso-8859-1?Q?p5lRKELwEXJsvhBRVQPvzr8NnnVvbBUzy2aorUavdJkbD4jsq1IEd9hTRF?=
 =?iso-8859-1?Q?p7eD+XGDm4/xicvYjzgDix6e9o1vDDbGM8Bl/rnWyZzsaMpP1F43EotwUr?=
 =?iso-8859-1?Q?e9/VCzM4JbKIMXYPs+COCoeu9MfFhgLe4Yi+O3y0OTizOBoYjCg/caut1z?=
 =?iso-8859-1?Q?E/Mi7Xu5HEVBJ8sT5LiuaiRlMPSwbnbnwhOYWWxRMbVMPxsW8k7NXgH9nV?=
 =?iso-8859-1?Q?Teu/WuFGxy11y3SLPnFcV0L7n81lH2yP7wXo8M8sa2KxNN53koUyZ+81+O?=
 =?iso-8859-1?Q?ShXTSyIM3g18vsMHtJB5TVZZ+Bkxvrnwcj6kz+Khr5OnOAbqwIA9hr64PA?=
 =?iso-8859-1?Q?1vlLir9uBqE5eHcCz+qEm6xM9q43gdCtC6SYfm3T8UfJH9LPbusof1h+1L?=
 =?iso-8859-1?Q?A6e0QahZ7mR8OIJBiBWXJC1eBNu/y8b5EZv9uMpzFl4f2S0NGL9mMi5NaW?=
 =?iso-8859-1?Q?/WUTWyXNcof6IQoVStW4+yUVwnNm1hCmL9nyPQs9DZCZOF3lhbjHDv62Sy?=
 =?iso-8859-1?Q?1eZf4+iFPmqTN90f1PR2Z1GxsoSFiwmCdAQxJunN9061XtKZBtmpa1/blr?=
 =?iso-8859-1?Q?VC9a3egaOfdGDOpUT91t4pB7PXsbuK0etji45Zlu0MZOLlYoPmDCAHLMP3?=
 =?iso-8859-1?Q?zFQCsRoYyK6acPzQEsso94fR5P/v/SuwQof6CWM9b8dExhbD8IHu1e7mHP?=
 =?iso-8859-1?Q?ktgufiGXiAQUONjyjspu5Z7G5QTN/sOi3exLRXWyr6703o06VFx1MWdXZV?=
 =?iso-8859-1?Q?t2ctvRNhobcaN5AQJMnClMA6yBxNeUyGy+nG9p8i3zoQlsoReVAodXpGn+?=
 =?iso-8859-1?Q?Q3XgzSqcFMbku+/LWWexc7ioxTF8ffVWci81VFNOB/mdzqJtfZpFCjkNvC?=
 =?iso-8859-1?Q?LBbRsQZYIvHqKduWmgqQ4YTo7CIJU8Fg4O2IZvKoatigCJX4QdGjX4hr73?=
 =?iso-8859-1?Q?0wFb6liRifuPgCfZwhBGSmo5j+HD/38i5G6iTUedHMZPGbn/CoP/bL9rOT?=
 =?iso-8859-1?Q?vfQBKgFjfyRLrQ3wnkDhJOb3qJpFpMlSHKTDAxbm+qsqYP4qzzzRGnC/Ue?=
 =?iso-8859-1?Q?DXFX0u22RGALZCXVXFFkVaKZTEDc8NskKDhkKQxHoydVa/V2VOdr8o9V45?=
 =?iso-8859-1?Q?6KR1eIeM9UuVKsndpGorz2hsR5xQGpbGl8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f238ed5-4201-48b9-e6c8-08ddf115a129
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 09:28:55.6499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mf+ymijnZTD2jKkRSpTjncjiZ7CSlo/mMeWNHEvebt3xcTv4C/H0rkVGhIghySeb5vvAx7pp8VPjfO6L235gDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
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

Hi Tejas,

> > -----Original Message-----
> > From: Gote, Nitin R <nitin.r.gote@intel.com>
> > Sent: 11 September 2025 10:58
> > To: intel-xe@lists.freedesktop.org
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Gote, Nitin R <nitin.r.gote@intel.com>
> > Subject: [PATCH] drm/xe: defer free of NVM auxiliary container to
> > device release callback
> >
> > Do not kfree the intel_dg_nvm_dev in xe_nvm_fini() right after
> > auxiliary_device_delete/uninit. The auxiliary_device embeds the
> > device/kobject (and its name); freeing it too early can race with
> > asynchronous device_del/udev processing and cause a use-after-free.
> >
> > Set aux_dev->dev.release =3D xe_nvm_release_dev and free the nvm
> > container in that release callback. xe_nvm_fini() should only
> > unregister the auxiliary device and clear xe->nvm.
> >
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_nvm.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> > index 9ca4a5ae1693..cc8d7c6cf69a 100644
> > --- a/drivers/gpu/drm/xe/xe_nvm.c
> > +++ b/drivers/gpu/drm/xe/xe_nvm.c
> > @@ -35,6 +35,11 @@ static const struct intel_dg_nvm_region
> > regions[INTEL_DG_NVM_REGIONS] =3D {
> >
> >  static void xe_nvm_release_dev(struct device *dev)  {
> > +	struct auxiliary_device *aux =3D container_of(dev, struct
> > +auxiliary_device,
> > dev);
> > +	struct intel_dg_nvm_dev *nvm =3D container_of(aux, struct
> > +intel_dg_nvm_dev, aux_dev);
> > +
> > +	/* safe to free the whole container here; aux is embedded */
> > +	kfree(nvm);
> >  }
> >
> >  static bool xe_nvm_non_posted_erase(struct xe_device *xe) @@ -162,6
> > +167,5 @@ void xe_nvm_fini(struct xe_device *xe)
> >
> >  	auxiliary_device_delete(&nvm->aux_dev);
> >  	auxiliary_device_uninit(&nvm->aux_dev);
> > -	kfree(nvm);
> >  	xe->nvm =3D NULL;
>=20
> Why are we clearing from xe->nvm here? Its still alive! By the way I feel=
 fini and
> release are almost similar functionality defining destruction, its just t=
hat before
> calling this we should drop all references to nvm?
>=20
Here, auxiliary_device_delete() calls device_del(), which removes the devic=
e from the=A0driver but does not drop the init reference
that was taken in auxiliary_device_init().
auxiliary_device_uninit() calls put_device(), which drops the init referenc=
e taken at init, and when the device reference count reaches 0
then device core calls dev->release (xe_nvm_release_dev).

And if we set xe->nvm =3D NULL in xe_nvm_release_dev, which means we are de=
laying the=A0clearing of xe-nvm until release, then there is a=A0
possibility of a=A0window that, after xe_nvm_fini() returns, where xe->nvm =
still points to a=A0freed location, which leads to use-after-free=20
if other drivers' paths could still read the xe->nvm.
So, here, clearing xe->nvm in xe_nvm_fini() removes the dangling pointer im=
mediately.

- Nitin

> Tejas
> >  }
> > --
> > 2.25.1

