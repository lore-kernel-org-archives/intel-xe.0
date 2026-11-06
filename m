Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A1606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=iLeoVZ0D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D58410E8B0;
	Mon,  9 Nov 2026 13:57:15 +0000 (UTC)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45F910F807;
 Fri,  6 Nov 2026 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1793966871;
 bh=RKL+Jq6O2pfebghYB1j2lq21xSpMlV0Qw0R3bOf7GlA=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=iLeoVZ0Dynjy53D8PSDn+bM44qQzig84PJJ41N10+vgcmxbtlhwYPZF9qLW5wL6E5
 BFg3YR5ShU9NEPkSqR+CYlYwAWlaAlrjGznqfxLNayvUgYsvfBjQ6MT2x1c+klhtob
 1CO+1XebrAdJNktTBgCdS86myHrVEvy+CrUlSOmI=
EX-QQ-RecipientCnt: 7
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqRO9CuWAcjeqco6/xKk62mDx0R4/xCnRF0=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: bUHm4PH7GlVFcTGS3fAfhOCI6XVLqGMrh2Zb3jI7J6c=
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1793966865tbb17d3fa
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?SmFuaSBOaWt1bGE=?=" <jani.nikula@linux.intel.com>,
 "=?utf-8?B?am9vbmFzLmxhaHRpbmVu?=" <joonas.lahtinen@linux.intel.com>,
 "=?utf-8?B?aW1yZS5kZWFr?=" <imre.deak@intel.com>,
 "=?utf-8?B?am91bmkuaG9nYW5kZXI=?=" <jouni.hogander@intel.com>
Cc: "=?utf-8?B?aW50ZWwtZ2Z4?=" <intel-gfx@lists.freedesktop.org>,
 "=?utf-8?B?aW50ZWwteGU=?=" <intel-xe@lists.freedesktop.org>,
 "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/display: Don't drop the async-put delay on
 self-requeue
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 6 Nov 2026 20:07:45 +0800
X-Priority: 3
Message-ID: <tencent_4C927CB66A067D2368DD192E@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <134A26B6BCDD3C9C+20261104053910.1065103-1-guanwentao@uniontech.com>
 <a2b152662d219f9be0861e63ddbb78dd1971dc2a@intel.com>
In-Reply-To: <a2b152662d219f9be0861e63ddbb78dd1971dc2a@intel.com>
X-QQ-ReplyHash: 3438078101
X-BIZMAIL-ID: 14064812400548868991
X-Address-Ticket: version=; type=; ticket_id=; id_list=; display_name=;
 session_id=; 
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 06 Nov 2026 20:07:46 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MIHPxziOyMXedoTZoUSZeQDVnMyw46BT4LEQMHI+t9jwJAKZyzBLxPZV
 jndnBOMO4jn/dzENGOQDS42AYhShNAwvMJqMKz+jaGHEEc1WQ4IaTdaTp8nZNdOkkNFelq4
 GVv69kKr9wezKqG7LjApvbhVW2heffBTCFzQ7aDCivpVOemSGxz1Veq/waquEWTpDTyIBdE
 y/D6mIXlga8b8rFdAWi5ZLyaG/BEdMrAyXUqG7F3tmCKJONMb1pxrdldgl7KxGaJUzd3UYI
 Gnw6jDGAvGvPJgDs/ZihOxPRDD98eWoh4SnMa4aDUrN4wKrWcMqclQFUF5dtR2C20NZoEN/
 8Ig48HjWWYstv5GPRrXjB4HbsRttHvPGr+dBu8ZM6P/EFWEx73pUIh2Vwfy0Pd8X3XBAaBo
 uaF8feX6KLLi8bIokT/ZN7rUZsUWpIyjtLf7mxSRN4RPpYigpL61y+3cTnbUTeAMv152L0w
 XZNkRJKno3/EFNDnX8vBHBq5cukGmaHjE2MJAGAdPzIjbx818lLzpXoBvVXD7QPXt0ootpJ
 8eOH3f5KyfCFfgZZDMsgvRipi3REJlJ3pL7GOf//GXfv5VAM/eT5PECmQAOBbbNOm5ln1hE
 gRRN3tcxWs7S9Z9GRFs5uqr4xwyqZUHhutWLCY98+foBn1a8zD8is5KVR2cVnUdF0q0xZ8A
 GA3ekm4cpIYkt0K0euSx01fh1eJJTfyMcU8Ie7r5Axxy7IpoELxFx15tFEKe6/0UNn6k8ZD
 UEzOOVC5K2lLSsg87pHYCTTZ5R4hm0vPdmYPsK1zSg60I5FJHP9b6veYfO0qqEbwKNX7WU7
 ep1KRwkdTtxRrkzjjlXwoE1Xc4XsyzkP2vRS6haxKSiv5pyIySS3h/JuQ1iiQcvkXU0T52W
 kFbD3zrU52ah6YUtN6ToqSG+yXAmRT6MaLbHRE1DTrFYEKAewq+6KLhc4vpVwNG0zKQWCy0
 ie44kXoiOZa37O4UcQMqsijOEP4p5DaQ3SDADKZPr2jIEZkJ/xPc2qs4l7QSuB6bqKLOHFZ
 XMoJ9aFM4z4xeS591Atk9K4F68MMb5SzxkrEcC3CGKV/BzHQ1j/2S/KXka68kvuVuq43Kec
 hCeetZmxgvoHf+sQw36zEHxOxCXNN8DKQ==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Mon, 09 Nov 2026 13:57:00 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksDQoNCj4gT24gV2VkLCAwNCBOb3YgMjAyNiwgV2VudGFvIEd1YW4gPGd1YW53ZW50YW9A
dW5pb250ZWNoLmNvbT4gd3JvdGU6DQo+ID4gY2FuY2VsX2FzeW5jX3B1dF93b3JrKCkgYWxz
byBjbGVhcnMgYXN5bmNfcHV0X25leHRfZGVsYXksIHNvIG1vdmluZyBpdA0KPiA+IGFoZWFk
IG9mIHRoZSByZXF1ZXVlIGluIGludGVsX2Rpc3BsYXlfcG93ZXJfcHV0X2FzeW5jX3dvcmso
KSBtYWtlcyB0aGUNCj4gPiByZXF1ZXVlIGFsd2F5cyB1c2UgYSB6ZXJvIGRlbGF5LiBUaGF0
IGRpc2NhcmRzIHRoZSBkZWxheSBhY2N1bXVsYXRlZCBieQ0KPiA+IGNvbmN1cnJlbnQgYXN5
bmMgcHV0cywgaW5jbHVkaW5nIHRoZSAxNyBtcyBEQy1zdGF0ZSBhbnRpLXRvZ2dsZSBkZWxh
eQ0KPiA+IHJlcXVlc3RlZCBmb3IgUE9XRVJfRE9NQUlOX0RDX09GRi4NCj4gPg0KPiA+IFVz
ZSBjYW5jZWxfZGVsYXllZF93b3JrKCkgZGlyZWN0bHkgdG8gY2FuY2VsIHRoZSBzdGFsZSBp
bnN0YW5jZSB3aXRob3V0DQo+ID4gY2xlYXJpbmcgdGhlIGRlbGF5LCBhbmQgY2xlYXIgdGhl
IGRlbGF5IG9ubHkgYWZ0ZXIgdGhlIHJlcXVldWUgaGFzDQo+ID4gY29uc3VtZWQgaXQuDQo+
ID4NCj4gPiBGaXhlczogMzBjYTYzNjViYjQyICgiZHJtL2k5MTU6IEZpeCBhc3NlcnQgb24g
cGVuZGluZyBhc3luYy1wdXQgcG93ZXIgZG9tYWluIHdvcmsgd2hlbiBpdCByZXF1ZXVlcyBp
dHNlbGYiKQ0KPiA+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2Ni4xMSsNCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXZW50YW8gR3VhbiA8Z3VhbndlbnRhb0B1bmlvbnRlY2guY29t
Pg0KPiANCj4gSG93IGRpZCB5b3UgZmluZCB0aGlzPw0KRHVyaW5nIGEgc3RhYmxlIGJ1Z2Zp
eCBiYWNrcG9ydCB3b3JrLCBmb3VuZCBieSBnaXRodWIgY29waWxvdCBtYXgoZ3B0LTYuMS1z
b2xbUmVhc29uaW5nRWZmb3J0PXhoaWdoXSkuDQoNCj4gSXMgdGhlcmUgYSBidWcgcmVwb3J0
IGFib3V0IHRoaXM/DQpKdXN0IHNlZTogaHR0cHM6Ly9naXRodWIuY29tL2RlZXBpbi1jb21t
dW5pdHkva2VybmVsL3B1bGwvMjIzOSNkaXNjdXNzaW9uX3I0NDYzNzE4ODgzDQoNCj4gSG93
IGRpZCB5b3UgdGVzdCB0aGlzPw0KUmV2aWV3IGFnYWluLCBidWlsZCBhZ2FpbiwgaW50ZWdh
dGlvbiBieSBhbm90aG9yIG9uZS4NCkl0IGlzIG5vdCB0aGUgb3JpZ2luYWwgYnVnIHdlIG1l
dCwgdGhlIGJ1ZyBzb3ZsZWQgYnkgYmFja3BvcnQgbWFueSBpOTE1IHVwZGF0ZSBjb21taXRz
IGFzIHRoZW0gaW4gbWFpbmxpbmUuDQoNCkJScw0KV2VudGFvIEd1YW4=

