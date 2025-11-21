Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A8CCFC28B
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 13:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12E810E8AF;
	Fri, 21 Nov 2025 13:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="mRjGVbUt";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11021106.outbound.protection.outlook.com
 [40.93.194.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437BC10E851
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 11:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3gRZc9NGnx7tBz00wEUnmLNz7yHTwAZGXhC0VNLZJ5AmydYutt1oAmiwI3FSLq6/CzFJ0zNzkFf91QJBtPOVXebirho6HpmxJDNBkpOPVYYgGTW8PN8CS7dvSYsCiMZDE9Mm2pIuWT8SZFb4Jn+Ml/xMIyx7lygz/3BvNItJOY9OE6e74n4/26Twc+Icplu37ufA7SH/Fc5jYOkQ6re7qZvpUAlhO5AI8ilI8FB2yg4Veu5smrfXZf6SOw28u/NQ/chqX0dRznsZZOPZRwGO5ZozcAXsy4QaovTkLEsdEZKqco69gorxeBTIevzF0grIi/XpDSWu8MPR9X3TNhVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zg42CVc89DVdyzrac0fMheg8quVFM0gdr0lsxE+Mpic=;
 b=Uxys1SkzwS9G4Fqawq6gJMUiasoQgyo007/OTuvN3lOEkUMHWpWRHOOH6yxtPj1LTKRaAphP7zW49ECDYNn00PXfx7+73jrbaLOu/iyrA0PffAVGsmd4mTRnoY6i4mqmG0DyuDuTkl+w72cMlUSQmr1K7vOMrlA6huEzhM8ra2RuThw8w/29YvXOC//3jHkSzRyyquAvTQsYZfZ5d6pHpmmd3xyojXNFvTqWgvinSk/lewlUtLKFbDE6+O5bhK0rkjtQic4R/FYkEflzMY6lKSgDqjgfJm4KAsA9KPQdBeboRmG8DE6Mx90qG4SkRrK+BUf7JuSo0uxXpBiqNzkUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zg42CVc89DVdyzrac0fMheg8quVFM0gdr0lsxE+Mpic=;
 b=mRjGVbUt4RmwvTVJRBEwjxMHoEy3D6FtUK4ahhi8NYvrxbUbXbnqd7g+LFoA+mouv0sUNEqqmyJIQqBf4ltj1xpRskXVsVUimN8JWstOHajhjpLOrLRQbvyxLnWqNdASWcaD/nkbwOiKd/+RVry4UMBfRCdjAByI9K3FRe5JYMk=
Received: from PH0PR03MB6299.namprd03.prod.outlook.com (2603:10b6:510:d7::6)
 by PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 11:08:55 +0000
Received: from PH0PR03MB6299.namprd03.prod.outlook.com
 ([fe80::69b6:856e:6a8:efda]) by PH0PR03MB6299.namprd03.prod.outlook.com
 ([fe80::69b6:856e:6a8:efda%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 11:08:54 +0000
From: Jakub Prussak <Jakub.Prussak@synaptics.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: PPD-Penguins <ppdpenguins@synaptics.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: Cache coherency issues when reading from intel Xe buffer.
Thread-Topic: Cache coherency issues when reading from intel Xe buffer.
Thread-Index: AQHcTvSGSwgVcKwRqk6g8QYSwCbQ1rTyIZmAgArtf0k=
Date: Fri, 21 Nov 2025 11:08:54 +0000
Message-ID: <PH0PR03MB629967290E70844BB590F46FE9D5A@PH0PR03MB6299.namprd03.prod.outlook.com>
References: <PH0PR03MB6299572C46068849DBDD3A88E9C2A@PH0PR03MB6299.namprd03.prod.outlook.com>
 <b2f3b7ea-f848-4da4-868f-07742c31e6c1@ursulin.net>
In-Reply-To: <b2f3b7ea-f848-4da4-868f-07742c31e6c1@ursulin.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6299:EE_|PH0PR03MB6525:EE_
x-ms-office365-filtering-correlation-id: aeffcd48-8952-47c5-b4b9-08de28ee5c42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?qXP+rV4R7yjCijwDYw+oKtAh+6cXNzynWEg0kDmyqRsxv0QFeXubMOUID3?=
 =?iso-8859-1?Q?YWkx6cfKouOekkwJpc7kDoR8GLra+6Scey0ojHoxvRdsfoOuLhB/RvQva+?=
 =?iso-8859-1?Q?ztSH5cQ9+xyC6tjnDO86ccP7cUq8khYVeKXaZyoE8cWRabvzAewwAbIDn9?=
 =?iso-8859-1?Q?EyWM7y8+9bwRrltRQKkfim+mYg4MpDxNcQnoL5rKUUVbp/lUl5xgTc9QWt?=
 =?iso-8859-1?Q?GUQB9l/6SqhFPCNlxvHlN9ZzFF5eEx8TEjdEl+x5oAzVDNE4dtNglvWial?=
 =?iso-8859-1?Q?CQJLvTach6VcPGklPjCWesBkKI8+Zn0/0kfuOxmbRBny+a+rjHb3NAADYN?=
 =?iso-8859-1?Q?IJI1sPUGBRchEnn09sJt8OGKwSZTSYJL1TNTjFhMqw6xOrfchybvirsgji?=
 =?iso-8859-1?Q?8zkr4ZTr7gba/UWWY0EzkTQY1eRNbX7fjy0FEpf3bbVaInHUzW9xqR8j8J?=
 =?iso-8859-1?Q?E3vDDSU4nGqfZMbQcjJVWnYFPqnWjWCzGNBGcF1AUhh5P7WO4CKPFqjt7a?=
 =?iso-8859-1?Q?Rm52mb7JuEw/WV+0N95JFAe/c9xDd0AOVRqKfKLVoNGIJYHa29xbjIf+PB?=
 =?iso-8859-1?Q?hPWcgxhbznrCaG32NamsEHq7h89DCWtHvKvH/FZ0KvBHLPyd4Lftloa2Hd?=
 =?iso-8859-1?Q?50MTk/b91nqxaIDf0NY5GTYcpSEQPHqNOn3JdksGfgtyXoVi/Vub0LZSXO?=
 =?iso-8859-1?Q?SdEyOjxVoGBj65PP5Uf9nIiVacdRdMNuNDkv06uhPExecefjmNYK+LAqJe?=
 =?iso-8859-1?Q?CgD/fRGXaVFbcEjIT5V1OUcMvTtI9Tml8N5GVkcKw+XCkTDE5gMt6Cvz0Q?=
 =?iso-8859-1?Q?5S1G/octIP7VcwdXrab34CnUrNwDXLTEQbbYfmJwPTWdG7QezVoG3nnVeA?=
 =?iso-8859-1?Q?07eBZY2DcWey7YrGhKI0zSw81abyivGx9O7eIrsLPNmTMqnx2rcJSgdwul?=
 =?iso-8859-1?Q?jCNlbQiantHpeKYmztffYR1rnD3H/Eh3RZ9ATzOuRvtUdq2qACK5CUFCcm?=
 =?iso-8859-1?Q?rjs6MATTs/B4jisOucywn+gkXv4mRwLPNM5mwPObkQyHozTS2AaU++8Pab?=
 =?iso-8859-1?Q?bxvcGWiOQ0R9I20plJhtohJ+T3+zl+1yoM3OvTmankS1Jsf8YemLxZuklB?=
 =?iso-8859-1?Q?YrX8+OSIGzY/lhjKMUU40GdlJRbfJdq5oUWMdOEfYysp5WAtMRw6hXLxSk?=
 =?iso-8859-1?Q?T9QOFJEkJeqRL0obtnxwwVKTZNGab4fNR9skvkQSyrt7OFOfwIZwl2Xui+?=
 =?iso-8859-1?Q?OVyAgTzIWnxf+75BLRHNIftfencUX40IHqJ9IWevkiom/0F7u+G/tXidtc?=
 =?iso-8859-1?Q?R2MOjZr+riFmrO80pPyvCa483JRhYRg4/urI6NRaMLGzVXJG5StrB8tg0y?=
 =?iso-8859-1?Q?gpe4gewpEc5gLrTuIq3Vn9/o8MtKExdtNbeJ3+nMwrysF59Z4f3Us9k/tU?=
 =?iso-8859-1?Q?VAlwETxcNkFiQWWZWrns+Shz9+E5cEJAk6gaDALLcP8aWC4fvV532Xqen/?=
 =?iso-8859-1?Q?nFns57jvfEoN6g7D7WU52NSirah5yj1lj9GHpbDsmv+Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6299.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021)(13003099007)(8096899003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uRwKsxFaw8p4zGs9qSbVO63r1b1NbxgGGfe0rIbzGbO/hXnHUeDeuu6jqI?=
 =?iso-8859-1?Q?AP0TTG7n1/3VCzIQBtuUMnWRWUvBsH8Jd4vdUOn94BYFpPxiBitwOU0B9O?=
 =?iso-8859-1?Q?UDyVhI0KlC/JkOwjzPwFuqyciCxElzEQGtjbSVkOzCFSZkeQmCkKjyg5av?=
 =?iso-8859-1?Q?VOAPNXp49ds+utELLI8SqzCKV1eyi+l3Rm3dD+zRt2KgvhQIsmO3fAbUtI?=
 =?iso-8859-1?Q?Ml1zdaFe00tOjindZ+5fBpjadeaZKAunpxqhODeYL4Fq82O7qeNmvibdws?=
 =?iso-8859-1?Q?zhtQEJdrCkK4FShSEZcn0JSaKJWZJ/eBOU6Tfsr7UBtzMBv/l96MECeuwr?=
 =?iso-8859-1?Q?+0B3aSirFeJ7fbjv7/Yw69mFdUKUPbU6B3jgMkMfUasBHjoBFy5eStHzng?=
 =?iso-8859-1?Q?r6byv3vVW5U0tqbgA3txRlb0VteZwZzaHhRnnZWZiQZv0LVXp1+jk6ttzf?=
 =?iso-8859-1?Q?a4v52CFcR2cCvjcrvO/DJX+HVPssC4vjc1F2ZVArqvh6RloJxgVCsGd7pL?=
 =?iso-8859-1?Q?CwHru2Ur87+THila1usSswAwtqGteMJDgtEWMap6IKAH4VuVE+6JYy5dHD?=
 =?iso-8859-1?Q?JZuc8NUQp8vGFtPDDvjFrywEP1vHsYmQnhYHGiqHB0OY/fTBIBB9HDhdb2?=
 =?iso-8859-1?Q?SfPA6Ff0wAqkjvM1p3whmvHryJWuWogwrzBERgNbMfgrhwggaH+dj+W5tK?=
 =?iso-8859-1?Q?2ymI0T6ucfk1rw8yU9rjbVpNIi1pQX1D9gqV32DXOApLuXtM5AfYerm1St?=
 =?iso-8859-1?Q?v5jnQnRXRA3t/NbU8BeeLgdiyDDHXMDowj4LwCzoERiHiIjaUUy5wTubD0?=
 =?iso-8859-1?Q?pCOrdvm9TM5QaQrNnR0EygjYxTy5bXXTcnEXU9xJt2wj4MuUKclehNbGoS?=
 =?iso-8859-1?Q?yEid9QAhLjvUO0pFDhF+IP/McPYZ5DbqQWvv6Niipta89H2nN7A+jYoxSk?=
 =?iso-8859-1?Q?xifKXgKYxCq9iknggRimPS1evTTuIv8cM9vbx2GTZu7Yx+lnG/HV7QDxZA?=
 =?iso-8859-1?Q?9WGj4Uwnb4t7SDHW7N5azltb5scxH2/bnIIBQ/+OEf3lRkRJPxHbz6f6pG?=
 =?iso-8859-1?Q?n8ldgdvUWoLibzLADJUlnOnor2WbY74y7LBMn/0hhB8cn9X5GHhUyANMcQ?=
 =?iso-8859-1?Q?d1EJfUPBOu9ew84hLcE8OJEhtTrCsbWjChcJBMlUbCXERcdRDRNi/m/73a?=
 =?iso-8859-1?Q?G8gD5kKU0JxNTxNEHG3UXRX9H8fs4sXiL0agauMRHghSDt8WfylI1FVyor?=
 =?iso-8859-1?Q?TuTOVH8qJh/oCofw8G7MBiH1uKh2vrCT9GnC74/wmlSRgp+lQHQn/Zytyo?=
 =?iso-8859-1?Q?8CLbkjMJtfvjQRAXrtnsKtzhdq+jXzXQLDWjq85AIoR0qowPgVCYg8Tmrc?=
 =?iso-8859-1?Q?qKYB8c7zD2Lh23NMdtkIFluRzDCn2mRwmV5pWizz7KznIbue1hxjPEps3C?=
 =?iso-8859-1?Q?3TPTKz62qgPPuedw9qmGmkT7cVOrUFyf1fRIFwFwXRcGlyPWgx4TXHJdVE?=
 =?iso-8859-1?Q?ATpK0QXUG4xvTeRE4+hH6I23XINaLmc1yPQcUWAMWTzBoewGIJrEvLje+n?=
 =?iso-8859-1?Q?q5t0w8znE6Vk7VHpGJ9oHVHP4Za+qFZ9PhIWjgPRV8GxskRAHgl4BW1Qst?=
 =?iso-8859-1?Q?b3YTjtMem5P2qfOpmW8Lr2Hpswsr22LvqY?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR03MB629967290E70844BB590F46FE9D5APH0PR03MB6299namp_"
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6299.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeffcd48-8952-47c5-b4b9-08de28ee5c42
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 11:08:54.8140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTJNHzj32qPSWvHviYCL/JXLSWuCrzDJZ/xRg80sliIvQ+LAqulxG+hF8DHGbBARAGIeNonNgwtYSHyZ+3UZWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6525
X-Mailman-Approved-At: Fri, 21 Nov 2025 13:53:11 +0000
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

--_000_PH0PR03MB629967290E70844BB590F46FE9D5APH0PR03MB6299namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I raised an issue on gitlab to discuss it further there as Jani suggested.
Thank you for your help and advices.
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15295

Regards
Jakub Prussak
________________________________
From: Tvrtko Ursulin <tursulin@ursulin.net>
Sent: Friday, November 14, 2025 1:11 PM
To: Jakub Prussak <Jakub.Prussak@synaptics.com>; intel-xe@lists.freedesktop=
.org <intel-xe@lists.freedesktop.org>
Cc: PPD-Penguins <ppdpenguins@synaptics.com>; Lucas De Marchi <lucas.demarc=
hi@intel.com>; Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Rodri=
go Vivi <rodrigo.vivi@intel.com>; Dave Airlie <airlied@redhat.com>
Subject: Re: Cache coherency issues when reading from intel Xe buffer.

CAUTION: Email originated externally, do not click links or open attachment=
s unless you recognize the sender and know the content is safe.


On 06/11/2025 08:24, Jakub Prussak wrote:
> Hello,
>
> For some time, users of DisplayLink USB-3 docking stations face
> corruptions Ubuntu 24.04 on machines with Intel i915+Xe driver (LENOVO
> IdeaPad Pro 5 16IMH9 in our case)
> Machines using only i915 driver are fine.
>
> DisplayLink driver is using evdi kernel module(https://urldefense.proofpo=
int.com/v2/url?u=3Dhttps-3A__github.com_&d=3DDwIDaQ&c=3D7dfBJ8cXbWjhc0BhImu=
8wVIoUFmBzj1s88r8EGyM0UY&r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&m=
=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&s=3Dl-D=
na0cggg7SGFuTPlE9cmR70uk2daWGIWX9Hr9EiIA&e=3D
> DisplayLink/evdi/blob/main/module <https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__github.com_DisplayLink_evdi_&d=3DDwIDaQ&c=3D7dfBJ8cXbWjhc0=
BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5x=
wk&m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&s=
=3DWKMscZpPTcTNxU2-zfzlxyXP0hpBHxyeAEuPgobrkmY&e=3D
> blob/main/module>) that works as drm output slave. It is using drm_prime
> exported buffers from i915 driver.
>
> We had checked a way evdi access dma-buf exported buffer, e.g. if it is
> reading it within dma_buf_begin_cpu_access/dma_buf_end_cpu_access.
> Also, we ruled out access to the buffer before all dma_fence's on
> drm_plane are signaled.
> Another approach was to wait on dma_resv resv object from
> drm_gem_object's dma_buf_attachment, again with no luck.
> The issue is reproducible with evdi's evdi_gem_object and generic
> drm_gem_shmem_object implementations of drm_gem_object. Corruptions are
> visible with all compositors - XServer, Gnome/mutter, weston.
> Other kernel module facing this issue is udl.
> Nothing was helpful and we suspect some cache coherency issues.
>
> The problem can be reproduced on the latest kernel on computers with new
> Intel devices, and a lot of our users face this problem (https://
> github.com/DisplayLink/evdi/issues/524 <https://urldefense.proofpoint.com=
/v2/url?u=3Dhttps-3A__github.com_DisplayLink_&d=3DDwIDaQ&c=3D7dfBJ8cXbWjhc0=
BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5x=
wk&m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&s=
=3D3D8NR30gujXBRYKDkPmpVKIG2OudSPxxtIGeOV9PJaI&e=3D
> evdi/issues/524>). The way to reproduce it requires installing EVDI
> module (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com=
_DisplayLink_evdi&d=3DDwIDaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0U=
Y&r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&m=3DkuFvRoViA0vp-ArrQlJ2-=
g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&s=3DV_hsGP-mQHzI_uXutOT2wem9gZO=
9sfrI08XtOMQNTtM&e=3D  <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__github.com_&d=3DDwIDaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&=
r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&m=3DkuFvRoViA0vp-ArrQlJ2-g0=
yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&s=3Dl-Dna0cggg7SGFuTPlE9cmR70uk2d=
aWGIWX9Hr9EiIA&e=3D
> DisplayLink/evdi>), loading it and creating a virtual screen (this can
> be achieved with this sample app: https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__github.com_jakub-2Dprussak-2D&d=3DDwIDaQ&c=3D7dfBJ8cXbWjhc0=
BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5x=
wk&m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&s=
=3D8vev00zm3uYvNYqjUv2-wuY-__LC6VKa6HSB3NosTmU&e=3D
> synaptics/evdipp <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__=
github.com_jakub-2Dprussak-2Dsynaptics_evdipp&d=3DDwIDaQ&c=3D7dfBJ8cXbWjhc0=
BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5x=
wk&m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&s=
=3Dz_ZMYXxBjH2nn8wHCx8QVYP4x184eQEPraa7tvNcMU4&e=3D >).
> Once a virtual screen is created, the artifacts should be visible while
> moving the window around on that screen (see the attached picture or
> user reports mentioned earlier). Similar issue appears with devices
> using UDL driver on Intel platform. Attached are device information
> files and a dmesg output when reproducing this issue.

If the exported buffer is from i915 then it sounds the same as the AST
driver issue. See the whole thread at
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_dri-=
2Ddevel_20251024110432.1313391-2D1-2Djfalempe-40redhat.com_&d=3DDwIDaQ&c=3D=
7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5i=
mGzUfM_7UN6O5xwk&m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0=
VudSTfDias&s=3DJ6mvOSxsGxM9rhbBOrhat1mg9hqX7DBZByqIalyONQc&e=3D .

Special 1-way Meteorlake coherency, which I cannot remember which way is
that 1-way, and exported buffers may be broken. Especially since the
internally driver pretends things are fully cache coherent which makes
the begin_cpu_access on the importer side is a no-op (more or less).

Anyway, someone who remembers how was Metorlake supposed to be handled
will be required here. Ie. is it "as designed" ie. userspace needs to
manage it, or the i915 side of things was added incomplete.

Regards,

Tvrtko


--_000_PH0PR03MB629967290E70844BB590F46FE9D5APH0PR03MB6299namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I raised an issue on gitlab to discuss it further there as Jani suggested.<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you for your help and advices.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15295">h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15295</a>&nbsp;&nbsp=
;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Jakub Prussak</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tvrtko Ursulin &lt;tu=
rsulin@ursulin.net&gt;<br>
<b>Sent:</b> Friday, November 14, 2025 1:11 PM<br>
<b>To:</b> Jakub Prussak &lt;Jakub.Prussak@synaptics.com&gt;; intel-xe@list=
s.freedesktop.org &lt;intel-xe@lists.freedesktop.org&gt;<br>
<b>Cc:</b> PPD-Penguins &lt;ppdpenguins@synaptics.com&gt;; Lucas De Marchi =
&lt;lucas.demarchi@intel.com&gt;; Thomas Hellstr=F6m &lt;thomas.hellstrom@l=
inux.intel.com&gt;; Rodrigo Vivi &lt;rodrigo.vivi@intel.com&gt;; Dave Airli=
e &lt;airlied@redhat.com&gt;<br>
<b>Subject:</b> Re: Cache coherency issues when reading from intel Xe buffe=
r.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: Email originated externally, do not click=
 links or open attachments unless you recognize the sender and know the con=
tent is safe.<br>
<br>
<br>
On 06/11/2025 08:24, Jakub Prussak wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; For some time, users of DisplayLink USB-3 docking stations face<br>
&gt; corruptions Ubuntu 24.04 on machines with Intel i915+Xe driver (LENOVO=
<br>
&gt; IdeaPad Pro 5 16IMH9 in our case)<br>
&gt; Machines using only i915 driver are fine.<br>
&gt;<br>
&gt; DisplayLink driver is using evdi kernel module(<a href=3D""></a>https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_&amp;d=3DDwIDaQ=
&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DW1EIKVsQFqx7AC=
p4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB=
7f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3Dl-Dna0cggg7SGFuTPlE9cmR70uk2daWGIWX9Hr9=
EiIA&amp;e=3D<br>
&gt; DisplayLink/evdi/blob/main/module &lt;<a href=3D""></a>https://urldefe=
nse.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_DisplayLink_evdi_&amp;d=
=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DW1EIK=
VsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU=
6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3DWKMscZpPTcTNxU2-zfzlxyXP0hpBHx=
yeAEuPgobrkmY&amp;e=3D<br>
&gt; blob/main/module&gt;) that works as drm output slave. It is using drm_=
prime<br>
&gt; exported buffers from i915 driver.<br>
&gt;<br>
&gt; We had checked a way evdi access dma-buf exported buffer, e.g. if it i=
s<br>
&gt; reading it within dma_buf_begin_cpu_access/dma_buf_end_cpu_access.<br>
&gt; Also, we ruled out access to the buffer before all dma_fence's on<br>
&gt; drm_plane are signaled.<br>
&gt; Another approach was to wait on dma_resv resv object from<br>
&gt; drm_gem_object's dma_buf_attachment, again with no luck.<br>
&gt; The issue is reproducible with evdi's evdi_gem_object and generic<br>
&gt; drm_gem_shmem_object implementations of drm_gem_object. Corruptions ar=
e<br>
&gt; visible with all compositors - XServer, Gnome/mutter, weston.<br>
&gt; Other kernel module facing this issue is udl.<br>
&gt; Nothing was helpful and we suspect some cache coherency issues.<br>
&gt;<br>
&gt; The problem can be reproduced on the latest kernel on computers with n=
ew<br>
&gt; Intel devices, and a lot of our users face this problem (https://<br>
&gt; github.com/DisplayLink/evdi/issues/524 &lt;<a href=3D""></a>https://ur=
ldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_DisplayLink_&amp;d=
=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DW1EIK=
VsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU=
6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3D3D8NR30gujXBRYKDkPmpVKIG2OudSP=
xxtIGeOV9PJaI&amp;e=3D<br>
&gt; evdi/issues/524&gt;). The way to reproduce it requires installing EVDI=
<br>
&gt; module (<a href=3D""></a>https://urldefense.proofpoint.com/v2/url?u=3D=
https-3A__github.com_DisplayLink_evdi&amp;d=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0=
BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN=
6O5xwk&amp;m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTf=
Dias&amp;s=3DV_hsGP-mQHzI_uXutOT2wem9gZO9sfrI08XtOMQNTtM&amp;e=3D&nbsp;
 &lt;<a href=3D""></a>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__github.com_&amp;d=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EG=
yM0UY&amp;r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA=
0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3Dl-Dna0cggg7=
SGFuTPlE9cmR70uk2daWGIWX9Hr9EiIA&amp;e=3D<br>
&gt; DisplayLink/evdi&gt;), loading it and creating a virtual screen (this =
can<br>
&gt; be achieved with this sample app: <a href=3D"https://urldefense.proofp=
oint.com/v2/url?u=3Dhttps-3A__github.com_jakub-2Dprussak-2D&amp;d=3DDwIDaQ&=
amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DW1EIKVsQFqx7ACp=
4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU6Ur-uiTWB7=
f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3D8vev00zm3uYvNYqjUv2-wuY-__LC6VKa6HSB3Nos=
TmU&amp;e=3D">
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_jakub-2Dp=
russak-2D&amp;d=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0U=
Y&amp;r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA0vp-=
ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3D8vev00zm3uYvNYq=
jUv2-wuY-__LC6VKa6HSB3NosTmU&amp;e=3D</a><br>
&gt; synaptics/evdipp &lt;<a href=3D""></a>https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__github.com_jakub-2Dprussak-2Dsynaptics_evdipp&amp;d=
=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DW1EIK=
VsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA0vp-ArrQlJ2-g0yyELU=
6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3Dz_ZMYXxBjH2nn8wHCx8QVYP4x184eQ=
EPraa7tvNcMU4&amp;e=3D
 &gt;).<br>
&gt; Once a virtual screen is created, the artifacts should be visible whil=
e<br>
&gt; moving the window around on that screen (see the attached picture or<b=
r>
&gt; user reports mentioned earlier). Similar issue appears with devices<br=
>
&gt; using UDL driver on Intel platform. Attached are device information<br=
>
&gt; files and a dmesg output when reproducing this issue.<br>
<br>
If the exported buffer is from i915 then it sounds the same as the AST<br>
driver issue. See the whole thread at<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kern=
el.org_dri-2Ddevel_20251024110432.1313391-2D1-2Djfalempe-40redhat.com_&amp;=
d=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DW1EI=
KVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA0vp-ArrQlJ2-g0yyEL=
U6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3DJ6mvOSxsGxM9rhbBOrhat1mg9hqX7=
DBZByqIalyONQc&amp;e=3D">https://urldefense.proofpoint.com/v2/url?u=3Dhttps=
-3A__lore.kernel.org_dri-2Ddevel_20251024110432.1313391-2D1-2Djfalempe-40re=
dhat.com_&amp;d=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0U=
Y&amp;r=3DW1EIKVsQFqx7ACp4Hsw-KtUjZ5imGzUfM_7UN6O5xwk&amp;m=3DkuFvRoViA0vp-=
ArrQlJ2-g0yyELU6Ur-uiTWB7f1l7GCsjPoxnhrJ0VudSTfDias&amp;s=3DJ6mvOSxsGxM9rhb=
BOrhat1mg9hqX7DBZByqIalyONQc&amp;e=3D</a>
 .<br>
<br>
Special 1-way Meteorlake coherency, which I cannot remember which way is<br=
>
that 1-way, and exported buffers may be broken. Especially since the<br>
internally driver pretends things are fully cache coherent which makes<br>
the begin_cpu_access on the importer side is a no-op (more or less).<br>
<br>
Anyway, someone who remembers how was Metorlake supposed to be handled<br>
will be required here. Ie. is it &quot;as designed&quot; ie. userspace need=
s to<br>
manage it, or the i915 side of things was added incomplete.<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR03MB629967290E70844BB590F46FE9D5APH0PR03MB6299namp_--
