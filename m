Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7448CC77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 08:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4613310E253;
	Mon, 29 May 2023 08:59:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0E710E253
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 08:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685350783; x=1716886783;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=67MDx32E39bF88c7hkrevu3LIreHpgxGhkT8oyf4poI=;
 b=eCpeUOgyWWWPhZPXud2Lax15ZHgVOJU4BHnRKG0MfS4xj5vy8VFlD/Zq
 1TeAf4LaSIByC5AQ+ucnuNn/0iW4NjCB5mIwJLjEqKANWSdKysNTdTt6X
 vT1UMveEXKLo87NhDrOEanvheYZUFf7PfS0TJtRi51b1A2SfaXv26Rd2P
 OBS+NUARrkhF3vhxaQJfTub3KheifRhCHPsYkRZRFoZdTWr9TCGMnySid
 1jPITaHF5mB6O0swvGe7HGRUJg8baX9GJd8s+yDTEBOmm7BBlbuNTQKkg
 Hi7a5CajYOQ0M/dUE9xWponkU6J0bfU2fx+OZFa3ymtUAcDFPIXfKkJwB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="353504385"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="353504385"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="700184370"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="700184370"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:59:25 -0700
Message-ID: <323d497f6ea67a8eb813ffac043393644c57fa67.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 10:59:22 +0200
In-Reply-To: <20230526190609.61529-1-jose.souza@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
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

T24gRnJpLCAyMDIzLTA1LTI2IGF0IDEyOjA2IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOgo+IEFsbCB0aGUgWGUgdXNlcnMgb2YgZG1hX3Jlc3Zfd2FpdF90aW1lb3V0KCkgYWxz
byBkaXNhYmxlIHRoZQo+IGludGVycnVwdGFibGUgd2FpdC4KPiBBbmQgZG9pbmcgc28gdGhpcyBh
dm9pZHMgRFJNX0lPQ1RMX1hFX0VYRUMgZmFpbHMgd2hlbiB1bmRlciBtZW1vcnkKPiBwcmVzc3Vy
ZS4KCkludGVycnVwdGlibGUgd2FpdHMgYXJlIGNydWNpYWwgZm9yIHNpZ25hbCBkZWxpdmVyeSBs
YXRlbmN5IGFuZCBmb3IKdXNlciBleHBlcmllbmNlIChiZWluZyBhYmxlIHRvIGN0cmwtYyBhd2F5
IGZyb20gc29tdGV0aGluZyB0aGF0IGlzCnN0dWNrKS4KClVuaW50ZXJydXB0aWJsZSB3YWl0cyBz
aG91bGQgb25seSBldmVyIGJlIHVzZWQgaW4gc2l0dWF0aW9ucyB3aGVyZSBpdCdzCmltcG9zc2li
bGUgdG8gcmVjb3ZlciBmcm9tIGFuIGVycm9yLCBsaWtlIGluIGVycm9yIG9yIHBvc3NpYmx5CmRl
c3RydWN0aW9uIHBhdGhzLgoKSW4gdGhpcyBjYXNlIGV4ZWNidWYgc2hvdWxkIGJlIGFibGUgdG8g
aGFuZGxlIHRoZSAtRUlOVFIgcmV0dXJuZWQgZnJvbQp0aGUgaW9jdGwgYW5kIHJlc3RhcnQuIElm
IGl0IGRvZXNuJ3QgdGhlcmUncyBhbiBlcnJvciBlbHNld2hlcmUuCgpCdXQgTWFhcnRlbiBoYWQg
YSBwYXRjaCB0byByZXR1cm4gdGhlIHJlYWwgZXJyb3IgY29kZSByYXRoZXIgdGhhbgpyZXdyaXRp
bmcgaXQgdG8gLUVUSU1FLgoKL1Rob21hcwoKCgo+IAo+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzIzOQo+IENjOiBUaG9tYXMgSGVs
bHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Cj4gLS0t
Cj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jCj4gaW5kZXgg
MGRiOWMwNTA5N2QwNy4uNmVkN2UwODI2OWU4MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jCj4gQEAgLTYw
OSw3ICs2MDksNyBAQCBzdGF0aWMgaW50IHhlX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0Cj4gKnR0bV9ibywgYm9vbCBldmljdCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ld19t
ZW0tPm1lbV90eXBlID09IFhFX1BMX1NZU1RFTSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgbG9uZyB0aW1lb3V0ID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0KHR0bV9iby0KPiA+
YmFzZS5yZXN2LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgCj4gRE1BX1JFU1ZfVVNBR0VfQk9PS0tFRVAsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0cnVlLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFsc2UsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBNQVhfU0NIRURVTEVfVElNRU9VVCk7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAodGltZW91dCA8PSAwKSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gLUVUSU1FOwoK

