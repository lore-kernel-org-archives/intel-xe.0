Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2A8D3B7E1
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 13:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5939189622;
	Mon,  8 Dec 2025 13:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="EgAKGqsG";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11020100.outbound.protection.outlook.com [52.101.46.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441610E18A
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 13:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNCyIJ7eMIauRDzEv5PPmN1hkoZialF9SYM+c9LCMXv2WzcBGGzQNDZqJh8mxzdEo9cN6SiXxO7mzTVxvBkE2PA3Futp/V1eGUUcpc9ErcsqCAK9XT1TRpjY17pkGD3waUBi7b/zZE6JCjiHLRMGsd9RQSm8ZC0Xq6tr8rutL6Cps/em4mc8ouR/Zjxxjnu/lwYLb0E6UcFG2DoLJ2+y2GLNj1+V/zFAwMSdztFURUb0buKfuMMdDSb9dj2WXlX/llkhHZCFMb7TAQHtD5D+J/8LYTWrsWANkQJwceHfeyMi61inBpDaoIq3YBgrKV9TkldpsNnqG6M4GYidBlJWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYk0P+JB/PUXEHsKrMhSaFr1xBahDY4xQTaMJ21MJ4g=;
 b=zBxAaq8L5uKughyzwIB1vh8hZPKB/IRmKy7Qfl9/16vOvsCfeaWAFty+kf3/wwEysO6nQWrkKIx/BFKhMj77Y6v2whLWe41PEkPduQVnZXZL/Bcef1/gHZasZsomDm9lm489+JudKPKrr4MA/EAR1zO3YGvBvEAMvVcyY4tyb49BJBsROB6EyPjNqPMKESyzYlW7qxmyUairgjzYc8cqf1Q3o/8/8JpGE5osoWuJT/iHFBLNbQKddqN9+LyyQAechN3RB67RTLqThW8cn91MQ/DQ4Yele+B49oG80XZen6fJ2QmsQnjxGrxUPmP4xYSn8KHGAqbtdFpbXuxRgxpyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYk0P+JB/PUXEHsKrMhSaFr1xBahDY4xQTaMJ21MJ4g=;
 b=EgAKGqsGvVE4F3kcNy5JAFgFY4tK511UTi/JMiBDuQyOIO1gZRKj0APSCrVgMBDKZnM5m6SrPWYaHKL4b+exYtuzpVWKYYIXxpiQTl6HZDZGlXMCYHE6EgqYuN/o1ofeKcQrdqb0r8yZ0gShNaDupiEw1VaNrZ9DXZ3WcYqjVFw=
Received: from PH0PR03MB6299.namprd03.prod.outlook.com (2603:10b6:510:d7::6)
 by PH0PR03MB5893.namprd03.prod.outlook.com (2603:10b6:510:32::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 13:38:37 +0000
Received: from PH0PR03MB6299.namprd03.prod.outlook.com
 ([fe80::69b6:856e:6a8:efda]) by PH0PR03MB6299.namprd03.prod.outlook.com
 ([fe80::69b6:856e:6a8:efda%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 13:38:37 +0000
From: Jakub Prussak <Jakub.Prussak@synaptics.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: PPD-Penguins <ppdpenguins@synaptics.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: Cache coherency issues when reading from intel Xe buffer.
Thread-Topic: Cache coherency issues when reading from intel Xe buffer.
Thread-Index: AQHcTvSGSwgVcKwRqk6g8QYSwCbQ1rTyIZmAgArtf0mAFierVg==
Date: Fri, 5 Dec 2025 13:38:37 +0000
Message-ID: <PH0PR03MB6299239D2158BC639BDC7DD1E9A7A@PH0PR03MB6299.namprd03.prod.outlook.com>
References: <PH0PR03MB6299572C46068849DBDD3A88E9C2A@PH0PR03MB6299.namprd03.prod.outlook.com>
 <b2f3b7ea-f848-4da4-868f-07742c31e6c1@ursulin.net>
 <PH0PR03MB629967290E70844BB590F46FE9D5A@PH0PR03MB6299.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB629967290E70844BB590F46FE9D5A@PH0PR03MB6299.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6299:EE_|PH0PR03MB5893:EE_
x-ms-office365-filtering-correlation-id: 8db5b66b-3d74-4fd9-997b-08de3403983e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003|38070700021|7053199007;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?o2Svgl1TpZzzbwITABJloPWzNvRxgyZr1/WDrn3k6O1lADehBFVRdIzfFY?=
 =?iso-8859-1?Q?FFZziDWAcJlYG/FsAQyp8nfVSu/TwYgPRGZd8nIp8wjkFqJInvYG6eo7v5?=
 =?iso-8859-1?Q?ZnIQIbBrzM9t/0gv9HS1skWRqxcL6kay+1YHI7P7gXqdO+W/SltfTCn00Y?=
 =?iso-8859-1?Q?iPZ9NyPfd6Qe+Zyq45TCxlFrE2Nx2VtgI5rbCaUlKS8TbogSHF/2MHUNJw?=
 =?iso-8859-1?Q?mrtfde5gYtVR2T2JqMMSeOVUxZjxvD3QK3/hCRsGzwGdY44xAMjY29rVUU?=
 =?iso-8859-1?Q?Ljrp/rL5G8IFTvUb2hM2WBYbdRDUBno6W5ovyHr75uEHa3f3btPL7RPMIL?=
 =?iso-8859-1?Q?8DOPR3Dh6d389yZXrCQAiRn2c4K9fbl9t12yKhq9GWlzAd1VwAXDMgDF+I?=
 =?iso-8859-1?Q?I48sMF2ZN1hoZr/NMpUZsO3kA5mILDZRCgqsGdXGVqkUTYp7cANgn23Mz0?=
 =?iso-8859-1?Q?l+4hmDuErtHej5V1zrStvKBmeBTPHjBCJu/Witi1FUDSjlInDBEdlCv0f2?=
 =?iso-8859-1?Q?xQwXEgZckcOfneCX5ihsOMD5fnwd3PymOZSDMS76opk8CySiyzMZEbvqil?=
 =?iso-8859-1?Q?xze8k9/i6xZ/YVPzuPuhQZdRtQDVcPWfNMuiID2NAVwgvrGwA9uMtviUVz?=
 =?iso-8859-1?Q?n50CFgu2aAlpVEhgT+Pj0LdRXOHrM7ON3c+S6HXix5aq1miBXp5LB8Z00P?=
 =?iso-8859-1?Q?LOh7TgsPbMFmdwO4RO43sil6lBH4Bdu20aLq7PmJgEVFWvlOCp6XAoTWBl?=
 =?iso-8859-1?Q?woiAlvHIgLUfgU/h3bCcFDxhmuJKV/0bFTvaqDfpoINjyMUO9wRU93XLHY?=
 =?iso-8859-1?Q?U0JK+dZ13E5S75tOOwycwSmJu5jpClvCYmeCjm10V9SAVcFUC27bVPFGMf?=
 =?iso-8859-1?Q?YKzsYmWfuT/V6lf9OV/CmCiYesx/Dp6BtV/PNI/Fx+KCZJyvtd+dhRD5d1?=
 =?iso-8859-1?Q?hT4mzSL111vfDvXSBiIXQ2Fru+Oj4njn6Er4a1AMMRStFOi/HNHHTF4RIJ?=
 =?iso-8859-1?Q?Qx/NovE1zl7jtHex6ANlfcfZrgd1pH8WW1TjNXaEQGqzGLOgrsKMQqW3aV?=
 =?iso-8859-1?Q?RHpLhCRv8vPC66c/aYt5hnGLwI1X16CyJE+WW9/KWuQwmgURsECOZrQ3Pw?=
 =?iso-8859-1?Q?8sP+xelNMcQ05McM1VBt2BRF4WXHJsGiRArm9Wz67nryr0vg1YIXqFAuIK?=
 =?iso-8859-1?Q?HzUUDy97B/Ln6Yum9yJGOvAhQltCQ0G1Bj9SYTFcW5RvJSSNWRZ7rDsBpd?=
 =?iso-8859-1?Q?hhGE5HwRZAMWBzSNb65+IYV1tHo3WSEeDKhKstTcGJmJ+76qG/0MkSMf6J?=
 =?iso-8859-1?Q?UW4sF0kEc8XpD7ySQgjbe+8qRGOZ/2k8TM5UctPLFAq+xndaUpPzQky25o?=
 =?iso-8859-1?Q?HRLZlHT9NYSMryLXken2PnHHegUj1WgMnHCYTYw8J0oF3To/amfrvu8zwy?=
 =?iso-8859-1?Q?zv74OvsmEys0yy1hvkuX57cpnR5Q2tV92ILLxEiIPVb5KWTq8SlcNnxE/h?=
 =?iso-8859-1?Q?t0LijR9OILEU3sD4thA5DFqebh3oeAewm10pqF/M8z9CdRD9HyPGAO4b/3?=
 =?iso-8859-1?Q?Mp2qpIVJeE3LWuMyK9vloXoj7jqNg7EGhcYkyh+2z+YIDN56Cg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6299.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003)(38070700021)(7053199007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WK0DzGI19jWymKmv3xVqZHhDQWAm6OubpfiAlmqZdJbOD7zYtrLvupmgcS?=
 =?iso-8859-1?Q?Eo9tfRTxVzv11A+57odrUa3GxH22VXoRmD/OxQCPPB49SahkTFfsOnv25U?=
 =?iso-8859-1?Q?eFpqiUv6CnCF3ymrBO2JFQWJuX4z0ql1Hnq3caqgyHVDs7OVcUV2Ze8zCj?=
 =?iso-8859-1?Q?kdfysMi+xPAyQVx7uBccR9goGNmBkDO326/jblJEB9MF4h3/weKtPHYGce?=
 =?iso-8859-1?Q?bNDcpn58nzZYUQYNDBpYphcjbuyI29OfENxb++DYmSDCV72jZS9Lo+KgXH?=
 =?iso-8859-1?Q?M5YAX39bb2csP7HGtcml5HbPGxvs9gS/pQNDq1nWOhS+4G3icuVnsa1naw?=
 =?iso-8859-1?Q?Vm61IzNgvmG6XW4aHYyEp6FuO18x2nYs2mRLyWi84cWYKzmne6HRA5vHbW?=
 =?iso-8859-1?Q?RDF1OqmAGnNqsQQgH2zyyltc1wEwiUkKXJ34tqVywJAE4ZxV67DV1FqVD7?=
 =?iso-8859-1?Q?gmtBqTlHEKsDYTt8dGRfN4J4mzo7/f1V7rkdDXlgCrPJk3rGvEHNEJTN3/?=
 =?iso-8859-1?Q?RRUIp5Xt6YR46k+vRab5kDtqlY+4SqUTJIW/EAD80Exc5ocm20CXb30INZ?=
 =?iso-8859-1?Q?d/tfe/Jv4q0n05y05EBF4X7xZgCqRS2ZkpIka+dFFyA1R5jPNUzhc2rHv2?=
 =?iso-8859-1?Q?1G6R2g70XMLh6US0bLlH7sNbe7My7h3HZNxgv+aJ3rqruCtU0J4uu1NTLm?=
 =?iso-8859-1?Q?VoFdbH3iNQxIQAQf162/wfiwHMkz6OdYIVbKMLwwVptUoIBoEaX5cH7mKc?=
 =?iso-8859-1?Q?cNAtkV3B092/r8NW2LeQZ9QRhl+frMqXhLQAMCg9O5qdiJmJCOMrrHwYgt?=
 =?iso-8859-1?Q?iD2Zsbq16yGATlrygFb7D3vDciWHF5ksE7QBnVbEuaTa2j1XzK/m1o55B6?=
 =?iso-8859-1?Q?jqGhENiIEgZe65Vu6YEfcYZY6+mjUklo2OkoE/omnzld9ZLE8J2eq5Sh+K?=
 =?iso-8859-1?Q?NkJjb2A0IFc1b3jDLf43tls7XM8bxpT1BEkqo2wxLgVc2fujjoiARLz99H?=
 =?iso-8859-1?Q?CgBlMYw3N7tE8pMO68z//CKHmype5Ztg/4igNqJ3qwUFbmmaY1RVvBJjvx?=
 =?iso-8859-1?Q?rhrZzkaqLPfKHkEOGsRjgqg22b7d/eCWwzv2cLlODrxDWGkMpGBzdEOVee?=
 =?iso-8859-1?Q?AxihGQdh3BcgFgoYCrz8xNBnIRUpY19grNBtT8l0TdWm8e2royzZwIz6qt?=
 =?iso-8859-1?Q?PVLerD2XTzqOu80kioR8NncmC8cu7VuWsgftTraZ+rY/IiL8z2w38IaPew?=
 =?iso-8859-1?Q?kIUfeDSy8Y2S+SfEBJWM8UMUezUkWXnM+lNHi8UhBzorifwGD3rU/d60jF?=
 =?iso-8859-1?Q?TxFw/rtoAGyHUbJp72vnW0lJWkSCSojCBETIYx5WKs6XPElx4B4F/Zy//C?=
 =?iso-8859-1?Q?KZFVozxNhQyFZwLUls5iiJGwyzce8pjV6weOSh8IDaWHyfuzUrUMDl5p8M?=
 =?iso-8859-1?Q?voTqR1g2Lfv5RibLrFJ39FLUEEq4gWFP79OyHv/lIX59DL85z5nCs6wX12?=
 =?iso-8859-1?Q?ZMF7/L1hwadXr2jKZmyNSJQMvY3v2bzEHpWuBaWX/MMGOn273UerbWTHBb?=
 =?iso-8859-1?Q?I39Ze0kyFS7vkkj3mvQ5/DSUjO5NeXQW6GBonRs0jvIrxrpIv1deDHXlap?=
 =?iso-8859-1?Q?rC9yelHQvk9ouB/pfUtByy+DYZnPD7VAx2?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR03MB6299239D2158BC639BDC7DD1E9A7APH0PR03MB6299namp_"
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6299.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db5b66b-3d74-4fd9-997b-08de3403983e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 13:38:37.6892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRx2yuDsldDX4RWGZCe7FoQ8Cr4376sIbOsSROW0yD1syPAgFh17iLjY0HQFgBMeRHfejkuKPXYigHWp+19eVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5893
X-Mailman-Approved-At: Mon, 08 Dec 2025 13:25:37 +0000
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

--_000_PH0PR03MB6299239D2158BC639BDC7DD1E9A7APH0PR03MB6299namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

We were wondering if you have any tips for us. What areas could we investig=
ate or maybe what to look for. We're thinking about adding a small patch to=
 UDL to show that the corruptions appear already in the buffer, but this re=
quires a UDL dock. If it would help with the investigation, we could provid=
e this device for tests. But because of that earlier we decided on EVDI app=
roach, because it does not require additional devices.

Best regards
Jakub Prussak
________________________________
From: Jakub Prussak <Jakub.Prussak@synaptics.com>
Sent: Friday, November 21, 2025 12:08 PM
To: Tvrtko Ursulin <tursulin@ursulin.net>; intel-xe@lists.freedesktop.org <=
intel-xe@lists.freedesktop.org>
Cc: PPD-Penguins <ppdpenguins@synaptics.com>; Lucas De Marchi <lucas.demarc=
hi@intel.com>; Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Rodri=
go Vivi <rodrigo.vivi@intel.com>; Dave Airlie <airlied@redhat.com>
Subject: Re: Cache coherency issues when reading from intel Xe buffer.

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


--_000_PH0PR03MB6299239D2158BC639BDC7DD1E9A7APH0PR03MB6299namp_
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
Hello,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
We were wondering if you have any tips for us. What areas could we investig=
ate or maybe what to look for. We're thinking about adding a small patch to=
 UDL to show that the corruptions appear already in the buffer, but this re=
quires a UDL dock. If it would help
 with the investigation, we could provide this device for tests. But becaus=
e of that earlier we decided on EVDI approach, because it does not require =
additional devices.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best regards</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Jakub Prussak</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jakub Prussak &lt;Jak=
ub.Prussak@synaptics.com&gt;<br>
<b>Sent:</b> Friday, November 21, 2025 12:08 PM<br>
<b>To:</b> Tvrtko Ursulin &lt;tursulin@ursulin.net&gt;; intel-xe@lists.free=
desktop.org &lt;intel-xe@lists.freedesktop.org&gt;<br>
<b>Cc:</b> PPD-Penguins &lt;ppdpenguins@synaptics.com&gt;; Lucas De Marchi =
&lt;lucas.demarchi@intel.com&gt;; Thomas Hellstr=F6m &lt;thomas.hellstrom@l=
inux.intel.com&gt;; Rodrigo Vivi &lt;rodrigo.vivi@intel.com&gt;; Dave Airli=
e &lt;airlied@redhat.com&gt;<br>
<b>Subject:</b> Re: Cache coherency issues when reading from intel Xe buffe=
r.</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
I raised an issue on gitlab to discuss it further there as Jani suggested.<=
/div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Thank you for your help and advices.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15295">h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15295</a>&nbsp;&nbsp=
;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Regards</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Jakub Prussak</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Tvrtko Ursulin &lt;=
tursulin@ursulin.net&gt;<br>
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
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">CAUTION: Email originated externally, do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.<br>
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
</div>
</body>
</html>

--_000_PH0PR03MB6299239D2158BC639BDC7DD1E9A7APH0PR03MB6299namp_--
