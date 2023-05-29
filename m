Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B475C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 10:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3577510E272;
	Mon, 29 May 2023 10:31:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738E210E272
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 10:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685356285; x=1716892285;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=X18Vs163Ez1WS1yqGg/LCv3N9dSYyK4zitpMm26vhwQ=;
 b=cazqXXR/3DnCNwfaoCJG/V8OVhKTyrex6Vj6yzi6prAR+v79MJxC8Fvg
 Y6z4iH1YZKb6iNBiHNrpRYQruZT6zG+MfOXpS+TVjjyMwLWoM9tW3bXFg
 wZ08guPq72Xp3kEAXg2HWG0m3jywLZ+pZPvi5RKBxQGcvqTBh4jDc6c1E
 alTlnDDYEt1aeLRYzmYKe0QhQfm+SxgcaOC8NpPPtnBPosBfXjI16wBld
 Hd4HuqQsxqFdCqu7Ih05mAx21Cgte0wnUk5sLaYx+f5DTWFPdAR/4vJua
 AKqOKzVRm8Y4FWMJxEfvcAmfY+hFb+yzhYKja/e18N67JC8GKzhy7Groj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354689532"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="354689532"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 03:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="706018288"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="706018288"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 03:31:23 -0700
Message-ID: <cba9fb1a0374286bf847325d4d574e7d9b9b665d.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 12:31:20 +0200
In-Reply-To: <323d497f6ea67a8eb813ffac043393644c57fa67.camel@linux.intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <323d497f6ea67a8eb813ffac043393644c57fa67.camel@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Disable interruptable wait on
 xe_bo_move()
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

T24gTW9uLCAyMDIzLTA1LTI5IGF0IDEwOjU5ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToKPiBPbiBGcmksIDIwMjMtMDUtMjYgYXQgMTI6MDYgLTA3MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6Cj4gPiBBbGwgdGhlIFhlIHVzZXJzIG9mIGRtYV9yZXN2X3dhaXRfdGltZW91
dCgpIGFsc28gZGlzYWJsZSB0aGUKPiA+IGludGVycnVwdGFibGUgd2FpdC4KPiA+IEFuZCBkb2lu
ZyBzbyB0aGlzIGF2b2lkcyBEUk1fSU9DVExfWEVfRVhFQyBmYWlscyB3aGVuIHVuZGVyIG1lbW9y
eQo+ID4gcHJlc3N1cmUuCj4gCj4gSW50ZXJydXB0aWJsZSB3YWl0cyBhcmUgY3J1Y2lhbCBmb3Ig
c2lnbmFsIGRlbGl2ZXJ5IGxhdGVuY3kgYW5kIGZvcgo+IHVzZXIgZXhwZXJpZW5jZSAoYmVpbmcg
YWJsZSB0byBjdHJsLWMgYXdheSBmcm9tIHNvbXRldGhpbmcgdGhhdCBpcwo+IHN0dWNrKS4KPiAK
PiBVbmludGVycnVwdGlibGUgd2FpdHMgc2hvdWxkIG9ubHkgZXZlciBiZSB1c2VkIGluIHNpdHVh
dGlvbnMgd2hlcmUKPiBpdCdzCj4gaW1wb3NzaWJsZSB0byByZWNvdmVyIGZyb20gYW4gZXJyb3Is
IGxpa2UgaW4gZXJyb3Igb3IgcG9zc2libHkKPiBkZXN0cnVjdGlvbiBwYXRocy4KPiAKPiBJbiB0
aGlzIGNhc2UgZXhlY2J1ZiBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgdGhlIC1FSU5UUiByZXR1
cm5lZAo+IGZyb20KPiB0aGUgaW9jdGwgYW5kIHJlc3RhcnQuIElmIGl0IGRvZXNuJ3QgdGhlcmUn
cyBhbiBlcnJvciBlbHNld2hlcmUuCj4gCj4gQnV0IE1hYXJ0ZW4gaGFkIGEgcGF0Y2ggdG8gcmV0
dXJuIHRoZSByZWFsIGVycm9yIGNvZGUgcmF0aGVyIHRoYW4KPiByZXdyaXRpbmcgaXQgdG8gLUVU
SU1FLgo+IAo+IC9UaG9tYXMKClVwb24gY2xvc2VyIGluc3BlY3Rpb24gb2YgdGhlIGNvZGUsIHRo
YXQgYm9vbCBub3cgc2V0IHRvIHRydWUgc2hvdWxkCnJlYWxseSBiZSBjdHgtPmludGVycnVwdGli
bGUuIFN0aWxsIE1hYXJ0ZW4ncyBwYXRjaCB3b3VsZCBiZSBuZWVkZWQgdG8KYXZvaWQgdGhlIC1F
VElNRSByZXdyaXRlLCB0aG91Z2guCgovVGhvbWFzCgoKPiAKPiAKPiAKPiA+IAo+ID4gTGluazog
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvMjM5
Cj4gPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPgo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
YyB8IDIgKy0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYwo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYwo+ID4gaW5kZXggMGRiOWMwNTA5N2QwNy4uNmVk
N2UwODI2OWU4MiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYwo+ID4gQEAgLTYwOSw3ICs2MDksNyBA
QCBzdGF0aWMgaW50IHhlX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0Cj4gPiAqdHRt
X2JvLCBib29sIGV2aWN0LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXdfbWVtLT5tZW1f
dHlwZSA9PSBYRV9QTF9TWVNURU0pIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbG9uZyB0aW1lb3V0ID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0KHR0bV9iby0KPiA+ID4gYmFz
ZS5yZXN2LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAKPiA+IERNQV9SRVNWX1VTQUdFX0JPT0tLRUVQLAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0cnVlLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWxzZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiBNQVhfU0NIRURVTEVfVElNRU9VVCk7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh0aW1lb3V0IDw9IDApIHsKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC1F
VElNRTsKPiAKCg==

