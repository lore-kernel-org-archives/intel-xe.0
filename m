Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B55EEAA4E
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B8410E133;
	Thu, 14 Sep 2023 15:14:07 +0000 (UTC)
X-Greylist: delayed 3154 seconds by postgrey-1.36 at gabe;
 Thu, 14 Sep 2023 15:14:05 UTC
Received: from cluster-e.mailcontrol.com (cluster-e.mailcontrol.com
 [85.115.58.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9FC10E133
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:14:05 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly13e.srv.mailcontrol.com (MailControl) with ESMTP id 38EELLSC032189;
 Thu, 14 Sep 2023 15:21:21 +0100
Received: from rly13e.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 38EELIwU031509
 (TLS bits=256 verify=OK); Thu, 14 Sep 2023 15:21:21 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly13e.srv.mailcontrol.com (MailControl) id 38EEL6Bu029868;
 Thu, 14 Sep 2023 15:21:06 +0100
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2238.outbound.protection.outlook.com [104.47.51.238])
 by rly13e-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 38EEKU2L023171
 (TLS bits=256 verify=OK); Thu, 14 Sep 2023 15:21:06 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxgyUmCixrZndMtb9xnADQs4WQyic9hu2vtroQLwlBue072HsPlansZzcjBVAK8FS9K7BiBefax2IoOyCl+gyc0XkJLiu7KpxWnmqaMH7FDP4OjiWC0Ci3Cwme9TcNPszj0y86owp3PliVyRXCv6TD50yCA3XBkLEyTy+DKXrm9aM71uLNHOmzRLW9YdJJ6yeP/ATcqVMN1Bu1QY7TTO526mHQzSpSaS/0qTDaYwFrmf5woKBb3ZCRxeQJw5vXIPg4n+P67gUB87OpxU+3mtTcrtlcKClbSQPxjoc6UimhErkqjNpyStHbGLbev6AKI9S5KASnbAzOzqk6J9BSU1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR3q/z1Jbpe/WSsbYSXwXwqnn90aYWIlAQ8RI/uelRU=;
 b=ZsD8DZ6asIdb1ukRESSG0OSGV0mQbCOKlYWxkwLTzGhZc81HbB5FBlVSpO7jFl7bUJ4sZOEnrmwnCTQaandRlb9iy4la63m3j+sn9GNb2Lbc2KNDH9phIl5kyNdmd+5OVw6odWfmpQDQcc0i46VQA8VPZ3biAh/TiltvmDZnAJRMqLs5k+hkJdK9z6no2vCfbU8+aJhxu8IkHZYnepIWOVRUOYdptAF611bQ3Fci1maF1bXfXNRfflD+U74aOo7CNW7f6BGrVqRMUJg8C2Y1oqGDsog+oislmX64odfSwhirUahJwqmul3f03wdPyOaDZbRVg4tdZxj73vxSTG5dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR3q/z1Jbpe/WSsbYSXwXwqnn90aYWIlAQ8RI/uelRU=;
 b=FD5Yz/gF3LUFavWWaqbPMes9gejrDtaa6vypI2CLXrp46kacRtOX1CBbcWvsWkTEAaY+Vh1+DD3j7HjLW6fmza7Y+RaCdHk+nrjkJE1CyQIOjMn1XFuxWoZ8bFzh7LF63wAqVPwwKpgpjxbLYsvX6ppXzBSVDYK0RMC96x///vZhcpXJmPmjaEg+HHchVFE/KtDIOf/Rgxi2UPj5495OXOqwPH0HqqOqj48FaVOYQ/pjpwFbf+jw98gHK8tN38R8H6VqhJ4iQkiaEA7lf74dnu3ALd2YTz7JqT6OAjdzCrkz21TsutDm47aMHuN2dSL838ZH8Z9f7iOZznQpJQGNMw==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by VI1PR02MB5808.eurprd02.prod.outlook.com (2603:10a6:803:132::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 14:20:27 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 14:20:27 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Jani Nikula <jani.nikula@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, "daniel.vetter@ffwll.ch"
 <daniel.vetter@ffwll.ch>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
Thread-Index: AQHZ4cJ38SDN4jXuXEKkP+/AO6NU1bAURcqAgAC7nwCAAAn5AIABUGuAgACK+YCAACl6AIAAe20AgAJ9xQCAAGBAgA==
Date: Thu, 14 Sep 2023 14:20:27 +0000
Message-ID: <0d208249-a467-9c35-4c38-2bd9dd56f611@habana.ai>
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai> <87v8cfd4t7.fsf@intel.com>
 <d763fd15-0732-8cd2-a24f-055a5855544a@habana.ai> <87h6nxw3rl.fsf@intel.com>
In-Reply-To: <87h6nxw3rl.fsf@intel.com>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|VI1PR02MB5808:EE_
x-ms-office365-filtering-correlation-id: d4964420-1484-4cdb-cbe7-08dbb52dbe65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TnMTIH/TYoNBqab0gMzE6LcWTEUZCo6VfwykXXUCz7oEPFxZdtBnIlwJDdPlvPvcoAF4I7AuE7pkTciSDnXDvUUeYnRby3rOY96uT8/zfk22yoB+O9i7R81dvDrt6N8yu63dwxOvrE5OlC1DHBzuH5Sf5pryTmlYGgBdxfbZ2QvibPODoEhPYG59Wow21mWW2iLA8u2vhkVxmcpYc62Q46jw6/hgDhD7OhKIWmvIc7P8W0adVkueZi62ifS416KQCnOlJpwyfBykYfbIgsrGy0Ix8jYlRjOXhFpJilyGy1XVl0P07xzey+abysj59qNrM7Vxn6ACG5e9lFE7I2dM3v5+iKz6PwC5QcpG7dwsg/s5WbGuuXzwHnEFKGw7j9fz2IKzjn4G4uw+xkSBh6o7KeWZQHFlYc/g512nVw1h6TEA2krN1ncrqVYyAKrYgb+mCOmJszH/q22giizzFSWzW8bfDvexL47fXvMMSRVrV2uIJM3Zmg6THv2kMzI7gnYm1zTG094FZY6vbFuf4xIJNOm1lry4VhKvfiGdVLEX246vnctj9LqFw6nz0Fjkt84ktS9pzhBdS99EjpmEuiyKD1HA+dM0vNCJlXHqHxCW3BDZ3tExdHOCoG9Ya/f5xkCrIrSUq19ZE942rl+0muDDRcZ7xu5wUg06ClTE0WHbI9g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39840400004)(186009)(1800799009)(451199024)(6512007)(71200400001)(6486002)(6506007)(53546011)(38070700005)(38100700002)(2616005)(110136005)(91956017)(66946007)(66556008)(86362001)(966005)(31696002)(478600001)(83380400001)(76116006)(122000001)(26005)(82960400001)(66476007)(54906003)(2906002)(5660300002)(66446008)(36756003)(4326008)(64756008)(41300700001)(316002)(8936002)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXYxNDFYSnZINFAzdEZxYkNWYndQSFdnNTRpWTlVcVZjVngyam50V29HdXdB?=
 =?utf-8?B?Uk50eXdUbERtU0lPZW1kOGlHWkZTakZHdWRKdzUyMDJTU1dTaWIvNVZ4MkJZ?=
 =?utf-8?B?VGJBQW9KYjV4Rm9yRTk4NjZJQURVNjNXZTl6VG43eGpOTkJ4bkYyaWFNYlVt?=
 =?utf-8?B?d1dtc2llYVU2aVJReGp1RktRSFZSdm9wNlZhdGNtMGFFbEU5YkZiSEVya1Bv?=
 =?utf-8?B?L0IvZVFRUTA1OTFBZ2ZGK2djUWhpUjlmSm9xclZROWF0Q0ZGaDNXR0tjMTcw?=
 =?utf-8?B?Ly9UazlOMlFFNC8wZjBsakRIV1k2WVdzSWM3RVRwZnlCQmZYakpsYnExK1Fw?=
 =?utf-8?B?SlEwRkh5bElUcm1aMU14ZWpjeWh6QmZDcUJsQ1ZnKy91NEZkeVJ6Um92ZkhR?=
 =?utf-8?B?RHhpYTEyaVRQanN5MXhoOGg5L01FK0h4cUlsVW12UU1ZNVR5RVVCNk03aE5B?=
 =?utf-8?B?YUYrOWxiWm43Q1pWaXh4ZmxZNXArc1hhc3FCZVhsRmw1OENsUjhlVFI0YUtV?=
 =?utf-8?B?aS9HRnZzcVE1SlFvbmpTZzdMVlBKTW1WMHFzU3hLcmlwdHZQeUJvaEl0WUpw?=
 =?utf-8?B?VEw2eThjK1BmMW4wMXJCc2FsRTk5b25DUytyYlhXMFErNWNJdHlrQnBKNXA2?=
 =?utf-8?B?UDU4dW10bTkxWVgxMlhGMFBDWVYzbDBkM0hCclBwYytXK1pYNFh3NTROMFF5?=
 =?utf-8?B?NXhtNDNEM1dvT1ZCU05EUzI0RjJRb2FiWkdSZVlJQUJHS2Jielpkd3BkVDFG?=
 =?utf-8?B?S2J5TmpJWEJGRkJJRTl0UWx0Y1JUWWQzQnF6Tkh1OFd0OTNSMENFUUdVTEps?=
 =?utf-8?B?SU1CMWVoZFp4ZjNuVGRPeFlrSEFvU0FyZWNncDVlYjFOVkZETkJXZEQ3SWNB?=
 =?utf-8?B?bUg3V2ZKUjRWcGZCYW9pcUxLVDlMNS9NenJDTlN4VCs0bFgvVWVUYnRySnpy?=
 =?utf-8?B?MTJCaHF4K2w5VjlJT1hDWWlhRVlocHRrYVJ5T0svcmJJSUcrYU1KWjVwZEpH?=
 =?utf-8?B?cmEyRllNcmpaeWcyYWx5U0s0RnFzV1NmTFNsdVdZV0cybXJjK3NjZFlSanFE?=
 =?utf-8?B?SXVTd2t0TUl3ajZoaTN2c0ZHS3dEMVhBcmwrcnQyVTVUS3c5TzFZdmdzY3ln?=
 =?utf-8?B?OCtKNDI1L1piQUs0ejhQSWh2TDhqeUN1UG9zSkJpV1dKVUJvRnFadVA1YlFj?=
 =?utf-8?B?YUVvWC9FczdrWXJlY3AwTmVFSUJ1anF4dnY0dCtYYzBxR2phelpzdFBtR3RD?=
 =?utf-8?B?eVVSSS96MnlRdlg3MUluaFltUmVBMTVkU1NPait3eExPb1dhT1FhWmVZZE16?=
 =?utf-8?B?ZW81dlQ4WWtEVlgzekdId2dpOU9ZQjYzdUljaS9KNGFOV1RtOWZDeU1VdWNR?=
 =?utf-8?B?QW42azJhSnMzdDhEVldJM0FjLzNOVGNKclppVjhMMzJzZE1HcWZsbXp2VWtv?=
 =?utf-8?B?V0VlV3VMZHl2WGRUU2Y4L2tKQitpMUZ1UkJXcTVFY0ZjMUtXY3QvamNTY2Nw?=
 =?utf-8?B?aTNlcVZ0MWlpa1FMYWcwQzV0YWo3S0EvTnZpVDM5YzVYZ2IwWTdGbEsvSU1t?=
 =?utf-8?B?bEp2Q1JSL29Mdy9lbi9aMWxMOFFOTVQ5TStFRWlYNXdBdFRqbytxeEVkcE9X?=
 =?utf-8?B?em9iMEY3UVZQVXdaVnhYNFU2N2xqbXVzdFo0OFlKcjhlRXZJZVE4VjBtbUs1?=
 =?utf-8?B?WXVRL2lQWnVUYXJHQisvNHZaL1VlcWdES2daSHdOT0lrRDJwd1BZSkg5OTNT?=
 =?utf-8?B?ZHd2ZUt1MXN6b1FjTm9ZaEFCTEJsczR4YlVtOU5KTVd1UXZVZ2dpK3VqcEpy?=
 =?utf-8?B?ak1rUm5zQnlQbFNCUm9tbUp1NlpvRWNCeTJmNGR2aUYvOCt2Wk9LTFFIK0ZX?=
 =?utf-8?B?ZjFpUUdZa2FuaHRRb2VML3ZTRWxiYnBTcmJTZW9rRVdSOGZrYnErNmFxK3h4?=
 =?utf-8?B?WEhHSlEyRW5sbmdzVGh5RCs2TnJnWHVMdlo4ekp6MnZUK0xFQmVDY1k0dDZt?=
 =?utf-8?B?b2k1UE1OQ0l3TDhFL3JNaEJRNCtWU2ltaDdpblpjeG1NUXFUMEN5ZjJKTHVO?=
 =?utf-8?B?V213M3ZJanJFb3Y1N3labkdDeEZQZjZHUmNkcW1sMGRLNUVWS1BpYTU2RHBS?=
 =?utf-8?Q?TD1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C68408E7EDFCE409102E0896EAC9B0F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: coRAcIa1+gpTbh6Im0xGdMWOPUXUc7f6kFFnpzMoJgZOXfEVbAh4x4Og/uPFkGGWIDPMB4OtpKfdh1hBtJQSbRThOIO3ruLrGUbIvz/eByp02cJuSuhQF3u4HryWUBZE8PCdoP1sjfiZCW9kGEBbGxgLnE4k2uPsMeCo/a8JwoFUBzDjM53x4dISo/q9vE+gO8wihA04K+hLJMZEaDIu2xsBr67Vc2tCUpMOZak7rvD6sPsNxoJhthVQiS906P61ZZ9hyFd68ZLe2QlMYHYLKXgz11E5UwPmrcPEiHvD2f0fArqFbxjw9wQqkKwgQ1F7+WIBXfGJphYJol4UODATl7YwXSLZQ8O4Y59IRlx0B5z+B28N1iXuXgsIie/5qi6I8ciUY6nnJscwl1BPFkpN/QLpdCTl79IlQC6wnsLKjxwm4oBqqU6oXiaDCAhikHhfMYyUIryeBk1VMXwHyLVef9S+MVzgp0jBUJTI0gb9ZaFcu473vYgk0xJiVmM/ig4a4oXZD4uHZz4bR6ysFszWBlO2pSS+g+ODlADQT6HWJ0RwbWNS85kqug3L274iw4dqlQ4ujM3IqDRYPg80ETu6Lv+ViKpXbZpdlaMce43ggHhp43/FZGCAuVJfP7taSXIhMU2QTZIroKD17ZQdq96IffUUdVx/jXhVMwximO5//p87PHIDavuAizPed0meFmxm6x6sqNz8pMurrSaCVFbrr5mJBmQ66SYLOLfGF8TAiS8e4AnzP7ZaY1UlNCTGjyyYPbm9Vgf3SIVCDp+LLQ684u11kHpeIgbb+K/MdG4a/cKygFeXrCIGzv8A7xlH7i0XiigWfeO3NG1/nzlkXM7BVXrdIlCby+NENZgqIy/esY8=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4964420-1484-4cdb-cbe7-08dbb52dbe65
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 14:20:27.5501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goBm5EYmvhzCBitrCm39xJqdQsT3YjYTfd2ahB5/JArz3XxNx0vLjN9jc5dSz01CZCV5UNALUj/aMx71/TAFJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5808
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NDcwMTI4MDpGUEtleTEucHJpdjqg9FUapqafIa+87baEeO3+hWMRXwbpPZIWYFV2FTZSA5UXsE1QQRWEEWSmR0mNIoj0jXj/w7b7zfzGGkDIQ6nI1AF389ribAR/JlK6ZwEZBNae3JUeWuT2LPWnV8agTKau+zTNHFPCWJUCdlemRNET57ySp6sBZouWZW8B8PxGqQQ9J2+cVblMg+VF1MluB2oT25zY8PW2WWkyr5KhXyeX7qWNKB6zqKn/Dg+Sd5kPVdagwcSj4tnA3L4rj4SuWwPZJTPUUcQdrk7D6tve4raWlbsKBbGk31dYnLQ5U1IeTwH0dn6CzHKTx2RaFy+szCNQMn5Dx56Grd7GqUGFSjUe
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.51.238
X-Mailcontrol-Refers-To: 38EELIwU031509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=jR3q/z1Jbpe/WSsbYSXwXwqnn90aYWIlAQ8RI/uelRU=;
 b=Kog3p5P7b/8eePvOfqqKi0q2nQYcl770NfQaoLhuSbQjSDC42dRLHF7vx4lKDBw3rd4yJ3J0EL2VJVIQTwPLmyd1kP+5oeqSIx1rm2dnqxiSHP/wmm1wkUzECy/jDxK3GgIjq0gfbHT1v7qx+KNZSZBRiedb1rU96eHfRha0IGbf7P9ckFv0dZXUls31+VYMAPWgmvcGB21RW+EARQcKfXOnyrQz3SW0/xvToJUT41QXl55t6BEfDJMGtCykOVEzYftDVWsieo4kK9eGFuaV1rE5s7eBNlo8apt9sF79WIlRi9BrxBIgCpZvjMPObFOocDTCKhb/P2a/gocZIaVoFg==
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMTQvMDkvMjAyMyAxMTozNSwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+IE9uIFR1ZSwgMTIgU2Vw
IDIwMjMsIE9maXIgQml0dG9uIDxvYml0dG9uQGhhYmFuYS5haT4gd3JvdGU6DQo+PiBPbiAxMi8w
OS8yMDIzIDE0OjExLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4+PiBPbiBUdWUsIDEyIFNlcCAyMDIz
LCBPZmlyIEJpdHRvbiA8b2JpdHRvbkBoYWJhbmEuYWk+IHdyb3RlOg0KPj4+PiBPbiAxMi8wOS8y
MDIzIDM6MjUsIE1hdHQgUm9wZXIgd3JvdGU6DQo+Pj4+IEhleSBNYXR0LCBJIHRvdGFsbHkgdW5k
ZXNyc3RhbmQgeW91ciBjb25jZXJuLCBJIG1pZ2h0IGhhdmUgYW5vdGhlcg0KPj4+PiBzdWdnZXN0
aW9uLiBXZSBjYW4gY3JlYXRlIGFub3RoZXIgRkQgaW4gZGVidWdmcyBhbmQgbW92ZSB0aGlzIGlv
Y3RsDQo+Pj4+IHRoZXJlIChJIGNhbiB0YWtlIG93bmVyc2hpcCBvbiB0aGlzKSwgVGhpcyB3YXkg
QUJJIGlzIG5vdCBhbiBpc3N1ZS4NCj4+Pg0KPj4+IEZEIG9yIGlvY3RsIGluIGRlYnVnZnM/IE9y
IGRvIHlvdSBqdXN0IG1lYW4gYWRkaW5nIGEgZGVidWdmcyBmaWxlIGZvcg0KPj4+IHJlZ2lzdGVy
IGFjY2Vzcz8NCj4+Pg0KPj4+IEJSLA0KPj4+IEphbmkuDQo+Pj4NCj4+DQo+PiBBZGQgYSBuZXcg
ZmlsZSBpbiBkZWJ1Z2ZzIHRvIHdoaWNoIHdlIHdpbGwgc2VuZCBkZWJ1ZyBpb2N0bHMgc3VjaCBh
cyB0aGUNCj4+IG1taW8gaW9jdGwuDQo+IA0KPiBJdCdzIHNvIHJhcmUgdG8gZG8gaW9jdGwgb24g
ZGVidWdmcyBmaWxlcyB0aGF0IEkgZmlyc3QgaGFkIHRvIGNoZWNrIGl0J3MNCj4gcG9zc2libGUs
IGFuZCB0aGVuIHRyeSB0byBmaW5kIGV4YW1wbGVzIGluIHRoZSBrZXJuZWwuIEkgZm91bmQgb25l
IHNvDQo+IGZhciwgdGhvdWdoIHRoZXJlIGFyZSBwcm9iYWJseSBtb3JlLg0KPiANCj4gSWYgaXQn
cyB0aGF0IHJhcmUsIHVzdWFsbHkgdGhlIHF1ZXN0aW9uIGlzLCBkb2VzIGl0IG1ha2Ugc2Vuc2U/
DQo+IA0KPiANCj4gQlIsDQo+IEphbmkuDQo+IA0KPiANCg0KSSBhY3R1YWxseSBnb3QgdGhpcyBp
ZGVhIGZyb20gRGFuaWVsIGZldyBtb250aHMgYmFjayBkdXJpbmcgYSBkaWZmZXJlbnQNCmRpc2N1
c3Npb24uIERhbmllbCBhbnkgdGhvdWdodHMgb24gdGhpcz8NCg0KSWYgeW91IGFyZSB1bmNvbWZv
cnRhYmxlIHdpdGggdGhlIGlvY3RsIGFwcHJvYWNoIHdlIGNhbiBnbyB3aXRoIGEgDQpkaWZmZXJl
bnQgYXBwcm9hY2gsIGZvciBleGFtcGxlIHdoYXQgd2UgZGlkIGluIHRoZSBoYWJhbmFsYWJzIGRy
aXZlcjoNCg0Kc2V0dGluZyByZWFkL3dyaXRlIGFkZHJlc3M6DQpodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC92Ni42LXJjMS9zb3VyY2UvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2Nv
bW1vbi9kZWJ1Z2ZzLmMjTDE2MzANCg0KcmVhZDMyOg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuNi1yYzEvc291cmNlL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24v
ZGVidWdmcy5jI0w4NDQNCg0KSSBsaWtlZCB0aGUgaW9jdGwgYXBwcm9hY2ggc28gbXVjaCBiZWNh
dXNlIGl0IHJlcXVpcmVzIGEgc2luZ2xlIHN5c3RlbQ0KY2FsbCBpbnN0ZWFkIG9mIDIgYW5kIHRo
ZSBpbXBsZW1lbnRhdGlvbiBpcyBtdWNoIGNsZWFuZXIuDQoNCk9maXIuDQoNCg0K
