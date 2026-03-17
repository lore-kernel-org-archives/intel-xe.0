Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6606FFB5EBB
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 04:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8C910E58F;
	Tue, 17 Mar 2026 04:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hm4HrN1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0309210E594
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 04:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773722579; x=1805258579;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eqCbwLdbWeXNoDQntkmZ2VbnxoxX2LfK7HM41tX2lQk=;
 b=hm4HrN1EY93w2I5jSFQ7uGhmm6vrAbagAqqGRbUX9gMMtCGbNxZkuzWk
 lyDfnFEF2QlFkZjaXI99irrLbdKWnV5ibh34AjwJtsS+jI6817ea7jrrv
 m5ls9jI/67LSWz9PZ9/aGHOu2WVSk93xOa1lBF0Bx5Sa44jaususe551R
 o+R8g12RnFagXx4cLNClammq/uvgpBfyXbbfdMh5SA6m/3n8OLXXYcz/b
 1dO7Dpq09/Bea5EJ4Yy9To9eJ62oBIW0+UgwwXWOSZ1NTKzG2loAAHWcJ
 6KcYvmE4FopNjVzBu/24LnJR+xF2y62AYzBrdd978qpdXbYWnQiV84wux A==;
X-CSE-ConnectionGUID: RmhM5ceaRv2jxWCeshuXEQ==
X-CSE-MsgGUID: xr6CvEGYSsWlKUlpRLb4fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86102443"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="86102443"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 21:42:59 -0700
X-CSE-ConnectionGUID: 4l/azXEuQq+z2w3lfCqAvA==
X-CSE-MsgGUID: gxOYXwA0SSun3zw/synzwg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 21:42:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 21:42:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 21:42:57 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 21:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSO9g7waBbwUaY3DrlVs6LzMjtiC06lckgDcWHXlXrWfIXgoUHISJeg7ObIU7K3Adr6Njc73rxPfgWuybHsZ6a99pcMERq/x8qVnGw4iAV/3UjZWp8oL8JoRwKB5WvOVnZxmgYXlNnM0Sea986Mn2DHa0IP5eeTIcfPNSsaSnzvFpvGoC0+FNH3OVZgQ1lo/xPFRyMTTsRXO0SccuH+aT6MojoPn6mqprwucraP+EwzcabiA74+OgcAZXIqLIjb3arCrEaYAcn8FPBUllkYPRboXZjUTh4zTwCWgJXJl9/5O14Iwav2Gv1mRt0LWSLX3HInRhis5TwG/sPajOI0EHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=judvZWuOSHzY4JFDlPi7ru6W8bRSFMeeMKrvObcQ0zQ=;
 b=dliDR/i0pki0N1fONc3aBAnBq2UM4IcEuZDHC/6SJKjstzcKj+SnVpYJaLtfc7YREJoy3E+yS8ki2TOgpN7NFFdd21jZBJhDRQT/CO15PH8Yj+q7xvJic1ZDpY+IWvQsMIoNT2hiPUUhR5011yjz5IiaS8HnY/x22w8QRcP88axFPp4PIlmIeMWymstpHNTJ4ZuasUWKhNM8226T0R13ClNyh5aKGin5BOYQ0IWUmUvhzRNWCFWllrexS7We1xdWrDwzTgjPnxMqpExsiRYsiWrasx5xU/6GhoAjHmqhcoSVXakBPcyX2jETfBZG8po1rQNhedvRcsy60pQtuZQXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA3PR11MB9061.namprd11.prod.outlook.com (2603:10b6:208:57c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Tue, 17 Mar
 2026 04:42:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 04:42:50 +0000
From: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/xe/oa: Allow reading after disabling OA stream
Thread-Topic: [PATCH v2] drm/xe/oa: Allow reading after disabling OA stream
Thread-Index: AQHcsqtdwPCyRN3Ejk26DkIc6vXeu7WyKu4g
Date: Tue, 17 Mar 2026 04:42:50 +0000
Message-ID: <DS0PR11MB74083DB850FA5CDC1DE2C710A941A@DS0PR11MB7408.namprd11.prod.outlook.com>
References: <20260313053630.3176100-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260313053630.3176100-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7408:EE_|IA3PR11MB9061:EE_
x-ms-office365-filtering-correlation-id: ee630834-67bc-4b4e-f9fc-08de83dfa50e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003|7053199007;
x-microsoft-antispam-message-info: lb9HN/lr5z36PcTl1P/ktiNHsLOeFXB1ok400hd0SpvrZy3B+jkhkHG4UbxCkqHA8snHoMIivZpHMD9F4jJRrog7NHowGmTM2ls2ROQJC0Q3+p1zdPysFN7v45dBSQ0JM+u9c+iVunqss9quV0eLqluxGZarJyR747ycvq6LKfOImK/WMstqENo6vw9FHn4hyHXKiCFaM8Y5lxzFuG45hyUK7yw7smnTdXAKu0QoElM/OHjuI3uYqkyPSHESmxJwSJ4DQwx34ZeTvpJrcPGDA9J8Yt+8yUHuAa5e1ZWN/P0yqqn/QVBbusbt0yzNAx/f6iom5GhC00/jaGDBI1F+7CmIxD7piKs2zcl1LJOg+l2BUSy5I0twj/Mq92fgE7fus5AHb+g8wHCZwJz5I00fpyfbZ65+YRpitTvCWsMBSLdspuurE9F8ZYpn4C+KNMVEa9YF4XDxcJdsB1Z33HzvFinW8DdaQvoHxfBQUdsuiXkf4vS5lWTTqThIfCJOkjF8fT5MEjP/JUY78UIy+7iiQWzrx3KHfAxj97owKmdAQ/STZMHAd4eYqdOyM3fosMCtw/UnShwQBtcYIr6qz0ZgpoNZ+Q4s77XCBAZcMcFC4rFJLTjQYE0DCUSI7awBCNfdW0AJZiHt508zqh9eXkuE9ds64CDDDEUy8LR15IGD8wWY/zApv0XT+gmenEZv5/VNXzw7mkITvSBymjNCJhurXayHnH0xbwQ0/lhfdmjK3epDEyaxEJ+SZKXajZdbRLyjMPpflx5+oyFUDPHVSJMJWB1tDcnX5mbm0xdICIbHajg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+vJ1Qv7fu7oy9O8UCvme8VhxCJxcEjbVzowh7uIv/C4s5xvB3e9ujQQCv0xv?=
 =?us-ascii?Q?OutaM3dQuagNve2PffJ0AQHw/HWP9fhBsXqs6SnH65RFX1Pospx5x7pIZ/Uy?=
 =?us-ascii?Q?2xa9iPiImBYwbJ28y4xTsQtUgPnY4Qxofa9gTSgrt5Cac03nMVbSri7PRr/f?=
 =?us-ascii?Q?jdbtF6Hzq4FvL2Sdh9Z6J6j+9GaLhVXCAgMpaqqf73Vy9ijjyDGuwj4oXA/H?=
 =?us-ascii?Q?kwUNNn9Ez4UO6BZMatraRf8nQtkb7HJ0WtGYt7M7CBKm+A2yREkFamA/UJD9?=
 =?us-ascii?Q?/qEVVwi6MbDfYCLbSKdqzcC+3gL30l0yS7YwOLX01fiEiogDSdYmMt9MAiM6?=
 =?us-ascii?Q?vfsA3+0pNEQqCh+EbHfvm2lQoQTeNCbwQgvn+ZE861Lx5+ynYsHAUKyODBLb?=
 =?us-ascii?Q?M73kPPPB+kGfADKRZKru+WifzYtwptrkTDcKDu013ngYmHCAEcZZwPcHC9+J?=
 =?us-ascii?Q?TcOnhztn58OrWaBticKwjf2R7iU6gPAu7Kb6MkN5bk7nCqEVCT5JBMtOncFt?=
 =?us-ascii?Q?3LzwRPqv/DwdSzuoZaJ6w99fYZX6z0oVqgC9XzttakoJ2IF33l+Me3PaqVtv?=
 =?us-ascii?Q?gJE+2/2KFxECdE7KPn7oE1Q9PQvjZ66o7CjGDMGNckbAAokeFDx22/DJz8cH?=
 =?us-ascii?Q?J6ga8yKlGPPxiV8OUW/14Lk9xuSNTP/EiPUvaVfKuFNpxQ6sFzuHqt6fSPeT?=
 =?us-ascii?Q?/QJ2vMdiPWsb6ZVLKEIsp1tSK1hUFGFwPGM9LXDbuR+WaqBDcmokJRSkfBqR?=
 =?us-ascii?Q?Cfys/rPaNmMGmLDgdFnWAxEUawCEC2P/5D+BfjkDvEnjk2f+NZ5hOUY7RcWb?=
 =?us-ascii?Q?yswchs+FfW9nQubmVVGbFUWZOqOgO3BSuIf4yFgoWwJBSKEQ7PGf1lePefCg?=
 =?us-ascii?Q?bhSgO5TD/omC1/6NWFYLQVxSwKXUOJiZ7i/arEyv33j0HYohhvErqEmCkUvs?=
 =?us-ascii?Q?s5Axt3ggJA2f1xL6PhgEQDNmjPCI5wM3lHbCqKQ9e+1hBVhWaqvAEvmhyG3t?=
 =?us-ascii?Q?I5QDS6/sd1uBgHHUw3dWg4/AV/bXT8d9g1lddwJT/qO0ijpfMMVxUucLFOJT?=
 =?us-ascii?Q?KocNz6SQ3BNsVeKsdH36ecfqVigtEKiqly+Mn/ZeFcjB911EO2A6xm1R1gbH?=
 =?us-ascii?Q?jJjJRp66mOYMbduPMzIdNeZXJpevgFmaToHmH4kL2vsOXWAK3xMY7aZtGHW5?=
 =?us-ascii?Q?D3hMFwb4zH22o4rfCOBs7h+hJY6f9wqsKvkB3w7oLOcWN2pYQjW0bAwCArYF?=
 =?us-ascii?Q?2DvG6kbB30AQ8tHNjyIYZOiS8UgQyVvStY8EQ8viZLr5IeUeKkQF+CdXJFOM?=
 =?us-ascii?Q?8NpbSC+HmcAD1WcovpLDjU1N/VELtSYFoUUEZ74wYA2XXYe50F7G9ZjZD2vv?=
 =?us-ascii?Q?ujWLOXsIuj0mEot44n/1yauJ2w6YuGF+EAmEOBKiNeeoB90Gcb296T1Tqq1q?=
 =?us-ascii?Q?zfmWqwNPclTSP0/4ADT7KZrwo7cncVwCbAizsqH7g7spSTJgRozIpbkl8q+K?=
 =?us-ascii?Q?UZX+ZfTmugM3wMFzrtZj8toDiRP+hoBElISlTDtVfbpq6A84hzE5kIlNKott?=
 =?us-ascii?Q?jZYuJ+oEuAF8+LuEFzf7/r8W89tWMpjNpwkcB9f2q5/PAMujWuskRzywCT8M?=
 =?us-ascii?Q?uJMrhdWjEeyhmkmwfeDxenshpe/d6Ne23ZMOylKvxd2jATVrHSLoTos67hYh?=
 =?us-ascii?Q?6Ircet/vCvUVIr+6TdI8qlFm89azI1qIjXm7hUnyiTvKeNC1O0JY4ofM71Xa?=
 =?us-ascii?Q?y3Z9uwTEfnM2kyXLf9Ss43Yu9oJpjNM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bvCC2GQ/2S7usulCZAtQp6Xp4nuB2SZC0sbq39r3A1Oc7qJMQokxJ2BrkkSriuBkeFTTxwhgTJV0XqAtzCz3HN0bOm7LNIXA4cWxH4Kg1MRkuoIWinmD9BU3VCC/Wgopv0iCT1l/CQxzJ3cOsQFmeqDXVhESy1HRJ7GwwH1na+Quyp7Qsy2NWR9St5efd5gShqO5G/2tAVUxb7XRM2eNrOrXPNjFav5vlCZpvo+v9TRDfzE0IqyGnssHILFMPLefmcF+NeUs5zniag2JokRnZJhjpItPUe3fGwPo5hKt0Ks5UQBsktyBEhAnfVinfguzCCU/Rz7IDjFQ1mXhhO7Z4A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee630834-67bc-4b4e-f9fc-08de83dfa50e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 04:42:50.3175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZ72E+Phi5XmE9QqqOMlXQekex6h366NaNr0lMAW8Z+GrpBrfvjDNx1js/l3dzv/6o7BX7Fzu6WKfGurPsmmZC/cKGyyINI79DaSE2NP1Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9061
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

Have mail client problems, so sending from Outlook

> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Friday, March 13, 2026 11:07 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
> Subject: [PATCH v2] drm/xe/oa: Allow reading after disabling OA stream
>=20
> Some OA data might be present in the OA buffer when OA stream is disabled=
.
> Allow UMD's to retrieve this data, so that all data till the point when O=
A stream is
> disabled can be retrieved.
>=20
> v2: Update tail pointer after disable (Umesh)
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c inde=
x
> dcd393b0931a2..2efc16c3a95df 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -543,8 +543,7 @@ static ssize_t xe_oa_read(struct file *file, char __u=
ser
> *buf,
>  	size_t offset =3D 0;
>  	int ret;
>=20
> -	/* Can't read from disabled streams */
> -	if (!stream->enabled || !stream->sample)
> +	if (!stream->sample)
>  		return -EINVAL;
>=20
>  	if (!(file->f_flags & O_NONBLOCK)) {
> @@ -1456,6 +1455,10 @@ static void xe_oa_stream_disable(struct
> xe_oa_stream *stream)
>=20
>  	if (stream->sample)
>  		hrtimer_cancel(&stream->poll_check_timer);
> +
> +	/* Update stream->oa_buffer.tail to allow any final reports to be read =
*/
> +	if (xe_oa_buffer_check_unlocked(stream))
> +		wake_up(&stream->poll_wq);

Reviewed-by: Umesh Nerlige Ramappa<umesh.nerlige.ramappa@intel.com>

>  }
>=20
>  static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream *stream)
> --
> 2.48.1

